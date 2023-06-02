//
//  AudioPlayerViewModel.swift
//  PitchDemo
//
//  Created by Doyeon on 2023/06/02.
//

import AVFoundation
import Combine

class AudioPlayerViewModel: ObservableObject {
    let audioEngine = AVAudioEngine()
    let audioPlayer = AVAudioPlayerNode()
    let audioPitch = AVAudioUnitTimePitch()
    var audioFile: AVAudioFile?
    
    @Published var pitchValue: Float = 0 {
        didSet {
            audioPitch.pitch = pitchValue * 10 // Slider values are adjusted by factor of 10
        }
    }
    
    @Published var volumeValue: Float = 0.5 {
        didSet {
            audioPlayer.volume = volumeValue
        }
    }
    
    @Published var playInterval: TimeInterval = 1 {
        didSet {
            updateTimer()
        }
    }
    
    var timer: Timer?
    
    init() {
        setupAudio()
    }

    func setupAudio() {
        guard let audioPath = Bundle.main.path(forResource: "WaterDrop", ofType: "mp3") else { return }
        let audioURL = URL(fileURLWithPath: audioPath)
        
        do {
            audioFile = try AVAudioFile(forReading: audioURL)
        } catch {
            print("Error reading audio file: \(error)")
            return
        }
        
        audioEngine.attach(audioPlayer)
        audioEngine.attach(audioPitch)
        
        audioEngine.connect(audioPlayer, to: audioPitch, format: nil)
        audioEngine.connect(audioPitch, to: audioEngine.mainMixerNode, format: nil)
    }
    
    func playAudio() {
        guard let audioFile = audioFile else { return }
        
        audioPlayer.scheduleFile(audioFile, at: nil, completionHandler: nil)
        do {
            try audioEngine.start()
        } catch {
            print("Error starting audio engine: \(error)")
            return
        }
        audioPlayer.play()
        
        updateTimer()
    }
    
    func playAudio_2() {
        guard let audioFile = audioFile else { return }
        
        audioPlayer.scheduleFile(audioFile, at: nil) { [weak self] in
            self?.playAudio()
        }
        do {
            try audioEngine.start()
        } catch {
            print("Error starting audio engine: \(error)")
            return
        }
        audioPlayer.play()
    }
    
    func playAudio_1() {
        guard let audioFile = audioFile else { return }

        audioPlayer.scheduleFile(audioFile, at: nil, completionHandler: nil)
        do {
            try audioEngine.start()
        } catch {
            print("Error starting audio engine: \(error)")
            return
        }
        audioPlayer.play()
    }
    
    func stopAudio() {
        audioPlayer.stop()
        audioPlayer.reset()
        audioEngine.stop()
        timer?.invalidate()
    }

    
    private func updateTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: playInterval, repeats: true) { [weak self] _ in
            self?.playAudio()
        }
    }
}

//
//  CustomSound.swift
//  AVAudioEngineExample
//
//  Created by Doyeon on 2023/05/24.
//

import Foundation

struct CustomSound: Identifiable, Codable {
    let id: UUID
    var fileName: String
    var category: SoundCategory
    var audioVariation: AudioVariation
    var audioFilter: AudioFilter
    
    init(fileName: String, category: SoundCategory, audioVariation: AudioVariation, audioFilter: AudioFilter) {
        self.id = UUID()
        self.fileName = fileName
        self.category = category
        self.audioVariation = audioVariation
        self.audioFilter = audioFilter
    }
}

//
//  ContentView.swift
//  PitchDemo
//
//  Created by Doyeon on 2023/06/02.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = AudioPlayerViewModel()
    
    var body: some View {
        VStack {
            Button("Play") {
                viewModel.playAudio()
            }
            .padding(.vertical, 40)
            
            Button("Stop") {
                viewModel.stopAudio()
            }
            .padding(.vertical, 40)
            
            Slider(value: $viewModel.pitchValue, in: -50...50, step: 10)
                .padding()
            
            Slider(value: $viewModel.volumeValue, in: 0...1, step: 0.01)
                .padding()
            
            Slider(value: $viewModel.playInterval, in: 0.5...5, step: 0.1)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

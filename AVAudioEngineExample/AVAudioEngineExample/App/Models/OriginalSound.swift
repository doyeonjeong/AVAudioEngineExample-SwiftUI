//
//  OriginalSound.swift
//  AVAudioEngineExample
//
//  Created by Doyeon on 2023/05/24.
//

import Foundation

struct OriginalSound: Equatable, Hashable {
    let name: String
    var filter: AudioFilter
    let category: SoundCategory
    let defaultColor: String
    
    init(name: String, filter: AudioFilter, category: SoundCategory, defaultColor: String) {
        self.name = name
        self.filter = filter
        self.category = category
        self.defaultColor = defaultColor
    }
}

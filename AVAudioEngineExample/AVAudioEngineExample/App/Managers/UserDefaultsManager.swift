//
//  UserDefaultsManager.swift
//  AVAudioEngineExample
//
//  Created by Doyeon on 2023/05/24.
//

import Foundation

extension UserDefaults {
    struct Keys {
        static let customSound = "CUSTOM_SOUND_KEY"
    }
}

final class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    private let standard = UserDefaults.standard
    private let CUSTOM_SOUND_KEY = UserDefaults.Keys.customSound
    private init() {}
}

// MARK: - Data Get, Set Properties
extension UserDefaultsManager {
    
}

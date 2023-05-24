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
    
    var customSoundsDic: [Int: String] {
        get {
            guard let customSoundsDictionary = standard.dictionary(forKey: CUSTOM_SOUND_KEY) as? [Int: String] else {
                return [:]
            }
            return customSoundsDictionary
        }
        
        set {
            standard.set(newValue, forKey: CUSTOM_SOUND_KEY)
        }
    }
    
    func removeOneCustomSounds(at index: Int) {
        var customSoundsDictionary = customSoundsDic
        customSoundsDictionary.removeValue(forKey: index)
        customSoundsDic = customSoundsDictionary
    }
    
    func removeAllCustomSounds() {
        standard.removeObject(forKey: CUSTOM_SOUND_KEY)
    }
    
}

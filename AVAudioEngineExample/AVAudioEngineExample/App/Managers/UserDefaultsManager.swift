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
    
    var customSoundsDic: [Int: UUID] {
        get {
            guard let customSoundsDictionary = standard.dictionary(forKey: CUSTOM_SOUND_KEY) as? [Int: String] else {
                return [:]
            }
            let customSounds = customSoundsDictionary.compactMapValues { idString in
                UUID(uuidString: idString)
            }
            return customSounds
        }
        
        set {
            let customSoundsDictionary = newValue.reduce(into: [Int: String]()) { dic, keyValue in
                let (index, id) = keyValue
                dic[index] = id.uuidString
            }
            standard.set(customSoundsDictionary, forKey: CUSTOM_SOUND_KEY)
        }
    }
}

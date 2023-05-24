//
//  UserFileManager.swift
//  AVAudioEngineExample
//
//  Created by Doyeon on 2023/05/24.
//

import Foundation

final class UserFileManager {
    static let shared = UserFileManager()
    private let fileManager = FileManager.default
    private var documentsDirectory: URL {
        return fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    private init() {}
}

extension UserFileManager {
    
}

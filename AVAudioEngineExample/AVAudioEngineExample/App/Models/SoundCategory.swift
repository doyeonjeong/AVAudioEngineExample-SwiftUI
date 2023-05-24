//
//  SoundCategory.swift
//  AVAudioEngineExample
//
//  Created by Doyeon on 2023/05/24.
//

enum SoundCategory: String, Codable {
    case waterDrop, singingBowl, bird
    
    var displayName: String {
        switch self {
        case .waterDrop:
            return "물방울"
        case .singingBowl:
            return "싱잉볼"
        case .bird:
            return "새소리"
        }
    }
    
    var fileName: String {
        switch self {
        case .waterDrop:
            return "WaterDrop"
        case .singingBowl:
            return "SingingBowl"
        case .bird:
            return "Bird"
        }
    }
    
    var imageName: String {
        switch self {
        case .waterDrop:
            return "WaterDrop"
        case .singingBowl:
            return "Wind" // TODO: 이미지 업데이트 후 변경 필요
        case .bird:
            return "Forest" // TODO: 이미지 업데이트 후 변경 필요
        }
    }
}

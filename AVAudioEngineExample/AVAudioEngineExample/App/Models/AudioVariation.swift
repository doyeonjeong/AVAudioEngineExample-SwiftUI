//
//  AudioVariation.swift
//  AVAudioEngineExample
//
//  Created by Doyeon on 2023/05/24.
//

struct AudioVariation: Codable {
    var volume: Float // 범위: 0.0 ~ 1.0
    var pitch: Float // 범위: -2.0 ~ 2.0
    var speed: Float // 범위: -2.0 ~ 2.0
    
    init(volume: Float = AudioVariation.randomValue(),
         pitch: Float = AudioVariation.randomValue(),
         speed: Float = AudioVariation.randomValue()) {
        
        // 값이 유효한 범위 내에 있는지 확인하고, 그렇지 않은 경우 기본 값을 사용합니다.
        self.volume = (0.0...1.0).contains(volume) ? volume : AudioVariation.randomValue()
        self.pitch = (-2.0...2.0).contains(pitch) ? pitch : AudioVariation.randomValue()
        self.speed = (-2.0...2.0).contains(speed) ? speed : AudioVariation.randomValue()
    }
    
    static func randomValue() -> Float {
        return Float.random(in: 0.2...1.0)
    }
}

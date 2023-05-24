//
//  AVAudioEngineExampleTests.swift
//  AVAudioEngineExampleTests
//
//  Created by Doyeon on 2023/05/24.
//

import XCTest
@testable import AVAudioEngineExample

final class AVAudioEngineExampleTests: XCTestCase {
    
    var sut: UserDefaultsManager!

    override func setUpWithError() throws {
        // Create an instance of UserDefaultsManager before each test
        sut = UserDefaultsManager.shared
        // Ensure to start with empty customSoundsDic before each test
        sut.removeAllCustomSounds()
    }

    override func tearDownWithError() throws {
        sut.removeAllCustomSounds()
        sut = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCustomSoundsDicSaveAndLoad() throws {
        // Given
        let soundUUID = UUID()
        let soundIndex = 1
        
        // When
        sut.customSoundsDic[soundIndex] = soundUUID
        
        // Then
        let loadedSoundUUID = sut.customSoundsDic[soundIndex]
        XCTAssertEqual(loadedSoundUUID, soundUUID, "Saved and loaded sound UUIDs should match.")
    }
    
    func testRemoveOneCustomSound() throws {
        // Given
        let soundUUID1 = UUID()
        let soundUUID2 = UUID()
        let soundIndex1 = 1
        let soundIndex2 = 2
        sut.customSoundsDic[soundIndex1] = soundUUID1
        sut.customSoundsDic[soundIndex2] = soundUUID2
        
        // When
        sut.removeOneCustomSounds(at: soundIndex1)
        
        // Then
        XCTAssertNil(sut.customSoundsDic[soundIndex1], "Sound at index 1 should be removed.")
        XCTAssertEqual(sut.customSoundsDic[soundIndex2], soundUUID2, "Sound at index 2 should still exist.")
    }
    
    func testRemoveAllCustomSounds() throws {
        // Given
        let soundUUID1 = UUID()
        let soundUUID2 = UUID()
        let soundIndex1 = 1
        let soundIndex2 = 2
        sut.customSoundsDic[soundIndex1] = soundUUID1
        sut.customSoundsDic[soundIndex2] = soundUUID2
        
        // When
        sut.removeAllCustomSounds()
        
        // Then
        XCTAssertTrue(sut.customSoundsDic.isEmpty, "All sounds should be removed.")
    }

}

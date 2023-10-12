//
//  rpgsheetTests.swift
//  rpgsheetTests
//
//  Created by Augusto Avelino on 10/10/23.
//

import XCTest
@testable import rpgsheet

final class rpgsheetTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
    
    func testCharacterLevel() throws {
        let lvl1HumanBard = RPGCharacter(name: "Level 1", race: .human, rpgClass: .bard, experience: 250)
        let lvl2ElfRanger = RPGCharacter(name: "Level 2", race: .elf, rpgClass: .ranger, experience: 300)
        let lvl5DwarfBarbarian = RPGCharacter(name: "Level 5", race: .dwarf, rpgClass: .barbarian, experience: 6600)
        let lvl10DragonbornWarlock = RPGCharacter(name: "Level 10", race: .dragonborn, rpgClass: .warlock, experience: 64000)
        
        XCTAssert(lvl1HumanBard.getLevel() == 1)
        XCTAssert(lvl2ElfRanger.getLevel() == 2)
        XCTAssert(lvl5DwarfBarbarian.getLevel() == 5)
        XCTAssert(lvl10DragonbornWarlock.getLevel() == 10)
    }

}

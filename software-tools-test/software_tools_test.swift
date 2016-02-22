//
//  software_tools_test.swift
//  software tools test
//
//  Created by AikawaKazuki on 2016/02/16.
//
//

import XCTest

class software_tools_test: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetC() {
        let testbed = [["",""], ["\n", "\n"], ["hello", "hello"], ["a\n hello world!\n", "a\n hello world!\n"]]
        var str = ""
        var c: Character
        for s in testbed {
            let getC = GetC(text: s[0])
            c = getC.get_c()
            while (c != getC.EOF) {
                str += String(c)
                c = getC.get_c()
            }
            XCTAssertEqual(str, s[1])
            str = ""
        }
    }
    
    func testGetCWithRemoveBackspaces() {
        let testbed = [[" "," "], [" hello  \n   wor   ld   \n"," hello\n   wor   ld\n"]]
        var str = ""
        var c: Character
        for s in testbed {
            let getC = GetC(text: s[0])
            c = getC.get_c()
            while (c != getC.EOF) {
                str += String(c)
                c = getC.get_c(true)
            }
            XCTAssertEqual(str, s[1])
            str = ""
        }
    }
    
    func testCharCount() {
        let testbed = [["", 0], ["\n", 1], ["a\n hello world!\n", 16]]
        for o in testbed {
            XCTAssertEqual(charCount(o[0] as! String), o[1])
        }
    }
    
    func testLineCount() {
        let testbed = [["", 1], ["\n", 2], ["a\n hello world!\n", 3], ["hi\n foo", 2]]
        for o in testbed {
            XCTAssertEqual(lineCount(o[0] as! String), o[1])
        }
    }
    
    func testWordCount() {
        let testbed = [["", 0], ["\n", 0], ["a\n hello world!\n", 3]]
        for o in testbed {
            XCTAssertEqual(wordCount(o[0] as! String), o[1])
        }
    }
    
    func testSentenceCount() {
        let testbed = [["", 0], ["\n", 0], ["a.\n hello world!\n", 2], ["a.\n hello world!\n hhh", 2]]
        for o in testbed {
            XCTAssertEqual(sentenceCount(o[0] as! String), o[1])
        }
    }
    
    func testDetab() {
        let testbed = [["", ""], ["\n", "\n"],  ["\ta", "    a"], ["a.\n \thello world!\n", "a.\n    hello world!\n"]]
        for o in testbed {
            XCTAssertEqual(detab(o[0]), o[1])
        }
    }
    
    func testEntab() {
        let testbed = [["", ""], ["\t      a", "\t\t  a"], ["\n", "\n"],  ["    a", "\ta"], ["     a", "\t a"],[" a\n hello world!\n", " a\n hello world!\n"]]
        for o in testbed {
            XCTAssertEqual(entab(o[0]), o[1])
            print(entab(o[0]))
            print(o[1])
        }
    }
    
}

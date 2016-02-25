//
//  software_tools_test.swift
//  software tools test
//
//  Created by AikawaKazuki on 2016/02/16.
//
//

import XCTest

//var test = true // is test?
//var bufferStream = BufferStreamWrapper() // for test

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
            print(detab(o[0]))
            XCTAssertEqual(detab(o[0]), o[1])
        }
    }
    
    func testEntab() {
        let testbed = [["", ""], ["\t      a", "\t\t  a"], ["\n", "\n"],  ["    a", "\ta"], ["     a", "\t a"],[" a\n hello world!\n", " a\n hello world!\n"]]
        for o in testbed {
            XCTAssertEqual(entab(o[0]), o[1])
        }
    }
    
    func testCrypt() {
        // this testbed is [value, key].
        // if value is crypted twice, the value should be fast value.
        let testbed = [["aab cdef\n", "xyzhoge"], ["\n", "k"], ["", "k"]]
        for o in testbed {
            let cripted = crypt(o[0], key: o[1])
            let uncripted = crypt(cripted, key: o[1])
            XCTAssertEqual(o[0], uncripted)
        }
    }
    
    func testIndex() {
        // [string, char, index] // ["", "", 0] raises error
        let testbed = [["hello", "h", 1], ["hello", "l", 3], ["hello", "w", 0]]
        for o in testbed {
            let s = o[1] as! String
            let c = s[s.startIndex]
            let result = index(o[0] as! String, c: c)
            XCTAssertEqual(result, o[2])
        }
    }
    
    func testxIndex() {
        // [string, char, allbut, lastto, result] //XXX ["", "", 0] raises error
        let testbed = [["hello", "h", true, 2, 0], ["hello", "l", false, 2, 3], ["hello", "w", true, 2, 3]]
        for o in testbed {
            let s = o[1] as! String
            let c = s[s.startIndex]
            let allbut = o[2] as! Bool
            let lastto = o[3] as! Int
            let result = xindex(o[0] as! String, c: c, allbut: allbut, lastto: lastto)
            XCTAssertEqual(result, o[4])
        }
    }
    
    func testMakset() {
        // [string, ["c", "h", "a", "r"]] //XXX ["", [""]] can't work well.
        let testbed: [[Character]] = [["h", "e", "l", "l", "o"]]
        let result: [String] = ["hello"]
        for var i = 0; i < testbed.count; i++ {
            let r = result[i]
            var charArray :[Character] = []
            for c in testbed[i] {
                charArray.append(c as Character)
            }
            XCTAssertEqual(makset(charArray), r)
        }
    }
    
    func testCtoi() {
        // [base, starti, afteri, result]: [string, int, int, int]
        let testbed = [["1", 0, 1, 1], ["-1", 0, 2, -1], ["12", 0, 2, 12], ["  12hello", 1, 4, 12]]
        for o in testbed {
            let s = o[0] as! String
            var i = o[1] as! Int
            let ri = o[2] as! Int
            let r = o[3] as! Int
            XCTAssertEqual(ctoi(s, i: &i), r)
            XCTAssertEqual(i, ri)
        }
    }
    
    func testItoc() {
        // [base, result]: [Int, String]
        let testbed = [[0, "0"], [12, "12"], [-123, "-123"]]
        for o in testbed {
            let b = o[0] as! Int
            let s = o[1] as! String
            let r = itoc(b)
            XCTAssertEqual(s, r)
        }
    }
    
    func testPutdec() {
        //[baseNum, baseWidth, result]
        let testbed = [[0, 2, " 0"], [12, 0, "12"], [-123, 4, "-123"]]
        for o in testbed {
            let b = o[0] as! Int
            let w = o[1] as! Int
            let s = o[2] as! String
            let r = putdec(b, w: w)
            XCTAssertEqual(s, r)
        }
    }
    
    func testTail() {
        // [baseStr, numOfLine, result]: [String, Int, String]
        let testbed = [["", 1, ""], ["1\n2\n3\n4\n5\n", 3, "3\n4\n5\n"], ["1\n2\n", 4, "1\n2\n"]]
        for o in testbed {
            let b = o[0] as! String
            let n = o[1] as! Int
            let s = o[2] as! String
            let r = tail(b, n: n)
            XCTAssertEqual(s, r)
        }
    }
}

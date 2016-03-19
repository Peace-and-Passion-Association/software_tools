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
    
    func testMakset2() {
        // [string, ["c", "h", "a", "r"]] //XXX ["", [""]] can't work well.
        let testbed: [[Character]] = [["h", "e", "l", "l", "o"]]
        let result: [String] = ["hello"]
        var s: String = ""
        for var i = 0; i < testbed.count; i++ {
            let r = result[i]
            var charArray :[Character] = []
            for c in testbed[i] {
                charArray.append(c as Character)
            }
            XCTAssertEqual(makset(charArray, k: 0, set: &s), r)
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
    
    func testCalc() {
        //[[input], result] : [[String], String]
        let testbed = [[["1", "*", "2", "+", "3", "/", "5", "="], "2"], [["1", "+", "3", "="], "4"], [["2", "-", "4", "*", "(", "1", "+", "2", "+", "(", "3", "/", "3", ")", ")", "="], "-14"], [["4", "*", "(", "1", "+", "2", ")", "="], "12"]]
        for o in testbed {
            let b = o[0] as! [String]
            let i = o[1] as! String
            var r = calc(b)
            r = r.substringToIndex(r.endIndex.predecessor().predecessor())
            //XXX remove ".0"
            XCTAssertEqual(i, r)
        }
    }
    
    func testReversePolishCalc() {
        //[[input], result] : [[String], String]
        let testbed = [[["1", "2", "+", "5", "3", "*", "*"], "45"], [["1", "3", "+"], "4"]]
        for o in testbed {
            let b = o[0] as! [String]
            let i = o[1] as! String
            var r = reversePolishCalc(b)
            print(r)
            r = r.substringToIndex(r.endIndex.predecessor().predecessor())
            //XXX remove ".0"
            print(r)
            XCTAssertEqual(i, r)
        }
    }
    
    func testEqual() {
        //[input1, input2, result] : [String, String, bool]
        let testbed = [["", "", true], ["hello\n", "hello\n", true], ["hoge", "foo", false]]
        for o in testbed {
            let a = o[0] as! String
            let b = o[1] as! String
            let r = equal(a, str2: b)
            XCTAssertEqual(r, o[2])
        }
    }
    
    func testGetwrd() {
        //[base, index, result, afterindex]
        let testbed = [["", 0, "", 0], ["Hello World!", 0, "Hello", 5], ["Hello World!", 1, "ello", 5], ["Hello World!", 5, "World!", 12]]
        for o in testbed {
            let a = o[0] as! String
            var b = o[1] as! Int
            let r = getwrd(a, index: &b)
            XCTAssertEqual(r, o[2])
            XCTAssertEqual(b, o[3] as? Int)
        }
    }
 
    func testConcatToAny() {
        var pathes: [String] = []
        var result = concat(pathes)
        XCTAssertEqual(result, "")
    }
    
    func testBubbleSort() {
        //[[base],[result]] : [[Int], [Int]]
        let testbed = [[[], []], [[1], [1]], [[3, 1, 2], [1, 2, 3]], [[3, 1, 2, 4], [1, 2, 3, 4]]]
        for o in testbed {
            let a = o[0] as [Int]
            let b = o[1] as [Int]
            let r = bubble(a)
            XCTAssertEqual(b, r)
        }
    }
    
    func testShellSort() {
        //[[base],[result]] : [[Int], [Int]]
        let testbed = [[[], []], [[1], [1]], [[3, 1, 2, 4], [1, 2, 3, 4]]]
        for o in testbed {
            let a = o[0] as [Int]
            let b = o[1] as [Int]
            let r = shell(a)
            XCTAssertEqual(b, r)
        }
    }
    
    func testSortSentence() {
        let testbed = [["", ""], ["1", "1"], ["world!\nhello\n", "hello\nworld!\n"]]
        for o in testbed {
            let a = o[0] as String
            let b = o[1] as String
            let r = sortSentence(a)
            XCTAssertEqual(b, r)
        }
    }
    
    func testSortSentenceWithReverse() {
        let testbed = [["", ""], ["1", "1"], ["world!\nhello\n", "world!\nhello\n"]]
        for o in testbed {
            let a = o[0] as String
            let b = o[1] as String
            let r = sortSentence(a, reverse: true)
            XCTAssertEqual(b, r)
        }
    }
    
    func testQuickSort() {
        //[[base],[result]] : [[Int], [Int]]
        let testbed = [[[], []], [[1], [1]], [[3, 1, 2, 4], [1, 2, 3, 4]]]
        for o in testbed {
            var a = o[0] as [Int]
            let b = o[1] as [Int]
            let r = quick(&a)
            XCTAssertEqual(b, r)
        }
    }
    
    func testQuickSortString() {
        //[[base],[result]] : [[Int], [Int]]
        let testbed = [["", ""], ["1", "1"], ["world!\nhello\n", "hello\nworld!\n"]]
        for o in testbed {
            let a = o[0] as String
            let b = o[1] as String
            let r = sortSentence(a, algo: "quick")
            XCTAssertEqual(b, r)
        }
    }
    
    func testUnique() {
        let testbed = [["", ""], ["1", "1"], ["1\n1\n", "1\n"], ["hello\nhello\nworld\n", "hello\nworld\n"]]
        for o in testbed {
            let a = o[0] as String
            let b = o[1] as String
            let r = unique(a)
            XCTAssertEqual(b, r)
        }
    }
    
    func testUniqueWithRep() {
        let testbed = [["", ""], ["1", "1 1"], ["1\n1\n", "2 1\n"], ["hello\nhello\nworld\n", "2 hello\n1 world\n"]]
        for o in testbed {
            let a = o[0] as String
            let b = o[1] as String
            let r = unique(a, rep: true)
            XCTAssertEqual(b, r)
        }
    }
    
    func testTranslit() {
        // [base, from, to, allbut, result]
        let testbed = [["", "", "", false, ""], ["hello world!", "h", "y", false, "yello world!"], ["hello world!", "he", "ya", false, "yallo world!"], ["hello world!", "hello", "ya", false, "ya warad!"]]
        for o in testbed {
            let a = o[0] as! String
            let b = o[1] as! String
            let c = o[2] as! String
            let d = o[3] as! Bool
            let res = o[4] as! String
            let r = translit(a, from: b, to: c, allbut: d)
            XCTAssertEqual(res, r)
        }
    }
    
    func testTranslitWithAllbut() {
        // [base, from, to, allbut, result]
        let testbed = [["", "", "", true, ""], ["hello world!", "he", "y", true, "hey"]]
        for o in testbed {
            let a = o[0] as! String
            let b = o[1] as! String
            let c = o[2] as! String
            let d = o[3] as! Bool
            let res = o[4] as! String
            let r = translit(a, from: b, to: c, allbut: d)
            XCTAssertEqual(res, r)
        }
    }
    
    func testDodash() {
        //valid, array, i, set, index, result]
        let testbed = [[lowalf, "a-c", 1, "a", 1, "abc"], [lowalf, "a-z", 1, "a", 1, "abcdefghijklmnopqrstuvwxyz"]]
        for o in testbed {
            let a = o[0] as! String
            let s = o[1] as! String
            let b = Array(s.characters)
            var c = o[2] as! Int
            var d = o[3] as! String
            var e = o[4] as! Int
            let res = o[5] as! String
            dodash(a, array: b, i: &c, set: &d, j: &e)
            print(d)
            print(e)
            XCTAssertEqual(res, d)
        }
    }
    
    func testFilset() {
        // [string, result]
        let testbed = [["", ""], ["hello", "hello"], ["a-c", "abc"], ["1-5", "12345"]]
        for o in testbed {
            let s = o[0] 
            let a = Array(s.characters)
            let res = o[1] 
            let r = filset(a)
            XCTAssertEqual(res, r)
        }
    }
    
    func testFilset2() {
        // [string, result, delim, i, j, set]
        let testbed = [["", "", "!", 0, 0, ""], ["hello", "hello", "!", 0, 0, ""], ["a-c", "abc", "!", 0, 0, ""], ["1-5", "12345", "!", 0, 0, ""], ["helloa-c!def", "helloabc", "!", 0, 0, ""], ["01-5", "12345", "!", 1, 0, ""], ["hello1-5worl!d", "foello12345worl", "!", 1, 2, "foo"]]
        for o in testbed {
            let s = o[0] as! String
            let a = Array(s.characters)
            let res = o[1]
            let delim = Character(o[2] as! String)
            var i = o[3] as! Int
            var j = o[4] as! Int
            var set = o[5] as! String
            let r = filset(delim, charArray: a, i: &i, set: &set, j: &j)
            XCTAssertEqual(res, r)
        }
    }
    
    func testMatch() {
        //[string, pattern, bool]
        let testbed = [["var i = 0", "var", true], ["var i = 0", "let", false]]
        for o in testbed {
            let a = o[0] as! String
            let b = o[1] as! String
            let r = o[2] as! Bool
            let res = match(a, pat: b)
            XCTAssertEqual(res, r)
        }
        
    }
    
    func testLocate() {
        //[c, pat, offset, result]
        let testbed = [["a", "5apple", 0, true], ["a", "a4pple", 1, false]]
        for o in testbed {
            let a = Character(o[0] as! String)
            let b = o[1] as! String
            let c = o[2] as! Int
            let r = o[3] as! Bool
            let res = locate(a, pat: b, offset: c)
            XCTAssertEqual(res, r)
        }
    }
    
    func testPatsiz() {
        //[pat, index, result]
        let testbed = [[String(CHAR) + "x", 0, 2], ["[3xyz]", 0, 5], ["%", 0, 1]]
        for o in testbed {
            let a = o[0] as! String
            let b = o[1] as! Int
            let r = o[2] as! Int
            let res = patsiz(a, index: b)
            XCTAssertEqual(res, r)
        }
    }
    
    func testGetpat() {
        //[arg, pat, result]: [String, String, String]
        let testbed = [["hi", "", String(CHAR) + "h" + String(CHAR) + "i"]]
        for o in testbed {
            let a = o[0] as! String
            var b = o[1] as! String
            let r = o[2] as! String
            let res = getpat(a, pat: &b)
            XCTAssertEqual(b, r)
        }
    }
    
    func testMakpat() {
        //[arg, from, delim, pat, result]: [String, Int, Character, String, String]
        let testbed = [["hiØ", 0, "Ø", "", String(CHAR) + "h" + String(CHAR) + "i"]]
        for o in testbed {
            let a = o[0] as! String
            let b = o[1] as! Int
            let c = Character(o[2] as! String)
            var d = o[3] as! String
            let r = o[4] as! String
            let res = makpat(a, from: b, delim: c, pat: &d)
            XCTAssertEqual(d, r)
        }
    }
    
    func testGetccl() {
        //[arg, i pat, j, result, afterpat] = [String, int, string, int, bool, String]
        let testbed = [["[hello]", 0, "", 0, true, "[5hello"], ["my[hello]", 2, "", 0, true, "[5hello"]] //["hello", 0, "", 0, false, "hello"],
        for o in testbed {
            let a = o[0] as! String
            var b = o[1] as! Int
            var c = o[2] as! String
            var d = o[3] as! Int
            let r = o[4] as! Bool
            let rp = o[5] as! String
            let res = getccl(a, i: &b, pat: &c, j: &d)
            XCTAssertEqual(r, res)
            XCTAssertEqual(rp, c)
        }
    }
}

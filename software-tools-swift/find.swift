//
//  find.swift
//  software-tools-swift
//
//  Created by 相川　和希 on 2016/03/10.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//

import Foundation

//func find(base: String, pattern: String) -> String {
//    let getC = GetC(text: base)
//    var line: String! = ""
//    var result: String = ""
//    if getpat(arg, pattern: pattern) == ERR {
//        stdError("illegal pattern.")
//    }
//    while getC.getlin(&line) == String(EOF) {
//        if match(line, pattern: pattern) == true {
//            result += line
//        }
//    }
//    return result
//}

func match(line: String, pat: String) -> Bool {
    for var i = 0; i < line.characters.count; i++ {
        if amatch(line, from: i, pat: pat) > -1 {
            return true
        }
    }
    return false
}

//func amatch(line: String, from: Int, pat: String) -> Int {
//// without metacharacters.
//    var i = from
//    for var j = 0; j < pat.characters.count; j = j++ {
//        if line[line.startIndex.advancedBy(i)] != pat[pat.startIndex.advancedBy(j)] {
//            return -1 // with no match
//        }
//        i++
//    }
//    return i
//}

//func amatch(line: String, from: Int, pat: String) -> Int {
//    // without metacharacters.
//    var i = from
//    for var j = 0; j < pat.characters.count; j = j + patsiz(pat, j) {
//        if omatch(line, i, pat, j) == false {
//            return -1
//        }
//    }
//    return i
//}

func amatch(line: String, from: Int, pat: String) -> Int {
    var offset = from
    for var j = 0; j < line.characters.count; j = j + patsiz(pat, index: j) {
        if pat[pat.startIndex.advancedBy(j)] == CLOSURE {
            j = XXX
            for var i = offset; i < line.characters.count; {
                if omatch(line, i: i, pat: pat, j: j) == false { // match as many as possible
                    break
                }
            }
            for j = XXX; i >= offset; i-- {
                k = amatch(line, i, pat(j))
            }
        }
    }
}

func patsiz(pat: String, index: Int) -> Int {
    return 0
}

func omatch(line: String, i: Int, pat: String, j: Int) -> Bool {
    return false
}
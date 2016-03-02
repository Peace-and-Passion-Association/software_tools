//
//  sorts.swift
//  software-tools-swift
//
//  Created by 相川　和希 on 2016/03/02.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//

import Foundation

func bubble(var base: [Int]) -> [Int] {
    var i: Int = 0
    var j: Int = 0
    var k: Int
    let n = base.count
    
    for i = n - 1; i > 0; i-- {
        for j = 0; j < i; j++ {
            if base[j] > base[j + 1] {  // compare
                k = base[j]             //exchange
                base[j] = base[j + 1]
                base[j+1] = k
            }
        }
    }
    return base
}

func shell(var base: [Int]) -> [Int] {
    var gap: Int
    var jg: Int
    let size = base.count

    for gap = size / 2; gap > 0; gap = gap / 2 {
        for var i = (gap); i < size; i++ {
            for var j = (i - gap); j >= 0; j-- {
                jg = j + gap
                if base[j] <= base[jg] { // compare
                    break
                }
                let k = base[j]
                base[j] = base[jg]
                base[jg] = k
            }
        }
    }
    return base
}

func tShell(var base: [String]) -> [String] {
    var gap: Int
    var jg: Int
    let size = base.count
    
    for gap = size / 2; gap > 0; gap = gap / 2 {
        for var i = (gap); i < size; i++ {
            for var j = (i - gap); j >= 0; j-- {
                jg = j + gap
                if cmpString(base[j], s2: base[jg]) { // compare
                    break
                }
                let k = base[j]
                base[j] = base[jg]
                base[jg] = k
            }
        }
    }
    return base
}

func cmpString(s1: String, s2: String) -> Bool {
    if s1 <= s2 {
        return true
    } else {
        return false
    }
}

func sortSentence(base: String) -> String {
    let g = GetC(text: base)
    var lines: [String] = []
    var l = g.getlin()
    while l != String(EOF) {
        lines.append(l)
        l = g.getlin()
    }
    let result = tShell(lines)
    return result.joinWithSeparator("")
}
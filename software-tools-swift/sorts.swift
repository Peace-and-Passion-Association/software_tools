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

func sortSentence(base: String, reverse: Bool = false, algo: String = "shell") -> String {
    //ShellSort
    let g = GetC(text: base)
    var lines: [String] = []
    var l = g.getlin()
    while l != String(EOF) {
        lines.append(l)
        l = g.getlin()
    }
    var result: [String] = []
    if algo == "shell" {
        result = tShell(lines)
    } else if algo == "quick" {
        result = quick(&lines)
    } else {
        stdError("no such algo.")
    }
    if reverse == true {
        result = result.reverse()
    }
    return result.joinWithSeparator("")
}

func quick(inout base: [Int], var left: Int! = nil, var right: Int! = nil) -> [Int] {
    if left == nil {
        left = 0
    }
    if right == nil {
        right = base.count - 1
    }
    if left >= right {
        return base
    }
    let k = distribution(&base, left: left, right: right)
    quick(&base, left: left, right: k-1)
    quick(&base, left: k + 1, right: right)
    return base
}

func quick(inout base: [String], var left: Int! = nil, var right: Int! = nil) -> [String] {
    if left == nil {
        left = 0
    }
    if right == nil {
        right = base.count - 1
    }
    if left >= right {
        return base
    }
    let k = distribution(&base, left: left, right: right)
    quick(&base, left: left, right: k-1)
    quick(&base, left: k + 1, right: right)
    return base
}

func distribution(inout base: [Int], var left: Int! = nil, var right: Int! = nil) -> Int {
    // subroutine of quick
    // return centor index.
    if left == nil {
        left = 0
    }
    if right == nil {
        right = base.count - 1
    }
    let pivot: Int = base[right]
    var l: Int = left
    var r: Int = right
    while l < r {
        while base[l] <= pivot && l < r {
            l++
        }
        while base[r] >= pivot && l < r {
            r--
        }
        if l < r {
            // exchange
            mySwap(&base[l], b: &base[r])
        }
    }
    mySwap(&base[l], b: &base[right])
    return l
}

func distribution(inout base: [String], var left: Int! = nil, var right: Int! = nil) -> Int {
    // subroutine of quick
    // return centor index.
    if left == nil {
        left = 0
    }
    if right == nil {
        right = base.count - 1
    }
    let pivot: String = base[right]
    var l: Int = left
    var r: Int = right
    while l < r {
        while base[l] <= pivot && l < r {
            l++
        }
        while base[r] >= pivot && l < r {
            r--
        }
        if l < r {
            // exchange
            mySwap(&base[l], b: &base[r])
        }
    }
    mySwap(&base[l], b: &base[right])
    return l
}

func mySwap(inout a: Int, inout b: Int) {
    if a == b {
        return
    } else {
        swap(&a, &b)
    }
}

func mySwap(inout a: String, inout b: String) {
    if a == b {
        return
    } else {
        swap(&a, &b)
    }
}
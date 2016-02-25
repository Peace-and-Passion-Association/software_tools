//
//  tail.swift
//  software-tools-swift
//
//  Created by 相川　和希 on 2016/02/25.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//

import Foundation

// Q 2-27
/* 
1. get_all_lines and set in array.
2. get subscript from bottom of lines.
3. put.
*/

func tail(str: String, var n: Int? = 10) -> String {
    if n == nil {
        n = 10
    }
    let getC = GetC(text: str)
    //let putC = PutC.putC
    var c: Character!
    var i: Int = 0
    var j: Int = 0
    var line: String = ""
    var lines: [String] = []
    var result: String = ""
    //get all lines and set in lines_array.
    
    while getC.get_c(&c) != EOF {
        line += String(c)
        if c == "\n" {
            lines.append(line)
            line = ""
            i++
        }
    }
    if line != "" {
        lines.append(line)
        line = ""
    }
    
    //get subscript from bottom of lines.
    if lines == [] {
        return ""
    }
    j = i - n!
    if j < 0 {
        j = 0
    }
    for ; j < i; j++ {
        result += lines[j]
    }
    return result
}
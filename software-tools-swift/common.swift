//
//  common.swift
//  software-tools-swift
//
//  Created by 相川　和希 on 2016/02/24.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//

import Foundation

let EOS: Character = "$"
let EOF: Character = "&"
let ESCAPE: Character = "#"
let digits: String = "0123456789"
let lowalf: String = "abcdefghijklmnopqrstuvwxyz"
let upalf: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

func cant(fileName: String) {
    stdError(fileName + ": can't open")
}

func getwrd(var base: String, inout index: Int) -> String {
    if base.characters.count < index {
        return ""
    }
    var result: String = ""
    base += String(EOS)
    var c = base[base.startIndex.advancedBy(index)]
    while c == " " || c == "\t" {
        index++
        c = base[base.startIndex.advancedBy(index)]
    }
    while c != EOS && c != " " && c != "\t" && c != "\n" {
        result += String(c)
        index++
        c = base[base.startIndex.advancedBy(index)]
    }
    return result
}

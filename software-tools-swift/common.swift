//
//  common.swift
//  software-tools-swift
//
//  Created by 相川　和希 on 2016/02/24.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//

import Foundation

let EOS: Character = "ß"
let EOF: Character = "´"
let NULLC: Character = "œ"
let CHAR: Character = "å"
let ESCAPE: Character = "@"
let CLOSURE: Character = "*"
let CLOSIZE: Int = 4 //XXX 
let NEWLINE: Character = "\n"
let NOT: Character = "^"
let BOL: Character = "%"
let EOL: Character = "$"
let ANY: Character = "?"
let CCL: Character = "["
let NCCL: Character = "˜"
let CCLEND: Character = "]"
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

extension String {
    mutating func replace(index: Int, c: Character) -> String {
        var charArray = Array(self.characters)
        if charArray.count == index {
            charArray.append(c)
        } else if charArray.count < index {
            while charArray.count == index {
                charArray.append(" ")
            }
            charArray.append(c)
        } else if charArray.count > index {
            charArray[index] = c
        }
        self = String(charArray)
        return String(charArray)
    }

    func c(index: Int) -> Character {
        return self[self.characters.startIndex.advancedBy(index)]
    }
    func s(index: Int) -> String {
        return String(self[self.characters.startIndex.advancedBy(index)])
    }
}

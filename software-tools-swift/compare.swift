//
//  compare.swift
//  software-tools-swift
//
//  Created by 相川　和希 on 2016/03/02.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//

import Foundation

func equal(var str1: String, var str2: String) -> Bool {
    //return true if equal, false if not.
    //swift has any EOS, so this time, I'm trying to set EOS on the last of string.
    str1 += String(EOS)
    str2 += String(EOS)
    for var i = 0; str1[str1.startIndex.advancedBy(i)] == str2[str2.startIndex.advancedBy(i)]; i++ {
        if str1[str1.startIndex.advancedBy(i)] == EOS {
            return true
        }
    }
    return false
}

func difmsg(lineno: Int, line1: String, line2: String) {
    write(String(lineno) + "\n")
    write(line1)
    write(line2)
}

func compare(file1Path: String, file2Path: String, var allowance: Int? = 0) -> Bool {
    var lineno: Int = 0
    let f1 = readFile(file1Path)
    let f1Get = GetC(text: f1)
    let f2 = readFile(file2Path)
    let f2Get = GetC(text: f2)
    let sEOF: String = String(EOF)
    var l1 = ""
    var l2 = ""
    var sum = 0
    
    if allowance == nil {
        allowance = 0
    }
    
    while true {
        l1 = f1Get.getlin()
        l2 = f2Get.getlin()
        if l1 == sEOF || l2 == sEOF {
            break
        }
        lineno++
        if equal(l1, str2: l2) == false {
            difmsg(lineno, line1: l1, line2: l2)
            sum++
            if sum > allowance! {
                return false
            }
        }
    }
    if l1 == sEOF && l2 != sEOF {
        remark("eof on file 1.")
        return false
    } else if l1 != sEOF && l2 == sEOF {
        remark("eof on file 2.")
        return false
    } else {
        return true
    }
}
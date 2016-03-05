//
//  unique.swift
//  software-tools-swift
//
//  Created by 相川　和希 on 2016/03/05.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//

import Foundation

//func unique(input: String) -> String {
//    var buf1: String
//    var buf2: String
//    var result: String = ""
//    let g = GetC(text: input)
//    
//    buf1 = g.getlin()
//    while buf1 != String(EOF) {
//        result += buf1
//        for buf2 = g.getlin(); buf2 != String(EOF); buf2 = g.getlin() {
//            if equal(buf1, str2: buf2) == false {
//                break
//            }
//        }
//        if buf2 == String(EOF) {
//            break
//        }
//        result += buf2
//        for buf1 = g.getlin(); buf1 != String(EOF); buf1 = g.getlin() {
//            if equal(buf1, str2: buf1) == false {
//                break
//            }
//        }
//    }
//    return result
//}

func unique(input: String, rep: Bool = false) -> String {
    var buf1: String
    var buf2: String
    var result: String = ""
    let g = GetC(text: input)
    var i = 1
    
    buf1 = g.getlin()
    while buf1 != String(EOF) {
        for buf2 = g.getlin(); buf2 != String(EOF); buf2 = g.getlin() {
            if equal(buf1, str2: buf2) == false {
                break
            }
            i++
        }
        if rep == true {
            result += String(i) + " " + buf1
            i = 1
        } else {
            result += buf1
        }
        
        if buf2 == String(EOF) {
            break
        }

        for buf1 = g.getlin(); buf1 != String(EOF); buf1 = g.getlin() {
            if equal(buf1, str2: buf2) == false {
                break
            }
            i++
        }
        
        if rep == true {
            result += String(i) + " " + buf2
            i = 1
        } else {
            result += buf2
        }
    }
    return result
}
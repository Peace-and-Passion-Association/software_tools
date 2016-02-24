////
////  tralslit.swift
////  software-tools-swift
////
////  Created by 相川　和希 on 2016/02/23.
////  Copyright © 2016年 AikawaKazuki. All rights reserved.
////
//

//XXX pass.

//import Foundation
//
//func translit(str:String, from: [Character], to: [Character]) -> String {
//    let getC = GetC(text: str)
//    let putC = PutC.putC
//    var c: Character
//    var length: Int
//    var allbut: Bool
//    var collap: Int
//    var i: Int
//    var lastto: Int
//    let NOT: Character = "!"
//    
//    if from as Any? == nil {
//        stdError("usage: translit from to.")
//    } else if from[0] == NOT {
//        allbut = true
//        if
//    }
//}
//
//
func index(str: String, c: Character) -> Int {
    // It is adapted to ratfor, so the first number is not 0 but 1.
    var index = 0
    for index = 0; index < str.characters.count; index++ { //use str_size insted of EOS
        if str[str.startIndex.advancedBy(index)] == c {
            return index + 1
        }
    }
    index = 0
    return index
}

func xindex(str: String, c: Character, allbut: Bool, lastto: Int) -> Int {
    let getC = GetC()
    var xindex: Int = 0
    
    if c == getC.EOF {
        xindex = 0
    } else if allbut == false {
        xindex = index(str, c: c)
    } else if index(str, c: c) > 0 {
        xindex = 0
    } else {
        xindex = lastto + 1
    }
    return xindex
}

func makset(charArray: [Character]) -> String {
    var resultArray: [String] = [] //XXX working
    for var i = 0; i < charArray.count; i++ {
        resultArray.append(String(charArray[i]))
    }
    return resultArray.joinWithSeparator("")
}


func ctoi(base: String, inout i: Int) -> Int { // in is reserved by swift.
    var d: Int
    let digits: String = "0123456789"
    var result = 0
    
    while base[base.startIndex.advancedBy(i)] == " " || base[base.startIndex.advancedBy(i)] == "\t" {
        i++
    }
    for result = 0; i < base.characters.count; i++ {
        d = index(digits, c: base[base.startIndex.advancedBy(i)])
        if d == 0 {
            break
        }
        result = 10 * result + d - 1
    }
    return result
}

func itoc(base: Int) -> String {
    let digits: String = "0123456789"
    var i: Int
    var d: Int
    var j: Int
    var k: String
    var intval = abs(base)
    var result = ""
    var cArray: [Character] = []
    var sArray: [String] = []
    var size = 10000 //XXX
    cArray.append(EOS)
    i = 1
    repeat {
        i++
        d = intval % 10
        cArray.append(Character(String(d)))
        intval = intval / 10
    } while !(intval == 0 || i >= size)
    
    if base < 0 && i < size { // thien sign
        i++
        cArray.append("-")
    }
    //itoc = i - 1
    for j = 1; j < i; j++ { // then reverse
        k = cArray[cArray.startIndex.advancedBy(i)]
        cArray[i] = cArray[j]
        cArray[j] = k
        i--
    }
    result = array.joinWithSeparator("")
    return result
}

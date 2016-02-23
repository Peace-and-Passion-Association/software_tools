//
//  tralslit.swift
//  software-tools-swift
//
//  Created by 相川　和希 on 2016/02/23.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//

import Foundation

//func translit(str:String, from: [Character], to: [Character]) -> String {
//    
//}


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
    var resultArray: [String] = []
    for var i = 0; i < charArray.count; i++ {
        resultArray.append(String(charArray[i]))
    }
    return resultArray.joinWithSeparator("")
}

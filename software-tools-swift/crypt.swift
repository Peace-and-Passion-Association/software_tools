//
//  crypt.swift
//  software-tools-swift
//
//  Created by 相川　和希 on 2016/02/23.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//

import Foundation

func crypt(str: String, key: String) -> String {
    //encrypt and decrypt
    let getC = GetC(text: str)
    let putC = PutC.putC
    var c: Character!
    var keylen: Int
    var i: Int
    var result: String = ""
    
    keylen = key.characters.count
    if key == "" {
        stdError("usage: crypt key.")
    }
    for i = 1; getC.get_c(&c) != getC.EOF; i = (i % keylen) + 1 {
        result += putC.put_c(xor(c, b: key[key.startIndex.advancedBy(i-1)]))
    }
    result += putC.put_c(c) // output the buffer.
    return result
}

extension Character {
    func utf8() -> UInt8 {
        let utf8 = String(self).utf8
        return utf8[utf8.startIndex]
    }
}

func xor(a: Character, b: Character) -> Character {
    let utf8 = a.utf8() ^ b.utf8()
    let s = String(bytes: [utf8], encoding: NSUTF8StringEncoding)
    return s![(s?.startIndex)!]
}
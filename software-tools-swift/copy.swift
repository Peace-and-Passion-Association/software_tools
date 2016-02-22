//
//  copy.swift
//  software tools
//
//  Created by AikawaKazuki on 2016/02/18.
//
//

import Foundation

func copy(str:String, path: String? = nil) {
    // copy input chars to output
    var c : Character!
    let getC = GetC(text: str)
    let putC = PutC.putC
    fileInit(path!)
    
    while getC.get_c(&c) != getC.EOF {
        putC.put_c(c, path: path, append: true)
    }
    putC.put_c(c, path: path, append: true) //output the buffer
}

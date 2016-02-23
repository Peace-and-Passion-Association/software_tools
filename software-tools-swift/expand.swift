//
//  expand.swift
//  software tools
//
//  Created by 相川　和希 on 2016/02/20.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//

import Foundation


func expand(str: String) -> String {
    let getC = GetC(text: str)
    let putC = PutC.putC
    var c: Character!
    var code: Character!
    var iCode: Int
    var result: String = ""

    while getC.get_c(&code) != getC.EOF {
        if code == RCODE { // expand repetition
            if getC.get_c(&c) == getC.EOF {
                break
            }
            if getC.get_c(&code) == getC.EOF {
                break
            }
            iCode = Int(String(code))!//XXX how to handle error?
            for ; iCode > 0; iCode-- {
                result += putC.put_c(c)
            }
        } else {
            iCode = Int(String(code))! //XXX how to handle error?
            for ; iCode > 0; iCode-- {
                if getC.get_c(&c) == getC.EOF {
                    break
                }
                result += putC.put_c(c)
            }
            if c == getC.EOF {
                break
            }
        }
    }
    result += putC.put_c(getC.EOF) //output buffer
    return result
}
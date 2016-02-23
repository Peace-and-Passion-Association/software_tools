//
//  compress.swift
//  software tools
//
//  Created by 相川　和希 on 2016/02/19.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//

import Foundation

let MAXCHUNK: Int = 9
let RCODE: Character = "#" //XXX
let THRESH: Int = 5

func compress(str: String) -> String {
    let getC = GetC(text: str)
    let putC = PutC.putC
    var buf: [String] = [String](count: MAXCHUNK + 1, repeatedValue: "#")
    var c: Character!
    var lastc: Character!
    var nrep: Int = 0
    var nsave: Int = 0
    var result: String = ""
    var i = 0
    
    nsave = 0
    for lastc = getC.get_c(); lastc != getC.EOF; lastc = c {
        for nrep = 1; getC.get_c(&c) == lastc; nrep++ {
            if nrep >= MAXCHUNK {// count repetitions
                break
            }
        }
        if nrep < THRESH {
            for ; nrep > 0; nrep-- {
                nsave++
                buf[nsave] = String(lastc)
                if nsave >= MAXCHUNK {
                    result += putbuf(buf, nsave: &nsave)
                }
            }
        } else {
            result += putbuf(buf, nsave: &nsave)
            result += putC.put_c(RCODE)
            result += putC.put_c(lastc)
            result += putC.put_c(nrep)
        }
        i++
    }
    result += putbuf(buf, nsave: &nsave)
    result += putC.put_c(getC.EOF) // output buffer
    return result
}

func putbuf(buf: [String], inout nsave: Int) -> String {
    let putC = PutC.putC
    var i: Int
    var result: String = ""
    if nsave > 0 {
        result += putC.put_c(nsave)
        for i = 1; i <= nsave; i++ {
            result += putC.put_s(buf[i])
        }
    }
    nsave = 0
    return result
}

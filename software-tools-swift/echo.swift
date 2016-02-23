//
//  echo.swift
//  software tools
//
//  Created by AikawaKazuki on 2016/02/18.
//  
//

import Foundation

func echo () -> String{
    let str = readLine(stripNewline: false)
    let standardOutput = NSFileHandle.fileHandleWithStandardOutput()
    let dataout: NSData? = str!.dataUsingEncoding(NSUTF8StringEncoding)
    if let dout = dataout {
        standardOutput.writeData(dout)
    }
    return str! as String
}
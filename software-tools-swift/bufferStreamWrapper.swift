//
//  buffer.swift
//  software tools
//
//  Created by 相川　和希 on 2016/02/19.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//

import Foundation

class BufferStreamWrapper {
    var buffer: UnsafeMutablePointer<UInt8>!
    var bufferSize = 10000
    var outputStream: NSOutputStream!
    var bufferLength :Int = 0
    
    init(size: Int = 10000) {
        self.bufferSize = size
        self.streamInit()
    }
    
    func streamInit() {
        buffer = UnsafeMutablePointer.alloc(bufferSize)
        outputStream = NSOutputStream(toBuffer: buffer, capacity: bufferSize)
        bufferLength = 0
        outputStream.open()
    }
    
    func write(str: String) {
        let memoryLength = str.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
        self.outputStream.write(str, maxLength: memoryLength)
        self.bufferLength += memoryLength
    }
    
    func outputString() -> String {
        let s = String(bytesNoCopy: buffer, length: bufferLength, encoding: NSUTF8StringEncoding, freeWhenDone: true)
        print(s!)
        streamInit()
        return s!
    }
    
}

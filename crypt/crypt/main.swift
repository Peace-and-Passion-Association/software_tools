//
//  main.swift
//  crypt
//
//  Created by 相川　和希 on 2016/02/23.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//

import Foundation

var test = false // is test?
var bufferStream = BufferStreamWrapper() // for test

let argv:[String] = Process.arguments
let argc:Int = Process.arguments.count
var input: String = ""
var output: String?
var key: String = ""
let result: String


/* execute (command + argc.len)
./crypt <in.txt out.txt key (3)
./crypt <in.txt >out.txt key (2)
./crypt in.txt out.txt key (4)
./crypt in.txt >out.txt key (3)
./crypt text out.txt key (4)
./crypt text >out.txt key (3)
*/
if argc == 2 {
    while let line: String = readLine(stripNewline: false) {
        input += (line)
    }
    key = argv[1]
} else if argc == 4 {
    let manager = NSFileManager()
    if manager.fileExistsAtPath(argv[1]) {
        input = readFile(argv[1])
    } else {
        input = argv[1]
    }
    output = argv[2]
    key = argv[3]
} else {
    stdError("usage: crypt [[ src_file | src_text ] target_file crypt_key]")
}

result = crypt(input, key: key)
if output != nil {
    fileInit(output!)
}
write(result, path: output, append: true)

//
//  main.swift
//  expand
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
let result: String

if argc == 1 {
    while let line: String = readLine(stripNewline: false) {
        input += (line)
    }
} else if argc == 2 || argc == 3 {
    let manager = NSFileManager()
    if manager.fileExistsAtPath(argv[1]) {
        input = readFile(argv[1])
    } else {
        input = argv[1]
    }
    if argc == 3 {
        output = argv[2]
    }
} else {
    print("usage: expand [ | [src_file | src_text] [target_file] ]")
    exit(1)
}

// remove automatically "\n" of input.
//print("from")
//print(input, terminator:"")
//print([Character](input.characters))
//input = input.substringToIndex(input.endIndex.predecessor())
//print("as")
//print(input, terminator:"")
//print([Character](input.characters))
//print("to")

result = expand(input)
if output != nil {
    fileInit(output!)
}
write(result, path: output, append: true)
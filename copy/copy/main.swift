//
//  main.swift
//  copy
//
//  Created by 相川　和希 on 2016/02/22.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//

import Foundation
var test = false // is test?
var bufferStream = BufferStreamWrapper() // for test

let argv:[String] = Process.arguments
let argc:Int = Process.arguments.count
var input: String?
var output: String?

if argc == 3 {
    input = argv[1]
    output = argv[2]
} else {
    print("usage: copy src_file target_file")
    exit(1)
}

copy(readFile(input!), path: output)


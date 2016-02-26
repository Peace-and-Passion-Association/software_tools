//
//  main.swift
//  calc
//
//  Created by 相川　和希 on 2016/02/26.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//

import Foundation

// input 1 + (2 - 1) * 4 / 2 =
// output

var test = false // is test?
var bufferStream = BufferStreamWrapper() // for test

let argv:[String] = Process.arguments
let argc:Int = Process.arguments.count
var input:[String]
var output: String?
let result: String

if argc == 1 {
    stdError("usage: calc 1 + 2 =")
}

input = argv
input.removeFirst()

result = calc(input)
write(result + "\n")
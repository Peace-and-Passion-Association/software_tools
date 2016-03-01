//
//  main.swift
//  reversePolishCalc
//
//  Created by 相川　和希 on 2016/03/01.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//

import Foundation

var test = false // is test?
var bufferStream = BufferStreamWrapper() // for test

let argv:[String] = Process.arguments
let argc:Int = Process.arguments.count
var input:[String]
var output: String?
let result: String

if argc == 1 {
    stdError("usage: reversePolishCalc 1 2 +")
}

input = argv
input.removeFirst()

result = reversePolishCalc(input)
write(result + "\n")
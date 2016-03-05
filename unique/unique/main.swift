//
//  main.swift
//  unique
//
//  Created by 相川　和希 on 2016/03/05.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//

import Foundation

var argv:[String] = Process.arguments
var argc:Int = Process.arguments.count
var input: String = ""
var output: String?
let result: String
var optsDict: [String: String]
let path: String?
let argParser = ArgParser(argv: argv)
let rep: Bool

(argv, optsDict) = argParser.optionParse(argv, opts: ["-n"])
argc = argv.count

if let tmp = optsDict["-n"] {
    if tmp == "false" {
        rep = false
    } else {
        rep = true
    }
} else {
    rep = false
}

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
    stdError("usage: input output -n rep")
}

path = output

result = unique(input, rep: rep)
if path != nil {
    fileInit(path!)
}
write(result, path: path, append: true)

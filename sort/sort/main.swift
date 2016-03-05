//
//  main.swift
//  sort
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

(argv, optsDict) = argParser.optionParse(argv, opts: ["-n"])
argc = argv.count
if optsDict["-n"] == nil {
    optsDict["-n"] = "10"
}
let line: Int? = Int(optsDict["-n"]!) //XXX

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
    stdError("usage: input output")
}
path = output

result = sortSentence(input, reverse: false, algo: "quick")
if path != nil {
    fileInit(path!)
}
write(result, path: path, append: true)

//
//  main.swift
//  compare
//
//  Created by 相川　和希 on 2016/03/02.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//

import Foundation

var argv:[String] = Process.arguments
var argc:Int = Process.arguments.count
var output: String?
let result: String
var optsDict: [String: String]
let path: String?
var file1: String!
var file2: String!
var allowance: Int!
var input: String = ""
let fManager = NSFileManager.defaultManager()
let currentPath = fManager.currentDirectoryPath
let tmpFileName = "/comparetmp~~~"

let argParser = ArgParser(argv: argv)

(argv, optsDict) = argParser.optionParse(argv, opts: ["-n"])
argc = argv.count

if argc == 2 {
    while let line: String = readLine(stripNewline: false) {
        input += (line)
    }
    file1 = argv[1]
    file2 = currentPath + tmpFileName
    write(input, path: file2, append: false)
} else if argc == 3 {
    file1 = argv[1]
    file2 = argv[2]
} else {
    stdError("usage: ./compare file1Path file2Path [-n]\n")
}

if let tmp = optsDict["-n"] {
    allowance = Int(tmp)
}
compare(file1, file2Path: file2, allowance: allowance)

if file2.hasSuffix(tmpFileName){
    do {
        try fManager.removeItemAtPath(file2)
    } catch {
    }
}
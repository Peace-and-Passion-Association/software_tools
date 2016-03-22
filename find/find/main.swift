//
//  main.swift
//  find
//
//  Created by 相川　和希 on 2016/03/22.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//

import Foundation

let argv:[String] = Process.arguments
let argc:Int = Process.arguments.count
var input: String = ""
var output: String?
var result: String = ""
var base: String = ""
var pattern: String = ""

if argc == 1 {
    stdError("usage: find pattern file")
} else if argc == 2 {
    stdError("usage: find pattern file")
} else if argc == 3 {
    let manager = NSFileManager()
    if manager.fileExistsAtPath(argv[2]) {
        pattern = argv[1]
        base = readFile(argv[2])
    } else {
        stdError("usage: find pattern file")
    }
}

result = find(base, pattern: pattern)

if output != nil {
    fileInit(output!)
}
write(result, path: output, append: true)
//
//  main.swift
//  concat
//
//  Created by 相川　和希 on 2016/03/02.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//

import Foundation

var argv:[String] = Process.arguments
var argc:Int = Process.arguments.count
let result: String
var filePathes: [String]

if argc == 1 {
    while let line: String = readLine(stripNewline: false) {
        print(line,terminator: "")
    }
} else {
    filePathes = argv
    filePathes.removeAtIndex(0)
    result = concat(filePathes)
    write(result)
}


//
//  main.swift
//  makecopy
//
//  Created by 相川　和希 on 2016/03/02.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//

import Foundation

var argv:[String] = Process.arguments
var argc:Int = Process.arguments.count

if argc == 3 {
    // ./makecopy input output
    var text = readFile(argv[1])
    fileInit(argv[2])
    write(text, path: argv[2], append: true)
} else {
    stdError("usage: ./makecopy input output\n")
}
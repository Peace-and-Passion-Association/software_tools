//
//  main.swift
//  translit
//
//  Created by 相川　和希 on 2016/03/09.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//

import Foundation

// translit <input output> abc ABC

var argv:[String] = Process.arguments
var argc:Int = Process.arguments.count
var base = ""
var from = ""
var to = ""
var allbut = false
var path: String? = nil

if argc == 3 {
    while let line: String = readLine(stripNewline: false) {
        base += (line)
    }
    var f: [Character] = Array(argv[1].characters)
    var t: [Character] = Array(argv[2].characters)
    if f[0] == "!" {
        f.removeFirst()
        allbut = true
    }
    from = filset(f)
    to = filset(t)

} else {
    stdError("usage: from to")
}
let result = translit(base, from: from, to: to, allbut: allbut)

if path != nil {
    fileInit(path!)
}
write(result, path: path, append: true)

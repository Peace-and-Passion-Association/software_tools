//
//  optionParser.swift
//  software-tools-swift
//
//  Created by 相川　和希 on 2016/02/25.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//

import Foundation

//in [./tail, in.txt, out.txt, -n, 10]
//out ({-n: 10}, [./tail, in.txt, out.txt])
// it should be expand to get option without value.(e.g. rm -r)

class ArgParser {
    var argv: [String]
    init(argv: [String]) {
        self.argv = argv
    }
    func optionParse(args: [String], opts: [String]) -> ([String], [String:String]) {
        var optsDict = [String: String]()
        var argsWithoutOpts: [String] = []
        for var i = 0; i < args.count; i++ {
            if opts.contains(args[i]) {
                optsDict[args[i]] = args[i+1]
                i++
            } else {
                argsWithoutOpts.append(args[i])
            }
        }
        return (argsWithoutOpts, optsDict)
    }
}
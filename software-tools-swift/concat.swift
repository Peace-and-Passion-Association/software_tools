//
//  concat.swift
//  software-tools-swift
//
//  Created by 相川　和希 on 2016/03/02.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//

import Foundation

func concat(pathes: [String]) -> String {
    var result = ""
    for path in pathes {
        result += readFile(path)
    }
    return result
}

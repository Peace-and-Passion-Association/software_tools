//
//  readFile.swift
//  software tools
//
//  Created by AikawaKazuki on 2016/02/16.
//
//

import Foundation

public func absolutePath(path:String) -> String {
    let fileManager = NSFileManager.defaultManager()
    
    if path.hasPrefix("./") {       // relative path
        return fileManager.currentDirectoryPath + String((path as NSString).substringFromIndex(1))
    } else if path.hasPrefix("../") {
        return fileManager.currentDirectoryPath + String((path as NSString).substringFromIndex(1))
    } else if path.hasPrefix("~/") {
        return String((path as NSString).stringByExpandingTildeInPath)
    }
    return path
}

public func readFile(path: String) -> String {
    do {
        let text = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding )
        //print(text)
        return text
    } catch {
        //handling error
        print("File open error. path: " + path + " is not correct")
        exit(1)
    }
}

public func fileInit(path:String) {
    if let outputStream = NSOutputStream(toFileAtPath: path, append: false) {
        outputStream.open()
        outputStream.write("", maxLength: "".lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        outputStream.close()
    }
}

public func write(str :String, path: String? = nil, append: Bool = false) {
    if path == nil {
        print(str, terminator:"")
    } else {
        if let outputStream = NSOutputStream(toFileAtPath: path!, append: append) {
            outputStream.open()
            outputStream.write(str, maxLength: str.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
            outputStream.close()
        }
    }
}

public func stdError(str: String) {
    remark(str + "\n")
    exit(1)
}

public func remark(str: String) {
    let outputString: NSString = NSString(string: str)
    let dataout: NSData? = outputString.dataUsingEncoding(NSUTF8StringEncoding)
    let standardError = NSFileHandle.fileHandleWithStandardError()
    if let dout = dataout {
        standardError.writeData(dout)
    }
}

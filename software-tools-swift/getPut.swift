//
//  getput.swift
//  software tools
//
//  Created by AikawaKazuki on 2016/02/16.
//  Copyright 2016 AikawaKazuki. All rights reserved.
//

import Foundation


public class GetC {
    var text: String = ""
    let EOF: Character = "&" //XXX what char is best?
    var lastc: Int = 0
    private var buf: String = ""
    
    init(text:String = "") {
        self.text = text
    }
    func get_c(inout char: Character!, remove_backspaces: Bool = false) -> Character {
        // use inout, to be similar to the book.
        char = get_c(remove_backspaces)
        return char
    }
    
    func get_c(remove_backspaces: Bool = false) -> Character {
        var c: Character!
        if lastc < self.text.characters.count {
            c = self.text[self.text.startIndex.advancedBy(lastc)]
            lastc = lastc + 1
            if remove_backspaces == true {
                c = del_backspace(c)
            }
            return c
        } else {
            c = EOF
            self.lastc = self.lastc + 1
            return c
        }
    }
    
    func del_backspace(c:Character) -> Character { // hello   \n  world   \n
        if c != " " {
            return c
        }
        for var i = lastc; i < self.text.characters.count; i++ {
            let s = self.text[self.text.startIndex.advancedBy(i)]
            if s == "\n" {
                lastc = i + 1
                return "\n"
            }
            if s != " " {
                break
            }
        }
        return c
    }
}

class PutC {
    
    private var buf: String = ""
    static let putC = PutC()
    private init() {
    }
    
    
    func put_s(str:String, path:String? = nil, append: Bool = false) -> String {
        let chars = [Character](str.characters)
        var result = ""
        for c in chars {
            result += self.put_c(c, path: path, append: append)
        }
        return result
    }
    
    func put_c(c:Character, path:String? = nil, append: Bool = false) -> String {
        /*
        @param c Character to put. If get EOF, output buffer.
        @param path : String absolute path of the file.
        */
        let getC = GetC()
        var result: String = ""
        self.buf += String(c)
        //        print("buf =" + self.buf)
        if c == "\n" || c == getC.EOF {
            if c == getC.EOF {
                self.buf = self.buf.substringToIndex(self.buf.endIndex.predecessor())
            }
            if path != nil {
                //print(self.buf)
                write(self.buf, path: path!, append: append)
            }
            if test == true {
                bufferStream.write(self.buf)
            }
            result = self.buf
            self.buf = ""
        }
        return result
    }
    
    func put_c(c:Int, path:String? = nil, append: Bool = false) -> String {
        let str = String(c)
        return self.put_s(str, path: path, append: append)
    }
    
    func outputBuffer(path:String? = nil, append: Bool = false) -> String {
        let result = self.put_c(EOF, path: path, append: append)
        return result
    }
    
}

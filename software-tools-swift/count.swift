//
//  count.swift
//  software tools
//
//  Created by AikawaKazuki on 2016/02/16.
//  
//

import Foundation

//XXX use putdec()

//charcount -- count characters. (includes \n, \t ...)
func charCount(str:String) -> Int {
    var nc: Int = 0
    let getC = GetC(text: str)
    while getC.get_c() != getC.EOF {
        nc++
    }
    return nc
}


//linecount -- count lines.
// empty line (without \n is defined as one line)
func lineCount(str:String) -> Int {
    var nl: Int = 1
    var c: Character!
    let getC = GetC(text: str)
    
    c = getC.get_c()
    while c != getC.EOF {
        if c == "\n" {
            nl++
        }
        c = getC.get_c()
    }
    return nl
}

func wordCount(str:String) -> Int {
    var c: Character!
    var wc: Int = 0
    var inWord: Bool = false
    let getC = GetC(text: str)
    
    c = getC.get_c()
    while c != getC.EOF {
        if c == " " || c == "\n" || c == "\t" {
            inWord = false
        } else if inWord == false {
            inWord = true
            wc++
        }
        c = getC.get_c()
    }
    return wc
}

func wc(str:String) -> String {
    //Q 1-4
    var result = ""
    result = "line : " + String(lineCount(str)) + ", word : " + String(wordCount(str)) + ", char : " + String(charCount(str))
    return result
}

func sentenceCount(str:String) -> Int {
    // sentence is defined any chars + ("." || "?" || "!")
    var sc: Int = 0
    var inSentence: Bool = false
    var c: Character
    let getC = GetC(text: str)
    c = getC.get_c()

    while c != getC.EOF {
        if  c == "." || c == "?" || c == "!" {
            inSentence = false
        } else if inSentence == false {
            inSentence = true
            sc++
        }
        c = getC.get_c()
    }
    if sc != 0 {
        // if there are some character, it overcount.
        sc--
    }
    return sc
}

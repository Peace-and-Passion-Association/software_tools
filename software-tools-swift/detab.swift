//
//  detab.swift
//  software tools
//
//  Created by AikawaKazuki on 2016/02/18.
//  
//

import Foundation
let MAXLINE = 1000
let TABNUM = 4
//XXX 
func detab (str: String) -> String {
    let getC = GetC(text: str)
    let putC = PutC.putC
    var result: String = ""
    var c: Character!
    var col: Int = 1
    let tabs: [Bool] = settab()
    
    c = getC.get_c()
    while c != getC.EOF {
        if c == "\t" {
            repeat {
                result += putC.put_c(" ")
                col = col + 1
            } while !(tabpos(col, tabs: tabs) == true) // to be similar to while-until.
        } else if c == "\n" {
            result += putC.put_c(c)
            col = 1
        } else {
            result += putC.put_c(c)
            col++
        }
        c = getC.get_c()
    }
    return result
}

func tabpos (col: Int, tabs: [Bool]) -> Bool {
    if col > MAXLINE {
        return true
    } else {
        return tabs[col-1]    // Ratfor's array is started by 1, but swift's array is started by 0

    }
}

func settab (cols:String? = nil) -> [Bool] {
    var tabs: [Bool] = []
    if cols != nil {
        
    } else {
        for var i = 1; i < MAXLINE; i++ {
            if (i%TABNUM) == 1 {
                tabs.append(true)
            } else {
                tabs.append(false)
            }
        }
    }
    return tabs
}

func entab (var str:String) -> String {
    str = detab(str) // Q2-2
    let getC = GetC(text: str)
    var c: Character!
    var col: Int = 1
    var newcol: Int = col
    let tabs: [Bool] = settab()
    var result: String = ""
    while true {// in ratfor, this was repeat.
        newcol = col
        c = getC.get_c()
        while c == " " { // correct blanks
            newcol++
            if tabpos(newcol, tabs: tabs) {
                result += "\t"
                col = newcol
            }
            c = getC.get_c()
        }
        for ; col < newcol; col++ {
            result += String(" ") // output leftover blanks
        }
        if c == getC.EOF {
            break
        }
        result += String(c)
        if c == "\n" {
            col = 1
        } else {
            col++
        }
    }
    return result
}

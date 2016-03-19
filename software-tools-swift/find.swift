////
////  find.swift
////  software-tools-swift
////
////  Created by 相川　和希 on 2016/03/10.
////  Copyright © 2016年 AikawaKazuki. All rights reserved.
////
//
//import Foundation
//
////func find(base: String, pattern: String) -> String {
////    let getC = GetC(text: base)
////    var line: String! = ""
////    var result: String = ""
////    if getpat(arg, pattern: pattern) == ERR {
////        stdError("illegal pattern.")
////    }
////    while getC.getlin(&line) == String(EOF) {
////        if match(line, pattern: pattern) == true {
////            result += line
////        }
////    }
////    return result
////}
//
//func match(line: String, pat: String) -> Bool {
//    for var i = 0; i < line.characters.count; i++ {
//        if amatch(line, from: i, pat: pat) > -1 {
//            return true
//        }
//    }
//    return false
//}
//
////func amatch(line: String, from: Int, pat: String) -> Int {
////// without metacharacters.
////    var i = from
////    for var j = 0; j < pat.characters.count; j = j++ {
////        if line[line.startIndex.advancedBy(i)] != pat[pat.startIndex.advancedBy(j)] {
////            return -1 // with no match
////        }
////        i++
////    }
////    return i
////}
//
////func amatch(line: String, from: Int, pat: String) -> Int {
////    // without metacharacters.
////    var i = from
////    for var j = 0; j < pat.characters.count; j = j + patsiz(pat, j) {
////        if omatch(line, i, pat, j) == false {
////            return -1
////        }
////    }
////    return i
////}
//
//func amatch(line: String, from: Int, pat: String) -> Int {
//    var offset = from
//    var i = 0
//    var j = 0
//    var k = 0
//    for j = 0; j < line.characters.count; j = j + patsiz(pat, index: j) {
//        if pat[pat.startIndex.advancedBy(j)] == CLOSURE { // closure entry
//            j = 0//XXX what is J?
//            for var i = offset; i < line.characters.count; {
//                if omatch(line, i: &i, pat: pat, j: j) == false { // match as many as possible
//                    break
//                }
//            }
//            for j = 0; i >= offset; i-- { // XXX what is J?
//                //k = amatch(line, i, pat(j)) XXX
//            }
//        }
//    }
//    return i
//}
//
//func patsiz(pat: String, index: Int) -> Int {
//    let CLOSIZE = 4 //XXX
//    let p = pat[pat.startIndex.advancedBy(index)]
//    if p == CHAR {
//        return 2
//    } else if p == BOL || p == EOL || p == ANY {
//        return 1
//    } else if p == CCL || p == NCCL {
//        return Int(String(pat[pat.startIndex.advancedBy(index + 1)]))! + 2
//    } else if p == CLOSURE {
//        return CLOSIZE // optional
//    } else {
//        stdError("in patsiz: can't happen")
//    }
//    return 0
//}
//
//func omatch(line: String, inout i: Int, pat: String, j: Int) -> Bool {
//    var result: Bool = false
//    var pj = pat[pat.startIndex.advancedBy(j)]
//    var li = line[line.startIndex.advancedBy(i)]
//    if line[line.startIndex.advancedBy(i)] == EOS {
//        return result
//    }
//    var bump = -1
//    if pj == CHAR {
//        if line[line.startIndex.advancedBy(i)] == pat[pat.startIndex.advancedBy(j + 1)]{
//            bump = 1
//        }
//    } else if pj == BOL {
//        if i == 1 {
//            bump = 0
//        }
//    } else if pj == ANY {
//        if li != NEWLINE {
//            bump = 1
//        }
//    } else if pj == EOL {
//        if li != NEWLINE {
//            bump = 0
//        }
//    } else if pj == CCL {
//        if locate(li, pat: pat, offset: j + 1) == true {
//            bump = 1
//        }
//    } else if pj == NCCL {
//        if li != NEWLINE && locate(li, pat: pat, offset: j + 1) == false {
//            bump = 1
//        }
//    } else {
//        stdError("in on match: can't happen")
//    }
//    if bump >= 0 {
//        i += bump
//        result = true
//    }
//    return result
//}
//
//func locate(c: Character, pat: String, offset: Int) -> Bool {
//    var result: Bool = false
//    for var i = offset + Int(String(pat[pat.startIndex.advancedBy(offset)])/* - 1? */)!; i > offset; /*XXX */ i-- {
//        if c == pat[pat.startIndex.advancedBy(i)] {
//            result = true
//            return result
//        }
//    }
//    return false
//}
//
////func getpat() {
////    return makpat(arg, 1, EOS, pat)
////}
//
//func makpat(arg: String, from: Int, delim: Character, inout pat: String) -> Int? {
//    var j = 1
//    var lastj = 1
//    var lastcl = 0
//    var lj: Int
//    var argi: Character = "∑"
//    var i: Int
//    for i = from; arg[arg.startIndex.advancedBy(i)] != delim && i < arg.characters.count; i++ {
//        argi = arg[arg.startIndex.advancedBy(i)]
//        lj = j
//        if argi == ANY {
//            addset(ANY, set: &pat, index: &j)
//        } else if argi == BOL && i == from {
//            addset(BOL, set: &pat, index: &j)
//        } else if argi == EOL && arg[arg.startIndex.advancedBy(i + 1)] == delim {
//            addset(EOL, set: &pat, index: &j)
//        } else if argi == CCL {
//            if getccl(arg, i: &i, pat: &pat, j: &j) == false {
//                break// XXX
//            }
//        } else if argi == CLOSURE && i > from {
//            lj = lastj
//            var patlj = pat[pat.startIndex.advancedBy(lj)]
//            if patlj == BOL || patlj == EOL || patlj == CLOSURE {
//                break
//            }
//            lastcl = stclos(pat, j: j, lastj: lastj, lastcl: lastcl)
//        } else {
//            addset(CHAR, set: &pat, index: &j)
//            addset(esc(Array(arg.characters), index: i), set: &pat, index: &j)
//        }
//        lastj = lj
//    }
//    if argi != delim {
//        return nil
//    } /*else if addset(EOS, set: &apt, index: &j) == No { //(no room) 
//        return nil
//    }*/ else {
//        return i
//    }
//}
//
//func getccl(arg: String, inout i: Int, inout pat: String, inout j: Int) -> Bool {
//    i++
//    var argi = arg[arg.startIndex.advancedBy(i)]
//    print(pat)
//    print(j)
//    if argi == NOT {
//        addset(NCCL, set: &pat, index: &j)
//        i++
//    } else {
//        addset(CCL, set: &pat, index: &j)
//    }
//    print(pat)
//    print(j)
//    var jstart = j
//    addset("0", set: &pat, index: &j)
//    filset(CCLEND, charArray: Array(arg.characters), i: &i, set: &pat, j: &j)
//    pat.replace(jstart, c: Character(String(j - jstart - 1)))
//    if argi == CCLEND {
//        return true
//    } else {
//        return false
//    }
//}
//
//func stclos(pat: String, j: Int, lastj: Int, lastcl: Int) -> Int {
//    return 0 //XXX
//}

func match(line: String, pat: String) -> Bool {
    for var i = 0; i < line.characters.count; i++ {
        if amatch(line, from: i, pat: pat) > -1 {
            return true
        }
    }
    return false
}

func amatch(line: String, from: Int, pat: String) -> Int {
    var stack = 0
    var offset = from
    var j: Int = 0
    var i: Int = 0
    for j = 0; j < pat.characters.count; j = j + patsiz(pat, index: j) {
        if pat.c(j) == CLOSURE { // closure
            //XXX
            print("closure")
            return -1
        } else if omatch(line, i: &i, pat: pat, j: j) == false { // non-closure
            //XXX
            //for ; stack > 0; stack = pat.c(stack + PREVCL)
        } //else omatch succeeded
    }
    return offset
}

func patsiz(pat: String, index: Int) -> Int {
    let p = pat[pat.startIndex.advancedBy(index)]
    if p == CHAR {
        return 2
    } else if p == BOL || p == EOL || p == ANY {
        return 1
    } else if p == CCL || p == NCCL {
        return Int(String(pat[pat.startIndex.advancedBy(index + 1)]))! + 2
    } else if p == CLOSURE {
        return CLOSIZE // optional
    } else {
        stdError("in patsiz: can't happen")
    }
    return 0
}

func omatch(line: String, inout i: Int, pat: String, j: Int) -> Bool {
    var result: Bool = false
    let pj = pat[pat.startIndex.advancedBy(j)]
    let li = line[line.startIndex.advancedBy(i)]
    if line[line.startIndex.advancedBy(i)] == EOS {
        return result
    }
    var bump = -1
    if pj == CHAR {
        if line[line.startIndex.advancedBy(i)] == pat[pat.startIndex.advancedBy(j + 1)]{
            bump = 1
        }
    } else if pj == BOL {
        if i == 1 {
            bump = 0
        }
    } else if pj == ANY {
        if li != NEWLINE {
            bump = 1
        }
    } else if pj == EOL {
        if li != NEWLINE {
            bump = 0
        }
    } else if pj == CCL {
        if locate(li, pat: pat, offset: j + 1) == true {
            bump = 1
        }
    } else if pj == NCCL {
        if li != NEWLINE && locate(li, pat: pat, offset: j + 1) == false {
            bump = 1
        }
    } else {
        stdError("in omatch: can't happen")
    }
    if bump >= 0 {
        i += bump
        result = true
    }
    return result
}

func locate(c: Character, pat: String, offset: Int) -> Bool {
    var result: Bool = false
    
    for var i = offset + Int(String(pat[pat.startIndex.advancedBy(offset)])/* - 1? */)!; i > offset; i-- {
        if c == pat[pat.startIndex.advancedBy(i)] {
            result = true
            return result
        }
    }
    return false
}

func getpat(var arg: String, inout pat: String) -> String {
    if arg.c(arg.characters.count) != EOS {
        arg.append(EOS)
    }
    makpat(arg, from: 0, delim: EOS, pat: &pat)
    return pat
}

func makpat(arg: String, from: Int, delim: Character, inout pat: String) -> Int? {
    var j = 0 //pat index
    var lastj = 0
    var lastcl = 0
    var lj: Int
    var argi: Character = "∑" // tmp.
    var i: Int
    for i = from; i < arg.characters.count && arg[arg.startIndex.advancedBy(i)] != delim ; i++ {
        argi = arg[arg.startIndex.advancedBy(i)]
        lj = j
        if argi == ANY {
            addset(ANY, set: &pat, index: &j)
        } else if argi == BOL && i == from {
            addset(BOL, set: &pat, index: &j)
        } else if argi == EOL && arg[arg.startIndex.advancedBy(i + 1)] == delim {
            addset(EOL, set: &pat, index: &j)
        } else if argi == CCL {
            if getccl(arg, i: &i, pat: &pat, j: &j) == false {
                break// XXX
            }
        } else if argi == CLOSURE && i > from {
            lj = lastj
            var patlj = pat[pat.startIndex.advancedBy(lj)]
            if patlj == BOL || patlj == EOL || patlj == CLOSURE {
                break
            }
            lastcl = stclos(&pat, j: &j, lastj: &lastj, lastcl: lastcl)
        } else {
            addset(CHAR, set: &pat, index: &j)
            addset(esc(Array(arg.characters), index: i), set: &pat, index: &j)
        }
        lastj = lj
    }
    if arg.c(i) != delim {
        stdError("terminated early")
        return nil
    } /*else if addset(EOS, set: &apt, index: &j) == No { //(no room)
        return nil
    }*/ else {
        return i
    }
}

func getccl(arg: String, inout i: Int, inout pat: String, inout j: Int) -> Bool {
    i++
    var argi = arg[arg.startIndex.advancedBy(i)]
    print(pat)
    print(j)
    if argi == NOT {
        addset(NCCL, set: &pat, index: &j)
        i++
    } else {
        addset(CCL, set: &pat, index: &j)
    }
    print(pat)
    print(j)
    var jstart = j
    addset("0", set: &pat, index: &j)
    filset(CCLEND, charArray: Array(arg.characters), i: &i, set: &pat, j: &j)
    print(pat)
    print("j = " + String(j - jstart - 1))
    pat.replace(jstart, c: Character(String(j - jstart - 1)))
    print(pat)
    if arg.c(i) == CCLEND {
        return true
    } else {
        return false
    }
}

func stclos(inout pat: String, inout j: Int, inout lastj: Int, lastcl: Int) -> Int{
    var jp: Int = 0
    var jt: Int = 0
    for jp = j - 1; jp >= lastj; jp-- { // make a hole
        jt = jp + CLOSIZE
        addset(pat.c(jp), set: &pat, index: &jt)
    }
    j += CLOSIZE
    let result = lastj
    addset(CLOSURE, set: &pat, index: &lastj)   // put closure in it
    addset("0", set: &pat, index: &lastj)       // count
    addset(Character(String(lastcl)), set: &pat, index: &lastj)   // prevcl
    addset("0", set: &pat, index: &lastj)   // start

    return result
}
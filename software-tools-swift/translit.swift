//
//  tralslit.swift
//  software-tools-swift
//
//  Created by 相川　和希 on 2016/02/23.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//


func index(str: String, c: Character) -> Int {
    // It is adapted to ratfor, so the first number is not 0 but 1.
    var index = 0
    for index = 0; index < str.characters.count; index++ { //use str_size insted of EOS
        if str[str.startIndex.advancedBy(index)] == c {
            return index + 1
        }
    }
    index = 0
    return index
}

func swiftIndex(str: String, c: Character) -> Int {
    // if none, return -1. result starts by [0]
    var index: Int = 0
    for index = 0; index < str.characters.count; index++ { //use str_size insted of EOS
        if str[str.startIndex.advancedBy(index)] == c {
            return index
        }
    }
    index = -1
    return index
}

func xindex(str: String, c: Character, allbut: Bool, lastto: Int) -> Int {
    let getC = GetC()
    var xindex: Int = 0
    
    if c == getC.EOF {
        xindex = 0
    } else if allbut == false {
        xindex = index(str, c: c)
    } else if index(str, c: c) > 0 {
        xindex = 0
    } else {
        xindex = lastto + 1
    }
    return xindex
}

func xSwiftIndex(str: String, c: Character, allbut: Bool, lastto: Int) -> Int {
    // if none, return nil. result starts by [0]
    let getC = GetC()
    var xindex: Int = 0
    
    if c == getC.EOF {
        xindex = -1
    } else if allbut == false {
        xindex = swiftIndex(str, c: c)
    } else if swiftIndex(str, c: c) != -1 {
        xindex = -1
    } else {
        xindex = lastto + 1
    }
    return xindex
}

func ctoi(base: String, inout i: Int) -> Int { // in is reserved by swift.
    var d: Int
    let digits: String = "0123456789"
    var sign: Int = 1   // 1 or -1 Q2-23
    var result = 0
    
    while base[base.startIndex.advancedBy(i)] == " " || base[base.startIndex.advancedBy(i)] == "\t" {
        i++
    }
    if base[base.startIndex.advancedBy(i)] == "-" {
        sign = -1
        i++
    }
    if base[base.startIndex.advancedBy(i)] == "+" {
        sign = 1
        i++
    }
    for result = 0; i < base.characters.count; i++ {
        d = index(digits, c: base[base.startIndex.advancedBy(i)])
        if d == 0 {
            break
        }
        result = 10 * result + d - 1
    }
    result = result * sign
    return result
}

func itoc(base: Int) -> String {
    //let digits: String = "0123456789"
    var i: Int
    var d: Int
    var j: Int
    var k: Character
    var intval = abs(base)
    var result = ""
    var cArray: [Character] = []
    let size = 10000 //XXX
    //cArray.append(EOS)
    //i = 1
    i = -1 // to start from 0 of subscript
    repeat {
        i++
        d = intval % 10
        cArray.append(Character(String(d)))
        intval = intval / 10
    } while !(intval == 0 || i >= size)
    
    if base < 0 && i < size { // thien sign
        i++
        cArray.append("-")
    }
    //itoc = i - 1
    for j = 0; j < i; j++ { // then reverse
        k = cArray[i]
        cArray[i] = cArray[j]
        cArray[j] = k
        i--
    }
    result = String(cArray)
    return result
}

func putdec(n: Int, w: Int) -> String {
    let putC = PutC.putC
    var result: String = ""
    var nd: Int
    var str: String
    var chars: [Character]
    
    str = itoc(n)
    nd = str.characters.count
    chars = Array(str.characters)
    for var i = nd; i < w; i++ {
        result += putC.put_c(" ")
    }
    for var i = 0; i < nd; i++ {
        result += putC.put_c(chars[i])
    }
    result += putC.put_c(EOF) // outputBuffer
    return result
}

func translit(base: String, from: String, to: String, allbut: Bool = false) -> String {
    var result = ""
    var callap: Bool = false // collapse
    let lastto = to.characters.count - 1 // as subscription of array.
    let getC = GetC(text: base)
    var c: Character!
    var i: Int

    if (from.characters.count - 1) > lastto || allbut == true {
        callap = true
    } else {
        callap = false
    }
    while true {
        i = xSwiftIndex(from, c: getC.get_c(&c) , allbut: allbut, lastto: lastto)
        if callap == true && i >= lastto && lastto >= 0 { // collapse
            result += String(to[to.startIndex.advancedBy(lastto)])
            repeat {
                i = xSwiftIndex(from, c: getC.get_c(&c), allbut: allbut, lastto: lastto)
            } while !(i < lastto)
        }
        if c == EOF {
            break
        }
        if i >= 0 && lastto >= 0 { // translate
            result += String(to[to.startIndex.advancedBy(i)])
        } else if i == -1 { // copy
            result += String(c)
        } // else delete.
    }
    return result
}

// makset and sub routines.
func makset(charArray: [Character]) -> String {
    var resultArray: [String] = [] //XXX working
    for var i = 0; i < charArray.count; i++ {
        resultArray.append(String(charArray[i]))
    }
    return resultArray.joinWithSeparator("")
}

func addset(c: Character, inout set: String, inout index: Int) {
    set.append(c)
    index++
}

func filset(charArray: [Character]) -> String {
    var result = ""
    var j = 0
    
    for var i = 0; i < charArray.count; i++ { // delim?
        if charArray[i] == ESCAPE {
//            addset(esc)XXX
        } else if charArray[i] != "-" {
            addset(charArray[i], set: &result, index: &j)
        } else if j == 0 || (i + 1) == charArray.count {
            addset("-", set: &result, index: &j)
        } else if swiftIndex(digits, c: result[result.startIndex.advancedBy(j-1)]) >= 0 {
//            dodashXXX
        }
    
    }
}

func dodash(valid: String, array: [Character], i: Int, inout set: String, inout j: Int) {
    i = i + 1
    j = j - 1
    let limit = swiftIndex(valid, c: esc(array, index: i))
    
}

func esc(array: [Character], index: Int) -> Character {
    var i = index
    if array[i] != ESCAPE {
        return array[i]
    } else if (i + 1) == array.count { // ESCAPE not special at end.
        return ESCAPE
    } else {
        i++
        if array[i] == "\n" {
            return "\n"
        } else if array[i] == "\t" {
            return "\t"
        } else {
            return array[i]
        }
    }
    assertionFailure() // don't come here.
    return " "
}

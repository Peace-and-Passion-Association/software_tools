//
//  calc.swift
//  software-tools-swift
//
//  Created by 相川　和希 on 2016/02/26.
//  Copyright © 2016年 AikawaKazuki. All rights reserved.
//

import Foundation

func calc(var array: [String]) -> String {
    var end = 0
    let operators = ["+", "-", "*", "/", "(", ")", "="]
    if array[array.count - 1] != "=" {
        stdError("any equal")
    }
    array.removeLast() // remove equal
    while(parenthesis(&array) != "END") {}
    end = array.count
    mulOrDiv(&array, begin: 0, end: &end)
    addOrSub(&array, begin: 0, end: &end)
    for var i = 0; i < operators.count; i++ {
        if array.contains(operators[i]) {
            print(array)
            stdError("syntax error about operators")
        }
    }
    if array.count != 1 {
        print(array)
        stdError("syntax error about operators")
    }
    return array[0]
}


func mulOrDiv(inout array: [String], begin: Int, inout end: Int) {
    // in the parenthesis, ( 3 + 2 * 4 + 3 ) or any parenthesis.
    //end should be the index of ")" or "="
    for var i = begin; i < end; i++ {
        if array[i] == "*" {
            if isNumber(array[i-1]) == false || isNumber(array[i+1]) == false {
                stdError("Characters are not calculatable")
            }
            array[i-1] = String(Float(array[i-1])! * Float(array[i+1])!)
            array[i...i+1] = []
            i--
            end = end - 2
        }
        if array[i] == "/" {
            if isNumber(array[i-1]) == false || isNumber(array[i+1]) == false {
                stdError("Characters are not calculatable")
            }
            array[i-1] = String(Float(array[i-1])! / Float(array[i+1])!)
            array[i...i+1] = []
            i--
            end = end - 2
        }
    }
}

func addOrSub(inout array: [String], begin: Int, inout end: Int) {
    // in the parenthesis, (3 + 2 * 4 + 3) or any parenthesis.
    for var i = begin; i < end; i++ {
        if array[i] == "+" {
            if isNumber(array[i-1]) == false || isNumber(array[i+1]) == false {
                stdError("Characters are not calculatable")
            }
            array[i-1] = String(Float(array[i-1])! + Float(array[i+1])!)
            array[i...i+1] = []
            i--
            end = end - 2
        }
        if array[i] == "-" {
            if isNumber(array[i-1]) == false || isNumber(array[i+1]) == false {
                stdError("Characters are not calculatable")
            }
            array[i-1] = String(Float(array[i-1])! - Float(array[i+1])!)
            array[i...i+1] = []
            i--
            end = end - 2
        }
    }
}

func isNumber(str: String) -> Bool {
    let numbersAndPoint = "0123456789."
    let prefix = "+-"
    var i = 0
    for c in str.characters {
        if let _ = numbersAndPoint.rangeOfString(String(c)) {
            i++
            continue
        } else {
            // not numbersAndPoint
            if i == 0 && str.characters.count != 1 { // is prefix?
                if let _ = prefix.rangeOfString(String(c)) {
                    i++
                    continue
                }
            }
            return false
        }
        i++
    }
    return true
}

func parenthesis(inout array: [String]) -> String {
    // get a ( to )
    // return token. if there is any (), return "END", else return "MORE"
    var in_parenthesis = false
    var begin: Int = 0
    var end: Int = 0
    for var i = 0; i < array.count; i++ {
        if array[i] == "(" {
            in_parenthesis = true
            begin = i
        }
        if array[i] == ")" {
            if in_parenthesis == false {
                stdError("syntax error at input")
            } else {
                end = i
                break
            }
        }
    }
    if in_parenthesis == false {
        // any ()
        return "END"
    }
    if end == 0 {
        stdError("'(' may not be closed")
    }
    mulOrDiv(&array, begin: begin + 1, end: &end)
    addOrSub(&array, begin: begin + 1, end: &end)
    // remove "(" and ")"
    array.removeAtIndex(end)
    array.removeAtIndex(begin)
    return "MORE"
}

func reversePolishCalc(var input: [String]) -> String {
    // this is Reverse Polish Notation
    // 2 3 + 4 2 *
    let symbol = ["+", "-", "*", "/"]
    var stack: [String] = []
    var accum: String! = "" // accumulator
    if let tmp = pop(&input) {
        accum = tmp
    } else {
        stdError("input is nil")
    }
    
    while true {
        if isNumber(accum) == true {
            push(&stack, value: accum)
        }
        if symbol.contains(accum) {
            let sym = accum
            var value: [Float] = [0, 0]
            for var i = 0; i < value.count; i++ {
                if let tmp = pop(&stack) {
                    if isNumber(tmp) {
                        value[i] = Float(tmp)!
                    } else {
                        stdError("input is wrong, " + tmp + " is not number")
                    }
                } else {
                    stdError("numbers may be shortage.")
                }
            }

            if sym == "+" {
                accum = String(value[0] + value[1])
            }
            if sym == "-" {
                accum = String(value[0] - value[1])
            }
            if sym == "*" {
                accum = String(value[0] * value[1])
            }
            if sym == "/" {
                accum = String(value[0] / value[1])
            }
            push(&stack, value: accum)
            accum = nil
        }
        
        if let tmp = pop(&input) {
            accum = tmp
        } else {
            // finish input
            if stack.count == 1 {
                return pop(&stack)!
            } else {
                stdError("input is wrong, the numbers may be too many")
            }
        }
    }
}

func push<T>(inout stack: [T], value: T) {
    stack.insert(value, atIndex: 0)
}

func pop<T>(inout stack: [T]) -> T? {
    var result: T
    if stack.isEmpty {
        return nil
    } else {
        result = stack[0]
        stack.removeFirst()
    }
    return result
}

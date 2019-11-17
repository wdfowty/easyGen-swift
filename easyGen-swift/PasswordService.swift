//
//  PasswordService.swift
//  easyGen-swift
//
//  Created by Sean Whitley on 11/15/19.
//  Copyright © 2019 Developed by Dubya. All rights reserved.
//

import Foundation

extension String {
    // return character at given index as string
    // https://stackoverflow.com/a/24144365
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
}
extension Substring {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}


class PasswordService {
    init() {
        uppAmount = (self.maxLength) - (self.symAmount) - (self.numAmount) - (self.lowAmount)
    }
    
    let random = RandomService()
    let classPrintName = "PasswordService -- "
    
    let uppercaseLetters: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    let lowercaseLetters: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    let numbers: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    var symbols: [String] = ["!"]   // variable for adding new user-def symbols
    var separator: String = "-"     // char that separates chunks TODO: make user-defined
    
    let maxLength = 20;             // maxLength = userSelectedLength
    var finalLength: Int = 24;      // finalLength = maxlength + numberOfDashes;
    var chunkSize: Int = 5;         // user defined amount of chars between dashes
    var symAmount: Int = 3;         // # of symbols to use TODO: make user-defined
    var numAmount: Int = 5;         // # of numbers to use TODO: make user-defined
    var lowAmount: Int = 9;         // # of numbers to use TODO: make user-defined
    var uppAmount: Int?
    
    var randomSymbols: [String] {
        return self.getRandomString(possibleChars: symbols, length: symAmount)
    }
    
    var randomNumbers: [String] {
        return self.getRandomString(possibleChars: numbers, length: numAmount)
    }
    
    var randomLowers: [String] {
        return self.getRandomString(possibleChars: lowercaseLetters, length: lowAmount)
    }
    
    var randomUppers: [String] {
        return self.getRandomString(possibleChars: uppercaseLetters, length: uppAmount!)
    }
    
    /*
    func stringToArray(str: String) -> [Character] {
        var arr: [Character]
        var c: Character
        
        
    for i in 0...(str.count - 1) {
            c = str[i]
            arr[i] = c
        }
        return arr
    }*/
    
    func getRandomString(possibleChars: [String], length: Int) -> [String] {
        // return a random string from possibleChars of length characters
        var result: [String] = [String].init()
        var index: Int
        var c: String
        
        for _ in 0..<length {
            index = random.getRandomInt(max: possibleChars.count)
            c = String(possibleChars[index])
            result.append(c)
        }
        return result
    }
    
    func generatePassword() -> String {
        // TODO: may want to implement way to keep symbol from being first letter
        var result: String
        var generatedPass: [String]
        var index: Int
        
        // concatenate random strings from each category
        generatedPass = [String].init(self.randomLowers)
        generatedPass.append(contentsOf: self.randomNumbers)
        generatedPass.append(contentsOf: self.randomSymbols)
        generatedPass.append(contentsOf: self.randomUppers)
        
        // Do the Shuffle
        generatedPass.shuffle()
        generatedPass.shuffle()
        generatedPass.shuffle()
        
        // add the dash every chunkSize
        index = maxLength - chunkSize
        generatedPass.insert(separator, at: index)
        index -= chunkSize
        generatedPass.insert(separator, at: index)
        index -= chunkSize
        generatedPass.insert(separator, at: index)
        
        result = String(generatedPass.joined(separator: ""))
        
        return result
    }
}

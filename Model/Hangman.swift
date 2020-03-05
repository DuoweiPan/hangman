//
//  Hangman.swift
//  Hangman
//
//  Created by Jackson Chui on 2/20/20.
//  Copyright © 2020 Tim's Apples. All rights reserved.
//

import Foundation

class Hangman {
    let wwdcArray:[String] = [
        "Good morning",
        "We have developers here",
        "June Fourth",
        "World Wide Developers Conference",
        "San Jose Convention Center",
        "App Store turns ten",
        "This is mind blowing",
        "This is beyond remarkable",
        "the power of code",
        "Everyone Can Code",
        "changing the world",
        "Today is all about software",
        "Craig Federighi",
        "Hair Force One",
        "tens of millions of students",
        "Swift on the App Store",
        "fastest growing programming language",
        "Swift Playgrounds",
        "group of creators",
        "The App Store",
        "Your creativity and hard work",
        "Tim Cook",
        "Split View",
        "Drag and Drop",
        "Slide Over",
        "ARKit",
        "Find My",
        "iMessage",
        "Airpods Pro",
        "Voice Memos",
        "Apple News",
        "Do Not Disturb",
        "Apple Park",
        "Apple Watch Series",
        "Siri Shortcuts",
        "macOS Mojave",
        "macOS Catalina",
        "macOS High Sierra",
        "AMD Vega Pro",
        "Macbook Pro",
        "Core ML",
        "iMac Pro"
    ]
    
    var wrongChar: [Character] = []
    var guessedChar: [Character] = []
    var curPhrase = ""
    var life = 6
    
    // MARK: - Your Code Here
    func setPhrase(){
        if let res = wwdcArray.randomElement() {
            curPhrase = res
        }
        guessedChar = Array(repeating: "_", count: curPhrase.count)
    }
    
    func guess(cur: Character) -> Bool{
        if !(curPhrase.contains(cur)) {
            wrongChar.append(cur)
            life -= 1
            return false
        } else {
            if !guessedChar.contains(cur) {
                for i in 0...strlen(curPhrase)-1 {
                    let index = curPhrase.index(curPhrase.startIndex, offsetBy: i)
                    if (cur == curPhrase[index]){
                        guessedChar[i] = cur
                    }
                }
            }
            return true
        }
    }
    
    func canContinue() -> Bool {
        return life > 0
    }
    
    func checkWin() -> Bool {
        return canContinue() && !guessedChar.contains("_")
    }
}


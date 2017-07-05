//
//  Flashcards.swift
//  MyFlashcardApp
//
//  Created by iD Student on 7/4/17.
//  Copyright © 2017 iDTech. All rights reserved.
//

import Foundation

class Flashcard {
    var question:String
    var options:[String]
    var correctAnswer:String
    
    init(question:String, options:[String]) {
        self.question = question
        self.options = options
        
        self.correctAnswer = options[0]
    }
}

class CardCollection {
    
    
    public static var instance:CardCollection = CardCollection()
    
    public private(set) var cards:[Flashcard]
    
    public private(set) var currentIndex: Int
    
    public var currentCard:Flashcard{
        get {
            return cards[currentIndex]
        }
    }
    
    private init() {
        cards = [ Flashcard(question: "Test Question", options: ["True", "False"]),
            Flashcard(question: "Who am I", options: ["Michael", "Kim"]),
            Flashcard(question: "Where Do I live", options: ["Seoul", "Palo Alto"]),
            Flashcard(question: "Where am I", options: ["Home", "iDTech"])]
        
        currentIndex = 0;
        
    }
    public func nextQuestion() {
        currentIndex += 1
        if(currentIndex >= cards.count){
            currentIndex = 0
        }
    }
    
    public func checkAnswer (_ selectedAnswer:Int) -> Bool {
        return currentCard.options[selectedAnswer] == currentCard.correctAnswer
    }
}

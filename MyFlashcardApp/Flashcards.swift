//
//  Flashcards.swift
//  MyFlashcardApp
//
//  Created by iD Student on 7/4/17.
//  Copyright © 2017 iDTech. All rights reserved.
//

import Foundation
import GameKit

class Flashcard {
    var question:String
    var options:[String]
    var correctAnswer:String
    
    init(question:String, options:[String]) {
        self.question = question
        self.options = options
        
        self.correctAnswer = options[0]
        
        self.options = shuffle(list: options)
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
        cards = [
            Flashcard(question: "Who am I", options: ["Michael", "Mitch", "Mike", "Kimchi"]),
            Flashcard(question: "Where Do I live", options: ["Palo Alto", "Seoul", "San Jose", "San Fransisco"]),
            Flashcard(question: "Where am I", options: ["iDTech", "Home", "Korea", "Friends House", "In-N-Out"]),
            Flashcard(question: "Is mac or pc better", options: ["Mac", "PC"]),
            Flashcard(question: "When is the concert", options: ["July 14", "July 15", "Next Week"]),
            Flashcard(question: "Which Highschool do I go to", options: ["Gunn Highschool", "Palo Alto Senior Highschool"]),
            Flashcard(question: "", options: []),
            Flashcard(question: "", options: []),
            Flashcard(question: "", options: []),
            Flashcard(question: "", options: []),
            Flashcard(question: "", options: []),
            Flashcard(question: "", options: []),
            Flashcard(question: "", options: []),
            Flashcard(question: "", options: []),
            Flashcard(question: "", options: [])]
        
        currentIndex = 0;
        
        cards = shuffle(list: cards)

    }
    public func nextQuestion() {
        currentIndex += 1
        if(currentIndex >= cards.count){
            currentIndex = 0
            cards = shuffle(list:cards)
        }
        currentCard.options = shuffle( list: currentCard.options)
    }
    
    
    public func checkAnswer(_ selectedAnswer : Int) -> Bool {
        return currentCard.options[selectedAnswer] == currentCard.correctAnswer
    }
}

func shuffle<T>(list : [T]) -> [T] {
    return GKRandomSource.sharedRandom().arrayByShufflingObjects(in: list) as![T]
}





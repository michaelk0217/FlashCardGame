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
            Flashcard(question: "Which Highschool do I go to", options: ["Palo Alto Senior Highschool", "Gunn Highschool"]),
            Flashcard(question: "Which Middleschool did I go to", options: ["Jane Lanthrop Stanford", "Jordan Middle School", "Terman Middle School"]),
            Flashcard(question: "Which Elementary School did I go to", options: ["Palo Verde", "Fairmeadow"]),
            Flashcard(question: "What is my mother country", options: ["Korea","USA","Japan"]),
            Flashcard(question: "How many different countries have I lived in", options: ["3", "4", "2", "1"]),
            Flashcard(question: "What is my favorite color", options: ["Black", "Blue", "red", "white"]),
            Flashcard(question: "What kind of phone do I hvae", options: ["iPhone", "Samsung Galaxy", "Andriod"]),
            Flashcard(question: "What is my current favorite game", options: ["Hearthstone","Overwatch","Heroes of the Storm"]),
            Flashcard(question: "Am I good at coding", options: ["I don't know", "Yes", "No"]),
            Flashcard(question: "Am I lazy", options: ["Yes", "I don't know", "No"])]
        
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





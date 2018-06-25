//
//  ConcentrationBrain.swift
//  Concentraion 2
//
//  Created by ARNAV SINGHANIA on 4/12/18.
//  Copyright © 2018 Singhania Tech. All rights reserved.
//

import Foundation

class ConcentrationBrain {
    
    var cardsArray = [Card]()
    private let numOfCardPairs: Int
    var numOfCardsFacedUp: Int = 0
    var cardsFacedUp = [Card]()
    var indexesOfCardsFacedUp = [Int]()
    var points = 0
    var highScore = 0
    
    init(numOfCardPairs: Int) {
        
        self.numOfCardPairs = numOfCardPairs
       
        self.generateCards()
        
        self.shuffle()
        
    }
    
    func cardPressed(index:Int) {
        
        if (cardsArray[index].isFaceUp) {
            cardsArray[index].isFaceUp = false
            self.numOfCardsFacedUp -= 1
        } else {
            cardsArray[index].isFaceUp = true
            self.numOfCardsFacedUp += 1
            cardsArray[index].numOfTimesFlipped += 1
        }
        
    }
    
    private func generateCards() {
        
        for index in 0..<self.numOfCardPairs {
            
            cardsArray.append(Card(identifier: index))
            cardsArray.append(Card(identifier: index))
            
        }
        
    }
    
    func shuffle() {
        
        for counter in 0..<(2*self.numOfCardPairs) {
            let index = Int(arc4random_uniform(UInt32(self.numOfCardPairs*2)))
            let firstIdentifier = self.cardsArray[counter].identifier
            let secondIdentifier = self.cardsArray[index].identifier
            self.cardsArray[counter].identifier = secondIdentifier
            self.cardsArray[index].identifier = firstIdentifier
        }
        
    }
    
    func checkForMatch() -> Bool {
        
        if (self.cardsFacedUp[0].identifier == self.cardsFacedUp[1].identifier) {
            self.points+=2
            self.cardsArray[indexesOfCardsFacedUp[0]].matched = true
            self.cardsArray[indexesOfCardsFacedUp[1]].matched = true
            
            return true
            
        } else {
            if (self.cardsFacedUp[0].numOfTimesFlipped > 1 || self.cardsFacedUp[1].numOfTimesFlipped > 1) {
                self.points-=1
            }
        }
        
        cardsFacedUp.removeAll()
        indexesOfCardsFacedUp.removeAll()
        return false
        
    }
    
}

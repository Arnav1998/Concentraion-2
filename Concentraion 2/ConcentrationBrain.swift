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
    var points = 0
    
    init(numOfCardPairs: Int) {
        
        self.numOfCardPairs = numOfCardPairs
       
        generateCards()
        
        //TODO shuffle cards
        
    }
    
    func cardPressed(index:Int) {
        
        if (cardsArray[index].isFaceUp) {
            cardsArray[index].isFaceUp = false
            self.numOfCardsFacedUp -= 1
        } else {
            cardsArray[index].isFaceUp = true
            self.numOfCardsFacedUp += 1
        }
        
    }
    
    private func generateCards() {
        
        for index in 0..<self.numOfCardPairs {
            
            cardsArray.append(Card(identifier: index, isFaceUp: false))
            cardsArray.append(Card(identifier: index, isFaceUp: false))
            
        }
        
    }
    
    private func shuffle() {
        
        
        
    }
    
    func checkForMatch(){
        
        if (self.cardsFacedUp[0].identifier == self.cardsFacedUp[1].identifier) {
            points+=1
        }
        
        cardsFacedUp.removeAll()
        
    }
    
    
    
}

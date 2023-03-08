//
//  Player.swift
//  CheukWeiLin
//
//  Created by Cheuk Wei Lin on 06/03/2023.
//

import Foundation

class Player{
    
    var image : String
    var name : String
    var fullname : String
    var number : String
    var position : String
    var age : String
    var appearances : String
    var goals : String
    var country : String
    var joined : String
    var quote : String
    var kitImage : String
    var kitLink : String
    var kitPrice : String
    var kitSize : String
    var kitFit : String
    var kitShipping : String
    var url : String
    
    init(image: String, name: String, fullname: String, number: String, position: String, age: String, appearances: String, goals: String, country: String, joined: String, quote: String, kitImage: String, kitLink: String, kitPrice: String, kitSize: String, kitFit: String, kitShipping: String, url: String) {
        self.image = image
        self.name = name
        self.fullname = fullname
        self.number = number
        self.position = position
        self.age = age
        self.appearances = appearances
        self.goals = goals
        self.country = country
        self.joined = joined
        self.quote = quote
        self.kitImage = kitImage
        self.kitLink = kitLink
        self.kitPrice = kitPrice
        self.kitSize = kitSize
        self.kitFit = kitFit
        self.kitShipping = kitShipping
        self.url = url
    }
}

//
//  PlayerXML.swift
//  CheukWeiLin
//
//  Created by Cheuk Wei Lin on 06/03/2023.
//

import Foundation

class PlayerXML: NSObject, XMLParserDelegate{
    
    var name : String
    
    init(name : String) {
        self.name = name
    }
    
    var playerImage, playerName, playerFullname, playerNumber, playerPosition, playerAge, playerAppearances, playerGoals, playerCountry, playerJoined, playerQuote, playerKitimage, playerKitlink, playerKitprice, playerKitsize, playerKitfit, playerKitshipping, playerUrl : String!
    
    let tags = ["image", "name", "fullname", "number", "position", "age", "appearances", "goals", "country", "joined", "quote", "kit-image", "kit-link", "kit-price", "kit-size", "kit-fit", "kit-shipping", "url"]
    
    var elementId = -1
    var passData = false
    
    var playersData = [Player]()
    var playerData : Player!
    
    var parser : XMLParser!

    func parser(_ parser: XMLParser, foundCharacters string: String) {

        if passData{

            switch elementId{
                case 0 : playerImage            = string
                case 1 : playerName             = string
                case 2 : playerFullname         = string
                case 3 : playerNumber           = string
                case 4 : playerPosition         = string
                case 5 : playerAge              = string
                case 6 : playerAppearances      = string
                case 7 : playerGoals            = string
                case 8 : playerCountry          = string
                case 9 : playerJoined           = string
                case 10 : playerQuote           = string
                case 11 : playerKitimage        = string
                case 12 : playerKitlink         = string
                case 13 : playerKitprice        = string
                case 14 : playerKitsize         = string
                case 15 : playerKitfit          = string
                case 16 : playerKitshipping     = string
                case 17 : playerUrl             = string
                
                default : break;
            }
        }
    }
    
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {

        if tags.contains(elementName){
            passData = true
            
            switch elementName{
                case "image"            : elementId = 0
                case "name"             : elementId = 1
                case "fullname"         : elementId = 2
                case "number"           : elementId = 3
                case "position"         : elementId = 4
                case "age"              : elementId = 5
                case "appearances"      : elementId = 6
                case "goals"            : elementId = 7
                case "country"          : elementId = 8
                case "joined"           : elementId = 9
                case "quote"            : elementId = 10
                case "kit-image"        : elementId = 11
                case "kit-link"         : elementId = 12
                case "kit-price"        : elementId = 13
                case "kit-size"         : elementId = 14
                case "kit-fit"          : elementId = 15
                case "kit-shipping"     : elementId = 16
                case "url"              : elementId = 17
                
                default: break;
            }
        }
    }
    

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if tags.contains(elementName){
            passData = false
            elementId = -1
        }

        if elementName == "player" {
            playerData = Player(image: playerImage, name: playerName, fullname: playerFullname, number: playerNumber, position: playerPosition, age: playerAge, appearances: playerAppearances, goals: playerGoals, country: playerCountry, joined: playerJoined, quote: playerQuote, kitImage: playerKitimage, kitLink: playerKitlink, kitPrice: playerKitprice, kitSize: playerKitsize, kitFit: playerKitfit, kitShipping: playerKitshipping, url: playerUrl)
            
            playersData.append(playerData)
        }
    }
        

    func parsing(){
        
        let bundleURL = Bundle.main.bundleURL 
        let fileURL = NSURL(fileURLWithPath: self.name, relativeTo: bundleURL)
        
        parser = XMLParser(contentsOf: fileURL as URL)
        parser.delegate = self
        
        parser.parse()
    }
    
}

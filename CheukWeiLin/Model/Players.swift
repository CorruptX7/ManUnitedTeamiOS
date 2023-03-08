//
//  Players.swift
//  CheukWeiLin
//
//  Created by Cheuk Wei Lin on 06/03/2023.
//

import Foundation

class Players{
    
    var data : [Player]!

    
    init(fromXMLfile : String){
        let parser =  PlayerXML(name: fromXMLfile)
        parser.parsing()
        self.data = parser.playersData
    }
    
    
    func getPlayer(index:Int) -> Player{
        return data[index]
    }
    
    
    func getCount() -> Int{
        return data.count
    }
    
    
    func getNames() -> [String]{
        var names = [String]()

        for playerData in data{
            names.append(playerData.name)
        }
        
        return names
    }
}


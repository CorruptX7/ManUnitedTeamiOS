//
//  PremierLeagueStats.swift
//  CheukWeiLin
//
//  Created by Cheuk Wei Lin on 06/03/2023.
//

import Foundation

struct PremierLeagueStats: Decodable {
    let img : String
    let position : Int
    let team : String
    let mp : Int
    let w : Int
    let d : Int
    let l : Int
    let points : Int
}

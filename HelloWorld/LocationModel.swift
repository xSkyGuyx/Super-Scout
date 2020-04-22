//
//  LocationModel.swift
//  SuperScoutStoryboard
//
//  Created by Skyhlar Myers on 1/27/20.
//  Copyright © 2020 Skyhlar Myers. All rights reserved.
//

import UIKit

class LocationModel: NSObject {
    var matchNumber: String!
    var red1: String!
    var red2: String!
    var red3: String!
    var blue1: String!
    var blue2: String!
    var blue3: String!

    override init(){
        
    }
    
    init(matchNumber: String!, red1: String!, red2: String!, red3: String!, blue1: String!, blue2: String!, blue3: String!){
        
        self.matchNumber = matchNumber
        self.red1 = red1
        self.red2 = red2
        self.red3 = red3
        self.blue1 = blue1
        self.blue2 = blue2
        self.blue3 = blue3
        
    }
    
    override var description: String{
        return "Match Number: \(self.matchNumber), Red 1: \(red1), Red 2: \(red2), Red 3: \(red3), Blue 1: \(blue1), Blue 2: \(blue2), Blue 3: \(blue3)"
    }
}

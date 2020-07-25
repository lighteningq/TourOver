//
//  SinglePlace.swift
//  ARSwiftUI
//
//  Created by Felix Qiang on 7/18/20.
//  Copyright © 2020 Felix Qiang. All rights reserved.
//

import SwiftUI

struct SinglePlace: Identifiable, Hashable, Codable {
    var id = UUID()
    var name: String!
    var city: String?
    var imgName: String?
    var type: String?
    var videoName: String?
    var isNearMe: Bool = false

//    init(name: String, type: String){
//        self.name = name
//        self.type = type
//    }
//    
//    init(name: String, city: String, imgName: String){
//        self.name = name
//        self.city = city
//        self.imgName = imgName
//    }
    
}

#if DEBUG

let testData = [
    SinglePlace(name:"Ferry Building", city: "San Francisco", imgName:"ferry-building"),
    SinglePlace(name:"Ferry Building", city: "San Francisco", imgName:"ferry-building"),
    SinglePlace(name:"Ferry Building", city: "San Francisco", imgName:"ferry-building"),
    SinglePlace(name:"Ferry Building", city: "San Francisco", imgName:"ferry-building"),
    SinglePlace(name:"Ferry Building", city: "San Francisco", imgName:"ferry-building"),
    SinglePlace(name:"Ferry Building", city: "San Francisco", imgName:"ferry-building"),
    SinglePlace(name:"Ferry Building", city: "San Francisco", imgName:"ferry-building"),
    SinglePlace(name:"Ferry Building", city: "San Francisco", imgName:"ferry-building"),
    SinglePlace(name:"Ferry Building", city: "San Francisco", imgName:"ferry-building"),
    SinglePlace(name:"Ferry Building", city: "San Francisco", imgName:"ferry-building")

]
#endif




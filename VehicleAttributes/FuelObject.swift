//
//  FuelObject.swift
//  VehicleAttributes
//
//  Created by Omar Allaham on 1/15/17.
//  Copyright © 2017 Bemaxnet. All rights reserved.
//

import ObjectMapper

class FuelObject: Mappable {

   var type: String?

   var average: AverageObject?

   var tankVolume: Int?

   required init?(map: Map){

   }

   init() {
   }

   func mapping(map: Map) {
      average <- map["average_consumption"]
      tankVolume <- map["tank_volume"]
   }
}

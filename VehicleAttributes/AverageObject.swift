//
//  AverageObject.swift
//  VehicleAttributes
//
//  Created by Omar Allaham on 1/15/17.
//  Copyright © 2017 Bemaxnet. All rights reserved.
//

import ObjectMapper

enum AverageType: String {
   case unknown = ""

   case mixed = "Mixed"
   case rural = "Rural"
   case urban = "Urban"
}

class AverageObject: Mappable {

   var items: [[String:Double]] = []

   required init?(map: Map){

   }

   init() {
   }

   func mapping(map: Map) {

      for item in map.JSON {
         items.append([item.key : item.value as? Double ?? 0])
      }
   }
}

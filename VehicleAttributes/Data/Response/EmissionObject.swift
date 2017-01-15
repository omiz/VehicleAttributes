//
//  EmissionObject.swift
//  VehicleAttributes
//
//  Created by Omar Allaham on 1/15/17.
//  Copyright © 2017 Bemaxnet. All rights reserved.
//

import ObjectMapper

class EmissionObject: Mappable {

   var fuel: String?

   var emission: String?

   var average: AverageObject?

   required init?(map: Map){
   }

   init() {
   }

   func mapping(map: Map) {
      let emission = map.JSON.first?.key
      average <- map[emission ?? ""]

      self.emission = emission
   }
}

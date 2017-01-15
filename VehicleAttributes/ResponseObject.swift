//
//  ResponseObject.swift
//  VehicleAttributes
//
//  Created by Omar Allaham on 1/15/17.
//  Copyright © 2017 Bemaxnet. All rights reserved.
//

import ObjectMapper

class ResponseObject: Mappable {
   
   var regno: String?
   var vin: String?
   var brand: String?
   var year: NSInteger?
   var gearbox_type: String?
   
   var fuel_types: [String] = []

   var fuels: [FuelObject] = []
   var emissions: [EmissionObject] = []

   required init?(map: Map){

   }

   func mapping(map: Map) {
      regno <- map["regno"]
      vin <- map["vin"]
      brand <- map["brand"]
      year <- map["year"]
      gearbox_type <- map["gearbox_type"]
      fuel_types <- map["fuel_types"]

      let fuelMap: [String: Any] = map["fuel"].value() ?? [:]
      for key in fuelMap.keys {
         var item = FuelObject()
         item <- map["fuel." + key]
         item.type = key

         fuels.append(item)
      }

      let emissionMap: [String: Any] = map["emission"].value() ?? [:]

      for fuelKey in emissionMap.keys {

         let supMap: [String: Any] = map["emission." + fuelKey].value() ?? [:]

         for _ in supMap.keys {
            var item = EmissionObject()
            item <- map["emission." + fuelKey]

            item.fuel = fuelKey

            emissions.append(item)
         }
      }
   }
}

//
//  DataManager.swift
//  VehicleAttributes
//
//  Created by Omar Allaham on 1/15/17.
//  Copyright © 2017 Bemaxnet. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

class DataManager {

   static var baseUrl: String = {
      let path = Bundle.main.path(forResource: "url", ofType: "plist")

      assert(path != nil, "url file is missing. Please provide url.plist")

      let dic = NSDictionary(contentsOfFile: path!)
      return dic?["base"] as? String ?? ""
   }()

   static var attributes: Attributes = {
      return Attributes()
   }()
}

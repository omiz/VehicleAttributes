//
//  Attributes.swift
//  VehicleAttributes
//
//  Created by Omar Allaham on 1/15/17.
//  Copyright © 2017 Bemaxnet. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class Attributes {
   
   private var request: Alamofire.Request?

   func load(_ param: [String: Any]? = nil, handler: ((ResponseObject?, Error?) -> Void)?) -> Bool {

      guard request == nil else {
         return false
      }

      request = Alamofire.request(DataManager.baseUrl, parameters: param).responseObject { (response: DataResponse<ResponseObject>) in

         switch response.result {
         case .success(let data):
            print(data)
            handler?(data, nil)

         case .failure(let error):
            handler?(nil, error)
         }

         self.request = nil
      }

      return true
   }

   func cancel() {
      request?.cancel()
   }
}

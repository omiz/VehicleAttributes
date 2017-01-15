//
//  UIViewController.swift
//  VehicleAttributes
//
//  Created by Omar Allaham on 1/14/17.
//  Copyright © 2017 Bemaxnet. All rights reserved.
//

import UIKit

extension UIViewController {

   func controller<T: UIViewController>(type: T.Type) -> T {
      let c = controller(identifier: typeName(type))
      return c as! T
   }

   class func controller<T: UIViewController>(type: T.Type, in storyboard: String) -> T {
      let c = controller(identifier: typeName(type), in: storyboard)
      return c as! T
   }

   func controller(identifier: String) -> UIViewController {
      let controller = (self.storyboard?.instantiateViewController(withIdentifier: identifier))!

      return controller
   }

   class func controller(identifier: String, in storyboard: String) -> UIViewController {

      let storyboard = UIStoryboard(name: storyboard, bundle: Bundle.main)

      let controller = storyboard.instantiateViewController(withIdentifier: identifier)

      return controller
   }
}

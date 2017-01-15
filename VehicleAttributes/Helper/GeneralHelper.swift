//
//  GeneralHelper.swift
//  VehicleAttributes
//
//  Created by Omar Allaham on 1/14/17.
//  Copyright © 2017 Bemaxnet. All rights reserved.
//

import UIKit

func typeName(_ some: Any) -> String {
   return (some is Any.Type) ? "\(some)" : "\(type(of: (some) as AnyObject))"
}

func getRoot() -> UIViewController? {
   if let window = UIApplication.shared.keyWindow {
      return window.rootViewController
   }

   return nil
}

func complain(_ title: String?, message: String?, handler: ((UIAlertAction) -> Swift.Void)? = nil) {
   if let controller = getRoot() {

      let alert = UIAlertController(
         title: title,
         message: message,
         preferredStyle: UIAlertControllerStyle.alert)

      alert.addAction(
         UIAlertAction(
            title: localize("Ok"),
            style: UIAlertActionStyle.default,
            handler: handler))

      DispatchQueue.main.async() {
         controller.present(alert, animated: true, completion: nil)
      }
   }
}

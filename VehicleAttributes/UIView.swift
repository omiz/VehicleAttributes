//
//  UIView.swift
//  VehicleAttributes
//
//  Created by Omar Allaham on 1/15/17.
//  Copyright © 2017 Bemaxnet. All rights reserved.
//

import UIKit

extension UIView {
   class func loadFromNibNamed(_ nibNamed: String, bundle : Bundle? = nil) -> UIView? {
      return UINib(
         nibName: nibNamed,
         bundle: bundle
         ).instantiate(withOwner: nil, options: nil)[0] as? UIView
   }
}

//
//  UIStackView.swift
//  VehicleAttributes
//
//  Created by Omar Allaham on 1/14/17.
//  Copyright © 2017 Bemaxnet. All rights reserved.
//

import UIKit

extension UIStackView {

   func clear() {
      for view in arrangedSubviews {
         removeArrangedSubview(view)
         view.removeFromSuperview()
      }
   }
}

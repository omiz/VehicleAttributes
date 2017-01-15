//
//  UIPageControl.swift
//  VehicleAttributes
//
//  Created by Omar Allaham on 1/14/17.
//  Copyright © 2017 Bemaxnet. All rights reserved.
//

import UIKit

extension UIPageControl {

   func clear() {
      numberOfPages = 0
   }

   func applyTheme() {

      pageIndicatorTintColor = UIColor.extraLight
      currentPageIndicatorTintColor = UIColor.light
   }
}

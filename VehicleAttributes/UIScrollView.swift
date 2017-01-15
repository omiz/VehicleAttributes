//
//  UIScrollView.swift
//  VehicleAttributes
//
//  Created by Omar Allaham on 1/14/17.
//  Copyright © 2017 Bemaxnet. All rights reserved.
//

import UIKit

extension UIScrollView {

   func add(_ view: UIView, at index: Int) {

      view.frame.size = bounds.size

      view.frame.origin.x = bounds.width * CGFloat(index)

      addSubview(view)

      contentSize.width = frame.size.width * CGFloat(index + 1)
   }
   
   func clear() {
      for view in subviews {
         view.removeFromSuperview()
      }
   }

   func goTo(horizantally index: Int, animated: Bool = true) {
      let x = CGFloat(index) * frame.size.width
      setContentOffset(CGPoint(x: x, y: 0), animated: animated)
   }
}

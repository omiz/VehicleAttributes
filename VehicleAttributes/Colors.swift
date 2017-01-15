//
//  Colors.swift
//  VehicleAttributes
//
//  Created by Omar Allaham on 1/15/17.
//  Copyright © 2017 Bemaxnet. All rights reserved.
//

import UIKit

class Colors: NSObject {
   private var dict: NSDictionary

   class var colorKey : String {
      get {
         return UserDefaults.standard.string(forKey: "colorKey") ?? "default"
      }
      set(value) {
         UserDefaults.standard.set(value, forKey: "colorKey")
      }
   }

   override init() {
      let path = Bundle.main.path(forResource: "Colors", ofType: "plist")

      assert(path != nil, "Colors file is missing. Please provide Colors.plist")

      let temp = NSDictionary(contentsOfFile: path!)!
      dict = temp[Colors.colorKey] as! NSDictionary
   }

   class var main : Colors {
      struct Static {
         static let instance : Colors = Colors()
      }
      return Static.instance
   }

   func primary() -> UIColor {
      return UIColor(hexString: dict["primary"] as! String)
   }

   func light() -> UIColor {
      return UIColor(hexString: dict["light"] as! String)
   }

   func extraLight() -> UIColor {
      return UIColor(hexString: dict["extraLight"] as! String)
   }

   func dark() -> UIColor {
      return UIColor(hexString: dict["dark"] as! String)
   }

   func accent() -> UIColor {
      return UIColor(hexString: dict["accent"] as! String)
   }

   func background() -> UIColor {
      return UIColor(hexString: dict["background"] as! String)
   }

   func imageTint() -> UIColor {
      return UIColor(hexString: dict["imageTint"] as! String)
   }
}


extension UIColor {
   convenience init(hexString:String) {
      let hexString:String = hexString.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
      let scanner            = Scanner(string: hexString)

      if (hexString.hasPrefix("#")) {
         scanner.scanLocation = 1
      }

      var color:UInt32 = 0
      scanner.scanHexInt32(&color)

      let mask = 0x000000FF
      let r = Int(color >> 16) & mask
      let g = Int(color >> 8) & mask
      let b = Int(color) & mask

      let red   = CGFloat(r) / 255.0
      let green = CGFloat(g) / 255.0
      let blue  = CGFloat(b) / 255.0

      self.init(red:red, green:green, blue:blue, alpha:1)
   }
}

extension UIColor {
   class var primary: UIColor  {
      return Colors.main.primary()
   }

   class var light: UIColor  {
      return Colors.main.light()
   }

   class var extraLight: UIColor  {
      return Colors.main.extraLight()
   }

   class var dark: UIColor  {
      return Colors.main.dark()
   }

   class var accent: UIColor  {
      return Colors.main.accent()
   }

   class var background: UIColor  {
      return Colors.main.background()
   }
   
   class var imageTint: UIColor  {
      return Colors.main.imageTint()
   }
}

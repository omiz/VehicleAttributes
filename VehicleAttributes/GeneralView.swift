//
//  GeneralView.swift
//  VehicleAttributes
//
//  Created by Omar Allaham on 1/15/17.
//  Copyright © 2017 Bemaxnet. All rights reserved.
//

import UIKit

class GeneralView: UIView {

   @IBOutlet weak var registrationNumber: UITextField!
   @IBOutlet weak var vinNumber: UITextField!
   @IBOutlet weak var brand: UITextField!
   @IBOutlet weak var modelYear: UITextField!
   @IBOutlet weak var gearbox: UITextField!

   @IBOutlet weak var fuelTypes: UIStackView!


   class var instance: GeneralView {
      return loadFromNibNamed("GeneralView") as! GeneralView
   }

   var object: ResponseObject?

   func setup(_ object: ResponseObject) -> GeneralView {
      self.object = object

      textViewAttribute(registrationNumber, text: object.regno)
      textViewAttribute(vinNumber, text: object.vin)
      textViewAttribute(brand, text: object.brand)
      textViewAttribute(modelYear, text: object.year?.description)
      textViewAttribute(gearbox, text: object.gearbox_type)

      loadFuelTypes()

      applyTheme(self)

      return self
   }

   private func loadFuelTypes() {
      fuelTypes.clear()

      for fuel in object?.fuel_types ?? [] {
         let textField = UITextField()

         textViewAttribute(textField, text: fuel)

         fuelTypes.addArrangedSubview(textField)
      }
   }

   private func textViewAttribute(_ textField: UITextField, text: String?) {
      textField.text = text ?? localize("Not available")
      textField.borderStyle = .none
      textField.inputView = UIView()
      textField.font = registrationNumber.font
   }

   func applyTheme(_ view: UIView) {
      for view in view.subviews {
         if let label = view as? UILabel {
            label.applyTheme()
         } else if let textField = view as? UITextField {
            textField.applyTheme()
         } else {
            applyTheme(view)
         }
      }
   }

}

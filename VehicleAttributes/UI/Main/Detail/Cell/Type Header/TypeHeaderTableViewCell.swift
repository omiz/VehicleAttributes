//
//  TypeHeaderTableViewCell.swift
//  VehicleAttributes
//
//  Created by Omar Allaham on 1/15/17.
//  Copyright © 2017 Bemaxnet. All rights reserved.
//

import UIKit

class TypeHeaderTableViewCell: UITableViewCell {

   @IBOutlet weak var stackView1: UIStackView!
   @IBOutlet weak var stackView2: UIStackView!

   @IBOutlet weak var title1: UILabel!
   @IBOutlet weak var detail1: UILabel!

   @IBOutlet weak var title2: UILabel!
   @IBOutlet weak var detail2: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

      title1.applyTheme()
      title2.applyTheme()

      detail1.applyThemeLight()
      detail2.applyThemeLight()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

   func setup(_ array: [[String:String?]]) -> TypeHeaderTableViewCell {
      stackView1.isHidden = array.count < 0
      stackView2.isHidden = array.count < 1

      if array.count > 0 {
         title1.text = array[0].keys.first
         detail1.text = array[0].values.first ?? ""
      } else {
         stackView1.removeFromSuperview()
      }

      if array.count > 1 {
         title2.text = array[1].keys.first
         detail2.text = array[1].values.first ?? ""
      } else {
         stackView2.removeFromSuperview()
      }

      return self
   }
}

extension UITableView {
   func typeHeaderTableViewCell() -> TypeHeaderTableViewCell {
      return dequeueReusableCell(withIdentifier: "TypeHeaderTableViewCell", for: IndexPath()) as! TypeHeaderTableViewCell
   }
}


//
//  DetailTableViewCell.swift
//  VehicleAttributes
//
//  Created by Omar Allaham on 1/15/17.
//  Copyright © 2017 Bemaxnet. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

   @IBOutlet weak var titleLabel: UILabel!
   @IBOutlet weak var detailLabel: UILabel!

   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

      titleLabel.applyTheme()
      detailLabel.applyThemeLight()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

   func setup(_ title: String?, detail: String?) -> DetailTableViewCell {
      titleLabel.text = title
      detailLabel.text = detail

      return self
   }
    
}

extension UITableView {
   func detailTableViewCell() -> DetailTableViewCell {
      return dequeueReusableCell(withIdentifier: "DetailTableViewCell") as! DetailTableViewCell
   }
}

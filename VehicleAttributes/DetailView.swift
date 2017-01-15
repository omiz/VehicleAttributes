//
//  DetailView.swift
//  VehicleAttributes
//
//  Created by Omar Allaham on 1/14/17.
//  Copyright © 2017 Bemaxnet. All rights reserved.
//

import UIKit

enum DetailType: String {
   case fuel = "Fuel"
   case emission = "Emission"

   init(_ text: String) {
      self = DetailType(rawValue: text) ?? .fuel
   }
}

class DetailView: UIView, UITableViewDelegate, UITableViewDataSource {

   @IBOutlet weak var tableView: UITableView!

   class var instance: DetailView {
      return loadFromNibNamed("DetailView") as! DetailView
   }

   var object: ResponseObject?

   var title = ""

   func setup(_ type: DetailType, object: ResponseObject) -> DetailView {

      title = type.rawValue
      self.object = object

      tableView.tableFooterView = UIView()
      tableView.rowHeight = UITableViewAutomaticDimension
      tableView.estimatedRowHeight = 44

      tableView.sectionHeaderHeight = UITableViewAutomaticDimension
      tableView.estimatedSectionHeaderHeight = 44

      tableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailTableViewCell")
      tableView.register(UINib(nibName: "TypeHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "TypeHeaderTableViewCell")


      tableView.delegate = self
      tableView.dataSource = self

      tableView.reloadData()

      return self
   }

   func numberOfSections(in tableView: UITableView) -> Int {
      guard !title.isEmpty else {
         return 0
      }

      switch DetailType(title) {
      case .fuel:
         return object?.fuels.count ?? 0
      case .emission:
         return object?.emissions.count ?? 0
      }
   }

   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      guard !title.isEmpty else {
         return 0
      }

      switch DetailType(title) {
      case .fuel:
         return object?.fuels[section].average?.items.count ?? 0
      case .emission:
         return object?.emissions[section].average?.items.count ?? 0
      }
   }

   func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      guard !title.isEmpty else {
         return nil
      }

      var array: [[String : String?]] = []
      switch DetailType(title) {
      case .fuel:
         array.append([localize("Fuel:") : object?.fuels[section].type ?? ""])
      case .emission:
         array.append([localize("Fuel:") : object?.emissions[section].fuel ?? ""])
         array.append([localize("Emissions:") : object?.emissions[section].emission ?? ""])
      }

      return tableView.typeHeaderTableViewCell().setup(array)
   }

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

      var item: [String:Double]?

      switch DetailType(title) {
      case .fuel:
         item = object?.fuels[indexPath.section].average?.items[indexPath.row]

      case .emission:
         item = object?.emissions[indexPath.section].average?.items[indexPath.row]
      }

      let text = item?.keys.first

      let value = item?.values.first
      let detail = value != nil ? String(format:"%.6f", value!) : localize("Not available")
      return tableView.detailTableViewCell().setup(text, detail: detail)
   }

}

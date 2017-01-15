//
//  localization.swift
//  VehicleAttributes
//
//  Created by Omar Allaham on 1/14/17.
//  Copyright © 2017 Bemaxnet. All rights reserved.
//

import Foundation

func localize(_ key: String) -> String {
   return NSLocalizedString(key, comment: "")
}

func localize(_ key: String,_ arguments: CVarArg) -> String {
   return String.localizedStringWithFormat(localize(key), arguments)
}

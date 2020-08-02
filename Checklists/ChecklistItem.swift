//
//  Checklistitem.swift
//  Checklists
//
//  Created by PhanDinhNguyen on 2/24/20.
//  Copyright © 2020 PhanDinhNguyen. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, Codable {
    var text = ""
    var checked = false
    func toggleChecked() {
        checked = !checked
    }
}

//
//  ListViewMode.swift
//  CustomizeNavigationBarLargeTitleView
//
//  Created by Shameem A. Khan on 11/06/2022.
//

import Foundation
class ListViewModel {
    var items: [String]
    init() {
        items = [String]()
        for i in 0...20 {
            items.append("Item - \(i+1)")
        }
    }
}

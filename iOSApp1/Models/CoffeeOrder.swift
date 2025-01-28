//
//  CoffeeOrder.swift
//  iOSApp1
//
//  Created by Tassos Fergadiotis on 2025-01-27.
//

import Foundation

struct CoffeeOrder: Identifiable {
    let id: UUID
    var name: String
    var drinkType: String
    var size: String
    var customizations: [String]
    var notes: String
}

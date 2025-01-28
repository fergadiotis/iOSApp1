//
//  User.swift
//  iOSApp1
//
//  Created by Tassos Fergadiotis on 2025-01-27.
//

import Foundation


struct User: Identifiable {
    let id: UUID
    var name: String
    var orderHistory: [CoffeeOrder]
}

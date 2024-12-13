//
//  Event.swift
//  MasterMessageiOSDuplicate
//
//  Created by Reuben on 28/11/2024.
//

import Foundation

protocol Event: Identifiable, Codable {
    var timestamp: Date { get }
    var id: UUID { get }
}

//
//  Player.swift
//  MasterMessageiOSDuplicate
//
//  Created by Reuben on 29/11/2024.
//

import Foundation

protocol Player: Identifiable, Codable {
    var id: UUID { get }
}

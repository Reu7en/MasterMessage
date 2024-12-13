//
//  Entity.swift
//  MasterMessageiOSDuplicate
//
//  Created by Reuben on 29/11/2024.
//

import Foundation

protocol Entity: Identifiable, Codable, Hashable {
    var id: UUID { get }
}

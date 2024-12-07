//
//  EventData.swift
//  MasterMessage
//
//  Created by Reuben on 29/11/2024.
//

import Foundation

protocol EventData: Codable {
    associatedtype TypeEventType: EventType
    
    var eventType: TypeEventType { get }
}

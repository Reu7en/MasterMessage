//
//  CombinationColor.swift
//  MasterMessage
//
//  Created by Reuben on 29/11/2024.
//

import Foundation
import SwiftUI

enum CombinationColor: Codable {
    case Blue
    case Gray
    case Green
    case Orange
    case Pink
    case Purple
    case Red
    case White
    case Yellow
    case None
    
    var color: Color {
        switch self {
        case .Blue:
            .blue
        case .Gray:
            .gray
        case .Green:
            .green
        case .Orange:
            .orange
        case .Pink:
            .pink
        case .Purple:
            .purple
        case .Red:
            .red
        case .White:
            .white
        case .Yellow:
            .yellow
        case .None:
            .clear
        }
    }
}

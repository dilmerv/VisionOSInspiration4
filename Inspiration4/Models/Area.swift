//
//  Area.swift
//  Inspiration4
//
//  Created by Dilmer Valecillos on 9/16/23.
//

import Foundation

enum Area : String, Identifiable, CaseIterable, Equatable 
{
    // app areas we will use for navigation purposes
    case astronauts, equipment, mission
    var id: Self { self }
    var name: String { rawValue.capitalized }
    
    var title: String {
        switch self {
            case .astronauts:
                "Inspiration4 mission crew members..."
            case .equipment:
                "Inspiration4 mission equipment..."
            case .mission:
                "Inspiration4 mission trailer..."
        }
    }
}

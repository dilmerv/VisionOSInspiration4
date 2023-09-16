//
//  Crew.swift
//  Inspiration4
//
//  Created by Dilmer Valecillos on 9/16/23.
//

import Foundation

enum Crew : String, Identifiable, CaseIterable, Equatable 
{
    case jared, haley, chris, sian
    var id: Self { self }
    var name: String { rawValue }
    
    var fullName: String {
        switch self {
        case .jared:
            "Jared Isaacman"
        case .haley:
            "Hayley Arceneaux"
        case .chris:
            "Chris Sembroski"
        case .sian:
            "Dr. Sian Proctor"
        }
    }
    
    var about: String {
        switch self {
        case .jared:
            "Jared Isaacman is the founder and CEO of Shift4 Payments (NYSE: FOUR), the leader in integrated payment processing solutions."
        case .haley:
            "She obtained an undergraduate degree in Spanish in 2014, and obtained her Physician Assistant (PA) degree in 2016. She now works at St. Jude – the very place that saved her life – as a PA with leukemia and lymphoma patients."
        case .chris:
            "Chris Sembroski grew up with a natural curiosity about outer space. Stargazing late at night on the roof of his high school and launching high-powered model rockets in college cemented this passion."
        case .sian:
            "Dr. Sian Proctor is a geoscientist, explorer, and science communication specialist with a lifelong passion for space exploration."
        }
    }
}

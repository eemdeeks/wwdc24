//
//  File.swift
//  
//
//  Created by 박승찬 on 2/13/24.
//

import Foundation

enum Yut: String, CaseIterable {
    case Do = "Do"
    case Gae = "Gae"
    case Geol = "Geol"
    case Yut = "Yut"
    case Mo = "Mo"

    var number: Int {
        switch self {
        case .Do:
            1
        case .Gae:
            2
        case .Geol:
            3
        case .Yut:
            4
        case .Mo:
            5
        }
    }
}

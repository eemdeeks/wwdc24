//
//  File.swift
//  
//
//  Created by 박승찬 on 2/13/24.
//

import Foundation

enum Yut: String, CaseIterable {
    case Do, Do1, Do2, Do3
    case Gae, Gae1, Gae2, Gae3, Gae4, Gae5
    case Geol, Geol1, Geol2, Geol3
    case Yut
    case Mo

    var number: Int {
        switch self {
        case .Do, .Do1, .Do2, .Do3:
            1
        case .Gae, .Gae1, .Gae2, .Gae3, .Gae4, .Gae5:
            2
        case .Geol, .Geol1, .Geol2, .Geol3:
            3
        case .Yut:
            4
        case .Mo:
            5
        }
    }

    var name: String {
        switch self {
        case .Do, .Do1, .Do2, .Do3:
            "Do"
        case .Gae, .Gae1, .Gae2, .Gae3, .Gae4, .Gae5:
            "Gae"
        case .Geol, .Geol1, .Geol2, .Geol3:
            "Geol"
        case .Yut:
            "Yut"
        case .Mo:
            "Mo"
        }
    }
}

//
//  File.swift
//  
//
//  Created by 박승찬 on 2/15/24.
//

import Foundation

struct Game {
    var turn: Team
    var yut: Yut
    var redPieces: [Piece]
    var bluePieces: [Piece]
}

enum Team {
    case Red
    case Blue

    func switchingTeam() -> Team {
        switch self {
        case .Red:
            return .Blue
        case .Blue:
            return .Red
        }
    }
}

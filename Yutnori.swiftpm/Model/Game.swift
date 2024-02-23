//
//  File.swift
//  
//
//  Created by 박승찬 on 2/15/24.
//

import Foundation

struct Game {
    var action: Action
    var turn: Team
    var yut: Yut
    var redPieces: [Piece]
    var bluePieces: [Piece]
    var winner: Team?
    var isFinish: Bool
}

enum Team: String {
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

enum Action: String {
    case Prepared
    case Throwing
    case Selecting
    case Moving
    case End
}

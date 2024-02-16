//
//  PlayViewModel.swift
//
//
//  Created by 박승찬 on 2/13/24.
//

import Foundation

class PlayViewModel: ObservableObject{
    var nodes: Nodes
    @Published var game: Game

    init(nodes: Nodes = Nodes()){
        self.nodes = nodes
        self.game = Game(turn: .Blue,
                         yut: .Mo,
                         redPieces: Array(repeating: Piece(node: nodes.block1), count: 4),
                         bluePieces: Array(repeating: Piece(node: nodes.block1), count: 4))
    }

    func throwYut() {
        self.game.yut = Yut.allCases.randomElement()!
        var runCount = game.yut.number
    }

    func choosePiece(index: Int) {
        var runCount = game.yut.number

        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            runCount -= 1

            switch self.game.turn {
            case .Red:
                self.game.redPieces[index].node = self.game.redPieces[index].node.next ?? Node(data: Offset(width: 0, height: 0))
            case .Blue:
                self.game.bluePieces[index].node = self.game.bluePieces[index].node.next ?? Node(data: Offset(width: 0, height: 0))
            }
            if runCount == 0 {
                timer.invalidate()
                self.game.turn = self.game.turn.switchingTeam()
            }
        }
    }
}

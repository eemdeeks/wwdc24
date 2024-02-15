//
//  PlayViewModel.swift
//
//
//  Created by 박승찬 on 2/13/24.
//

import Foundation

class PlayViewModel: ObservableObject{
    var nodes: Nodes
    @Published var redPieces: [Piece]
    @Published var bluePieces: [Piece]
    @Published var yut: Yut
    @Published var game: Game

    init(nodes: Nodes = Nodes(), game: Game = Game(turn: .Blue, yut: .Mo)) {
        self.nodes = nodes
        self.game = game
        self.redPieces = [Piece(node: nodes.block1),Piece(node: nodes.block1),Piece(node: nodes.block1),Piece(node: nodes.block1)]
        self.bluePieces = [Piece(node: nodes.block1),Piece(node: nodes.block1),Piece(node: nodes.block1),Piece(node: nodes.block1)]
        self.yut = .Mo
    }

    func clickedButton() {
        self.yut = Yut.allCases.randomElement()!
        var runCount = yut.number

        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            runCount -= 1

            if runCount == 0 {
                timer.invalidate()
            }
            switch self.game.turn {
            case .Red:
                self.redPieces[0].node = self.redPieces[0].node.next ?? Node(data: Offset(width: 0, height: 0))
            case .Blue:
                self.bluePieces[0].node = self.bluePieces[0].node.next ?? Node(data: Offset(width: 0, height: 0))
            }
        }

        self.game.turn = self.game.turn.switchingTeam()
        print(redPieces[0].node.data.height)
        print(yut)
        
    }
}

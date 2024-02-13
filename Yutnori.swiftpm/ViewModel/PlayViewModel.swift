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

    init(nodes: Nodes = Nodes()) {
        self.nodes = nodes
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

            self.redPieces[0].node = self.redPieces[0].node.next ?? Node(data: Offset(width: 0, height: 0))
        }


        print(redPieces[0].node.data.height)
        print(yut)
    }
}

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

    init(nodes: Nodes = Nodes()) {
        self.nodes = nodes
        self.redPieces = [Piece(node: nodes.block1),Piece(node: nodes.block1),Piece(node: nodes.block1),Piece(node: nodes.block1)]
        self.bluePieces = [Piece(node: nodes.block1),Piece(node: nodes.block1),Piece(node: nodes.block1),Piece(node: nodes.block1)]
    }

    func clickedButton() {
        redPieces[0].node = redPieces[0].node.next ?? Node(data: Offset(width: 0, height: 0))

        print(redPieces[0].node.data.height)
    }
}

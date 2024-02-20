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
        self.game = Game(action: .Prepared,
                         turn: .Blue,
                         yut: .Mo,
                         redPieces: Array(repeating: Piece(node: nodes.start, group: []), count: 4),
                         bluePieces: Array(repeating: Piece(node: nodes.start, group: []), count: 4))
    }

    func throwYut() {
        guard self.game.action == .Prepared else { return }
        self.game.yut = Yut.allCases.randomElement()!
        self.game.action = .Selecting
    }

    func choosePiece(movePieceIndex: Int) {
        guard game.action == .Selecting else { return }
        game.action = .Moving

        var runCount = game.yut.number
        var changeTurnFlag: Bool = true

        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            runCount -= 1

            switch self.game.turn {
            case .Red:
                self.game.redPieces[movePieceIndex].node = self.game.redPieces[movePieceIndex].node.next ?? Node(data: Offset(width: 0, height: 0))
                for groupIndex in self.game.redPieces[movePieceIndex].group {
                    if groupIndex == movePieceIndex { continue }
                    self.game.redPieces[groupIndex].node = self.game.redPieces[groupIndex].node.next ?? Node(data: Offset(width: 0, height: 0))
                }
            case .Blue:
                self.game.bluePieces[movePieceIndex].node = self.game.bluePieces[movePieceIndex].node.next ?? Node(data: Offset(width: 0, height: 0))
                for groupIndex in self.game.bluePieces[movePieceIndex].group {
                    if groupIndex == movePieceIndex { continue }
                    self.game.bluePieces[groupIndex].node = self.game.bluePieces[groupIndex].node.next ?? Node(data: Offset(width: 0, height: 0))
                }
            }

            if runCount == 0 {
                timer.invalidate()
                switch self.game.turn {
                case .Red:
                    for index in self.game.bluePieces.indices {
                        //잡기
                        if self.game.bluePieces[index].node.data == self.game.redPieces[movePieceIndex].node.data {
                            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                                self.game.bluePieces[index].node = self.nodes.start
                            }
                            self.game.bluePieces[index].group = []
                            changeTurnFlag = false
                        }

                        //쌓기
                        if self.game.redPieces[index].node.data == self.game.redPieces[movePieceIndex].node.data {
                            self.game.redPieces[movePieceIndex].group.insert(index)
                            self.game.redPieces[index].group.insert(movePieceIndex)
                            self.game.redPieces[index].group = self.game.redPieces[index].group.union(self.game.redPieces[movePieceIndex].group)
                        }
                    }
                case .Blue:
                    for index in self.game.redPieces.indices {
                        //잡기
                        if self.game.redPieces[index].node.data == self.game.bluePieces[movePieceIndex].node.data {
                            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                                self.game.redPieces[index].node = self.nodes.start
                            }
                            self.game.redPieces[index].group = []
                            changeTurnFlag = false
                        }

                        //쌓기
                        if self.game.bluePieces[index].node.data == self.game.bluePieces[movePieceIndex].node.data {
                            self.game.bluePieces[movePieceIndex].group.insert(index)
                            self.game.bluePieces[index].group.insert(movePieceIndex)
                            self.game.bluePieces[index].group = self.game.bluePieces[index].group.union(self.game.bluePieces[movePieceIndex].group)
                        }
                    }
                }
                
                if self.game.yut == .Mo || self.game.yut == .Yut {
                    changeTurnFlag = false
                }

                if changeTurnFlag {
                    self.game.turn = self.game.turn.switchingTeam()
                }
                
                self.game.action = .Prepared
            }
        }
    }
}

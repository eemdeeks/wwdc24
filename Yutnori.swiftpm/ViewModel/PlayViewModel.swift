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
    @Published var howToPlay: Bool

    init(nodes: Nodes = Nodes(), howToPlay: Bool = true){
        self.nodes = nodes
        self.game = Game(action: .Prepared,
                         turn: .Blue,
                         yut: .Mo,
                         redPieces: [],
                         bluePieces: [],
                         isFinish: false)
        self.howToPlay = howToPlay
        initPieces()
    }

    func pressHowToPlay() {
        howToPlay = true
    }

    func initPieces() {
        for index in 0..<4 {
            self.game.redPieces.append(Piece(node: nodes.redStart[index], group: [], isFinish: false))
            self.game.bluePieces.append(Piece(node: nodes.blueStart[index], group: [], isFinish: false))
        }
    }

    func throwYut() {
        guard self.game.action == .Prepared else { return }
        self.game.yut = Yut.allCases.randomElement()!
        self.game.action = .Selecting
    }

    func choosePiece(movePieceIndex: Int) {
        guard game.action == .Selecting else { return }
        switch self.game.turn {
        case .Red:
            guard !game.redPieces[movePieceIndex].isFinish else { return }
        case .Blue:
            guard !game.bluePieces[movePieceIndex].isFinish else { return }
        }
        game.action = .Moving

        var runCount = game.yut.number
        var changeTurnFlag: Bool = true

        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            runCount -= 1

            switch self.game.turn {
            case .Red:
                if let node = self.game.redPieces[movePieceIndex].node.next {
                    if runCount == self.game.yut.number-1 {
                        if let directNode = self.game.redPieces[movePieceIndex].node.directNext {
                            self.game.redPieces[movePieceIndex].node = directNode
                        } else {
                            self.game.redPieces[movePieceIndex].node = node
                        }
                    } else {
                        self.game.redPieces[movePieceIndex].node = node
                    }
                } else {
                    self.game.redPieces[movePieceIndex].node = self.nodes.redFinish[movePieceIndex]
                    self.game.redPieces[movePieceIndex].isFinish = true
                }
                for groupIndex in self.game.redPieces[movePieceIndex].group {
                    if groupIndex == movePieceIndex { continue }
                    if let node = self.game.redPieces[groupIndex].node.next {
                        if runCount == self.game.yut.number-1 {
                            if let directNode = self.game.redPieces[groupIndex].node.directNext {
                                self.game.redPieces[groupIndex].node = directNode
                            } else {
                                self.game.redPieces[groupIndex].node = node
                            }
                        } else {
                            self.game.redPieces[groupIndex].node = node
                        }
                    } else {
                        self.game.redPieces[groupIndex].node = self.nodes.redFinish[groupIndex]
                        self.game.redPieces[groupIndex].isFinish = true
                    }
                }
            case .Blue:
                if let node = self.game.bluePieces[movePieceIndex].node.next {
                    if runCount == self.game.yut.number-1 {
                        if let directNode = self.game.bluePieces[movePieceIndex].node.directNext {
                            self.game.bluePieces[movePieceIndex].node = directNode
                        } else {
                            self.game.bluePieces[movePieceIndex].node = node
                        }
                    } else {
                        self.game.bluePieces[movePieceIndex].node = node
                    }
                } else {
                    self.game.bluePieces[movePieceIndex].node = self.nodes.blueFinish[movePieceIndex]
                    self.game.bluePieces[movePieceIndex].isFinish = true
                }
                for groupIndex in self.game.bluePieces[movePieceIndex].group {
                    if groupIndex == movePieceIndex { continue }
                    if let node = self.game.bluePieces[groupIndex].node.next {
                        if runCount == self.game.yut.number-1 {
                            if let directNode = self.game.bluePieces[groupIndex].node.directNext {
                                self.game.bluePieces[groupIndex].node = directNode
                            } else {
                                self.game.bluePieces[groupIndex].node = node
                            }
                        } else {
                            self.game.bluePieces[groupIndex].node = node
                        }
                    } else {
                        self.game.bluePieces[groupIndex].node = self.nodes.blueFinish[groupIndex]
                        self.game.bluePieces[groupIndex].isFinish = true
                    }
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
                                self.game.bluePieces[index].node = self.nodes.blueStart[index]
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
                                self.game.redPieces[index].node = self.nodes.redStart[index]
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
                
                var countFinish: Int = 0
                switch self.game.turn {
                case .Red:
                    for piece in self.game.redPieces where piece.isFinish {
                        countFinish += 1
                    }
                    if countFinish == 4 {
                        self.game.winner = .Red
                        self.game.isFinish = true
                    }
                case .Blue:
                    for piece in self.game.redPieces where piece.isFinish {
                        countFinish += 1
                    }
                    if countFinish == 4 {
                        self.game.winner = .Blue
                        self.game.isFinish = true
                    }
                }

                if self.game.isFinish {
                    self.game.action = .End
                } else {
                    self.game.action = .Prepared
                }

                if self.game.yut == .Mo || self.game.yut == .Yut {
                    changeTurnFlag = false
                }

                if changeTurnFlag {
                    self.game.turn = self.game.turn.switchingTeam()
                }
            }
        }
    }

    func resetGame() {
        self.game = Game(action: .Prepared,
                         turn: self.game.turn,
                         yut: .Mo,
                         redPieces: [],
                         bluePieces: [],
                         isFinish: false)
        initPieces()
    }
}

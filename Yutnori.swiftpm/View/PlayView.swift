//
//  PlayView.swift
//
//
//  Created by 박승찬 on 2/13/24.
//

import SwiftUI

struct PlayView: View {
    @StateObject var viewModel = PlayViewModel()
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .frame(width: UIScreen.main.bounds.width)
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
//                Text("\(viewModel.game.action.rawValue)")
//                    .font(.custom(.dovemayo, size: 10))
//                Text("\(viewModel.game.yut.rawValue)")
//                    .font(.custom(.dovemayo, size: 10))
//                Text("\(viewModel.game.turn.rawValue)")
//                    .font(.custom(.dovemayo, size: 10))
                HStack {
                    Spacer()
                    Button {
                        viewModel.resetGame()
                    } label: {
                        Image(systemName: "arrow.counterclockwise.square")
                            .foregroundStyle(.black)
                            .font(.custom(.dovemayo, size: 46))
                    }

                    Button {
                        viewModel.pressHowToPlay()
                    } label: {
                        Image(systemName: "questionmark.square")
                            .foregroundStyle(.black)
                            .font(.custom(.dovemayo, size: 46))
                    }
                }
                .padding(.horizontal)
                .ignoresSafeArea()
                Image("board")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width * 0.9,
                           height: UIScreen.main.bounds.width * 0.9)
                HStack {
                    VStack {
                        Text("Blue Team")
                            .font(.custom(.dovemayo, size: 30))
                            .foregroundStyle(viewModel.game.turn == .Blue && viewModel.game.action == .Selecting ? .blue: .black)
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(lineWidth: 4)
                            .frame(width: UIScreen.main.bounds.width * 0.2,
                                   height: UIScreen.main.bounds.width * 0.2)
                            .foregroundStyle(viewModel.game.turn == .Blue && viewModel.game.action == .Selecting ? .blue: .black)
                    }
                    .padding()
                    
                    Button {
                        viewModel.throwYut()
                    } label: {
                        VStack {
                            Text("Throw Yut")
                                .font(.custom(.dovemayo, size: 30))
                                .foregroundStyle(viewModel.game.turn == .Red ? .red: .blue)
                            ZStack {
                                Image("\(viewModel.game.yut.name)")
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width * 0.2,
                                           height: UIScreen.main.bounds.width * 0.2)
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(lineWidth: 4)
                                    .frame(width: UIScreen.main.bounds.width * 0.2,
                                           height: UIScreen.main.bounds.width * 0.2)
                                    .foregroundStyle(viewModel.game.turn == .Red ? .red: .blue)
                            }
                        }
                    }
                    .padding(.horizontal, 22)

                    VStack {
                        Text("Red Team")
                            .font(.custom(.dovemayo, size: 30))
                            .foregroundStyle(viewModel.game.turn == .Red && viewModel.game.action == .Selecting ? .red: .black)
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(lineWidth: 4)
                            .frame(width: UIScreen.main.bounds.width * 0.2,
                                   height: UIScreen.main.bounds.width * 0.2)
                            .foregroundStyle(viewModel.game.turn == .Red && viewModel.game.action == .Selecting ? .red: .black)
                    }
                    .padding()
                }
            }

            ForEach(viewModel.game.redPieces.indices, id: \.self) { index in
                Image(viewModel.game.redPieces[index].isFinish ? "FinishRedPiece": "RedPiece")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width / 15,
                           height: UIScreen.main.bounds.width / 15)
                    .offset(CGSize(width: viewModel.game.redPieces[index].offset.width, height: viewModel.game.redPieces[index].offset.height))
                    .animation(.easeInOut, value: viewModel.game.redPieces[index].offset)
                    .onTapGesture {
                        if viewModel.game.turn == .Red {
                            viewModel.choosePiece(movePieceIndex: index)
                        }
                    }

            }

            ForEach(viewModel.game.bluePieces.indices, id: \.self) { index in
                Image(viewModel.game.bluePieces[index].isFinish ? "FinishBluePiece": "BluePiece")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width / 15,
                           height: UIScreen.main.bounds.width / 15)
                    .offset(CGSize(width: viewModel.game.bluePieces[index].offset.width, height: viewModel.game.bluePieces[index].offset.height))
                    .animation(.easeInOut, value: viewModel.game.bluePieces[index].offset)
                    .onTapGesture {
                        if viewModel.game.turn == .Blue {
                            viewModel.choosePiece(movePieceIndex: index)
                        }
                    }
            }
        }
        .alert(
            "Winner is \(self.viewModel.game.winner?.rawValue ?? "unknown") Team!!",
            isPresented: $viewModel.game.isFinish
        ) {
            Button("OK") { }
            Button("Retry") {
                viewModel.resetGame()
            }
        }
        .alert("How to Play",
               isPresented: $viewModel.howToPlay) {
            Button("OK") { }
        } message: {
            Text("1. Click the Throw yut button to throw yut. \n2. Select the piece you want to move and touch it. \n That's it!")
        }
    }
}

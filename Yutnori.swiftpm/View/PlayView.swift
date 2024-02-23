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
                Text("\(viewModel.game.action.rawValue)")
                    .font(.custom(.dovemayo, size: 10))
                Text("\(viewModel.game.yut.rawValue)")
                    .font(.custom(.dovemayo, size: 10))
                Text("\(viewModel.game.turn.rawValue)")
                    .font(.custom(.dovemayo, size: 10))
                Image("board")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width * 0.9,
                           height: UIScreen.main.bounds.width * 0.9)
                HStack {
                    VStack {
                        Text("Blue Team")
                            .font(.custom(.dovemayo, size: 30))
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(lineWidth: 4)
                            .frame(width: UIScreen.main.bounds.width * 0.4,
                                   height: UIScreen.main.bounds.width / 13)
                    }
                    .padding()

                    VStack {
                        Text("Red Team")
                            .font(.custom(.dovemayo, size: 30))
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(lineWidth: 4)
                            .frame(width: UIScreen.main.bounds.width * 0.4,
                                   height: UIScreen.main.bounds.width / 13)
                    }
                    .padding()
                }

                Button {
                    viewModel.throwYut()
                } label: {
                    ZStack {
                        Text("Throw Yut")
                            .font(.custom(.dovemayo, size: 60))
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 4)
                            .frame(width: UIScreen.main.bounds.width * 0.85,
                                   height: UIScreen.main.bounds.width / 13)
                    }
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
            Button("OK") {
            }
            Button("Retry") {
                viewModel.resetGame()
            }
        }
    }
}

#Preview {
    PlayView()
}

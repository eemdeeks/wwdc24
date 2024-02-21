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
            HStack {
                Image("field")
                    .resizable()
                    .frame(height: UIScreen.main.bounds.height)
                    .scaledToFit()
                Spacer()
            }
            VStack {
                Text("\(viewModel.game.action.rawValue)")
                    .font(.custom(.dovemayo, size: 10))
                Text("\(viewModel.game.yut.rawValue)")
                    .font(.custom(.dovemayo, size: 10))
                Text("\(viewModel.game.turn.rawValue)")
                    .font(.custom(.dovemayo, size: 10))
                ZStack {
                    ForEach(viewModel.game.redPieces.indices, id: \.self) { index in
                        Image("RedPiece")
                            .offset(CGSize(width: viewModel.game.redPieces[index].offset.width, height: viewModel.game.redPieces[index].offset.height))
                            .animation(.easeInOut, value: viewModel.game.redPieces[index].offset)
                            .onTapGesture {
                                if viewModel.game.turn == .Red {
                                    viewModel.choosePiece(movePieceIndex: index)
                                }
                            }

                    }
                }
                .padding()
                ZStack {
                    ForEach(viewModel.game.bluePieces.indices, id: \.self) { index in
                        Image("BluePiece")
                            .offset(CGSize(width: viewModel.game.bluePieces[index].offset.width, height: viewModel.game.bluePieces[index].offset.height))
                            .animation(.easeInOut, value: viewModel.game.bluePieces[index].offset)
                            .onTapGesture {
                                if viewModel.game.turn == .Blue {
                                    viewModel.choosePiece(movePieceIndex: index)
                                }
                            }
                    }
                }
                Button("윷 굴리기") {
                    viewModel.throwYut()
                }

            }
        }
    }
}

#Preview {
    PlayView()
}

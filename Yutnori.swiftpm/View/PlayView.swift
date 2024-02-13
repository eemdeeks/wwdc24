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
        VStack {
            ZStack {
                ForEach(viewModel.redPieces) { redPiece in
                    Image("RedPiece")
                        .offset(CGSize(width: redPiece.offset.width, height: redPiece.offset.height))
                        .animation(.easeInOut, value: redPiece.offset)

                }
            }
            ZStack {
                ForEach(viewModel.bluePieces) { bluePiece in
                    Image("BluePiece")
                        .offset(CGSize(width: bluePiece.offset.width, height: bluePiece.offset.height))
                        .animation(.easeInOut, value: bluePiece.offset)

                }
            }
            Button("윷 굴리기") {
                viewModel.clickedButton()
            }

        }
    }
}

#Preview {
    PlayView()
}

//
//  DescriptionView.swift
//
//
//  Created by 박승찬 on 2/25/24.
//

import Foundation
import SwiftUI

struct DescriptionView: View {
    var body: some View {
        ScrollView(.vertical) {
            header
            headerDescription
            Divider()
            ruleOfYutnori
            yutDescription
            boardDescription
            pieceDescription
            finalDescription
        }
    }
}

extension DescriptionView {
    private var header: some View {
        Text("Yutnori")
            .font(.custom(.dovemayo, size: 60))
            .padding()
    }

    private var headerDescription: some View {
        VStack {
            Text("Yutnori is one of the most popular traditional Korean board games.")
                .font(.custom(.dovemayo, size: 25))
            Text("In Korea, the whole family gathers for every holiday. \nEspecially during the Lunar New Year, everyone gathers to play Yutnori. ")
                .font(.custom(.dovemayo, size: 25))
            Text("Playing Yutnori with the whole family is a great way to feel and enjoy the Korean holiday culture.")
                .font(.custom(.dovemayo, size: 25))
        }.padding(10)
    }

    private var ruleOfYutnori: some View {
        VStack {
            Text("How to Play")
                .font(.custom(.dovemayo, size: 35))
            Text("Yutnori is played with four wooden sticks called Yut, which act as dice.")
               .font(.custom(.dovemayo, size: 25))
            Text("Two teams take it in turns to throw the Yut, and move their four pieces on the board according to the result.")
                .font(.custom(.dovemayo, size: 25))
            Text("The first team that sends all four pieces through the finish line is the victor.")
                .font(.custom(.dovemayo, size: 25))
        }
    }

    private var yutDescription: some View {
        VStack {
            Text("Yut")
                .font(.custom(.dovemayo, size: 30))
            Text("There are do, gae, geol, yut, mo. They represent five different friendly animals and determine how many spaces a piece can move.")
                .font(.custom(.dovemayo, size: 25))
            Text("I'll show it in a table below.")
                .font(.custom(.dovemayo, size: 25))
            //image
        }
    }

    private var boardDescription: some View {
        VStack {
            Text("Board")
                .font(.custom(.dovemayo, size: 30))
            //board image
            Text("This is the Yutnori board.")
                .font(.custom(.dovemayo, size: 25))
            Text("Start at the bottom right and run counterclockwise around the block to enter the finish line.")
                .font(.custom(.dovemayo, size: 25))
            Text("If you stop at the top left,top right vertices and the center, you can take a shortcut next time.")
                .font(.custom(.dovemayo, size: 25))
        }
    }

    private var pieceDescription: some View {
        VStack {
            //pieces image
            Text("Piece")
                .font(.custom(.dovemayo, size: 30))
            Text("There are four Pieces in total, and all must come in at the finish line.")
                .font(.custom(.dovemayo, size: 25))
            Text("If your piece arrives at your opponent's position, you can capture his piece,")
                .font(.custom(.dovemayo, size: 25))
            Text("You can move multiple pieces simultaneously if another piece arrives at your position.")
                .font(.custom(.dovemayo, size: 25))
        }
    }

    private var finalDescription: some View {
        VStack {
            Text("These rules make it impossible to predict the end result. So, you have to stay on your toes until the very end.")
                .font(.custom(.dovemayo, size: 30))
            Button {

            } label: {
                Text("Let's Go Play Yutnori!!")
                    .font(.custom(.dovemayo, size: 50))
            }
        }
    }
}

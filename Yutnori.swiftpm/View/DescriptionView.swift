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
                .padding(5)
            Text("In Korea, the whole family gathers for every holiday.")
                .font(.custom(.dovemayo, size: 25))
                .padding(5)
            Text("Especially during the Lunar New Year, everyone gathers to play Yutnori.")
                .font(.custom(.dovemayo, size: 25))
                .padding(5)
            Text("Playing Yutnori with the whole family is a great way")
                .font(.custom(.dovemayo, size: 25))
            Text("to feel and enjoy the Korean holiday culture.")
                .font(.custom(.dovemayo, size: 25))
            Divider()
        }.padding(10)
    }

    private var ruleOfYutnori: some View {
        VStack {
            Text("How to Play")
                .font(.custom(.dovemayo, size: 35))
            Text("Yutnori is played with four wooden sticks called Yut, which act as dice.")
               .font(.custom(.dovemayo, size: 25))
               .padding(.bottom ,5)
            Text("Two teams take it in turns to throw the Yut,")
                .font(.custom(.dovemayo, size: 25))
            Text(" and move their four pieces on the board according to the result.")
                .font(.custom(.dovemayo, size: 25))
                .padding(.bottom, 5)
            Text("The first team that sends all four pieces")
                .font(.custom(.dovemayo, size: 25))
            Text(" through the finish line is the victor.")
                .font(.custom(.dovemayo, size: 25))
        }.padding()
    }

    private var yutDescription: some View {
        VStack {
            ZStack {
                Text("Yut")
                    .font(.custom(.dovemayo, size: 30))
                HStack{
                    Spacer()
                    Text("Scroll up!!")
                        .font(.custom(.dovemayo, size: 18))
                        .padding()
                }
            }
            Image("Mo")
                .resizable()
                .frame(width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.width / 4)
            Text("There are do, gae, geol, yut, mo.")
                .font(.custom(.dovemayo, size: 25))
            Text("They represent five different friendly animals and")
                .font(.custom(.dovemayo, size: 25))
            Text("determine how many spaces a piece can move.")
                .font(.custom(.dovemayo, size: 25))
                .padding(.bottom, 5)
            Text("I'll show it in a table below.")
                .font(.custom(.dovemayo, size: 25))
            Image("DiscriptYut")
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.width * 0.32)

        }.padding()
    }

    private var boardDescription: some View {
        VStack {
            Text("Board")
                .font(.custom(.dovemayo, size: 30))
            Image("board")
                .resizable()
                .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 2)
            Text("This is the Yutnori board.")
                .font(.custom(.dovemayo, size: 25))
            Text("Start at the bottom right and run counterclockwise around the block")
                .font(.custom(.dovemayo, size: 25))
            Text(" to enter the finish line.")
                .font(.custom(.dovemayo, size: 25))
                .padding(.bottom, 5)
            Text("If you stop at the top left, top right vertices and the center,")
                .font(.custom(.dovemayo, size: 25))
            Text(" you can take a shortcut next time.")
                .font(.custom(.dovemayo, size: 25))
        }.padding()
    }

    private var pieceDescription: some View {
        VStack {
            Text("Piece")
                .font(.custom(.dovemayo, size: 30))
            Image("Pieces")
            Text("There are four Pieces in total, and all must come in at the finish line.")
                .font(.custom(.dovemayo, size: 25))
                .padding(.bottom, 5)
            Text("If your piece arrives at your opponent's position,")
                .font(.custom(.dovemayo, size: 25))
            Text(" you can capture his piece.")
                .font(.custom(.dovemayo, size: 25))
                .padding(.bottom, 5)
            Text("You can move multiple pieces simultaneously ")
                .font(.custom(.dovemayo, size: 25))
            Text("if another piece arrives at your position.")
                .font(.custom(.dovemayo, size: 25))
            Divider()
        }.padding()
    }

    private var finalDescription: some View {
        VStack {
            Text("These rules make it impossible to predict the end result.")
                .font(.custom(.dovemayo, size: 30))
            Text("So, you have to stay on your toes until the very end.")
                .font(.custom(.dovemayo, size: 30))
            Button {

            } label: {
                VStack {
                    Text("Let's Go Play Yutnori!!")
                        .font(.custom(.dovemayo, size: 50))
                    Text("Please press to play yutnori")
                        .font(.custom(.dovemayo, size: 30))
                }
            }
        }.padding()
    }
}

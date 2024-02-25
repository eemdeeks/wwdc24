//
//  PagingView.swift
//
//
//  Created by 박승찬 on 2/26/24.
//

import SwiftUI

struct PagingView: View {
    @State var presentPage: Page = .Descript
    var body: some View {
        switch presentPage {
        case .Descript:
            DescriptionView(presentPage: $presentPage)
        case .Play:
            PlayView()
        }
    }
}

enum Page: String {
    case Descript
    case Play
}

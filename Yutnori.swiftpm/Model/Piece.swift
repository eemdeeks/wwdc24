//
//  File.swift
//  
//
//  Created by 박승찬 on 2/13/24.
//

import Foundation

struct Piece: Identifiable {
    var id = UUID()
    var node: Node<Offset>
    var offset: Offset {
        node.data
    }
}

class Offset: Equatable {
    static func == (lhs: Offset, rhs: Offset) -> Bool {
        lhs.width == rhs.width && lhs.height == rhs.height
    }

    var width: Double
    var height: Double
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
}

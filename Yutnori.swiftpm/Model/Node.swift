//
//  Node.swift
//
//
//  Created by 박승찬 on 2/13/24.
//

import Foundation

class Node<T>{
    var data: T
    var next: Node?

    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

struct Nodes {
    let block1: Node<Offset>
    let block2: Node<Offset>
    let block3: Node<Offset>
    let end: Node<Offset>
    init() {
        self.block1 = Node(data: Offset(width: 0, height: 0))
        self.block2 = Node(data: Offset(width: 0, height: 50))
        self.block3 = Node(data: Offset(width: 0, height: 100))
        self.end = Node(data: Offset(width: 0, height: 150))

        block1.next = block2
        block2.next = block3
        block3.next = end
        end.next = block1
    }
}

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
    let start: Node<Offset>
    let block1: Node<Offset>
    let block2: Node<Offset>
    let block3: Node<Offset>
    let block4: Node<Offset>
    let block5: Node<Offset>
    let block6: Node<Offset>
    let block7: Node<Offset>
    let block8: Node<Offset>
    let block9: Node<Offset>
    let block10: Node<Offset>
    let block11: Node<Offset>
    let block12: Node<Offset>
    let block13: Node<Offset>
    let block14: Node<Offset>
    let block15: Node<Offset>
    let block16: Node<Offset>
    let block17: Node<Offset>
    let block18: Node<Offset>
    let block19: Node<Offset>
    let end: Node<Offset>
    init() {
        self.start = Node(data: Offset(width: 0, height: 0))
        self.block1 = Node(data: Offset(width: 50, height: 0))
        self.block2 = Node(data: Offset(width: 100, height: 0))
        self.block3 = Node(data: Offset(width: 150, height: 0))
        self.block4 = Node(data: Offset(width: 200, height: 0))
        self.block5 = Node(data: Offset(width: 250, height: 0))
        self.block6 = Node(data: Offset(width: 300, height: 0))
        self.block7 = Node(data: Offset(width: 350, height: 0))
        self.block8 = Node(data: Offset(width: 400, height: 0))
        self.block9 = Node(data: Offset(width: 400, height: 50))
        self.block10 = Node(data: Offset(width: 350, height: 50))
        self.block11 = Node(data: Offset(width: 300, height: 50))
        self.block12 = Node(data: Offset(width: 250, height: 50))
        self.block13 = Node(data: Offset(width: 200, height: 50))
        self.block14 = Node(data: Offset(width: 150, height: 50))
        self.block15 = Node(data: Offset(width: 100, height: 50))
        self.block16 = Node(data: Offset(width: 50, height: 50))
        self.block17 = Node(data: Offset(width: 0, height: 50))
        self.block18 = Node(data: Offset(width: 0, height: 100))
        self.block19 = Node(data: Offset(width: 0, height: 150))
        self.end = Node(data: Offset(width: -200, height: -200))

        start.next = block1
        block1.next = block2
        block2.next = block3
        block3.next = block4
        block4.next = block5
        block5.next = block6
        block6.next = block7
        block7.next = block8
        block8.next = block9
        block9.next = block10
        block10.next = block11
        block11.next = block12
        block12.next = block13
        block13.next = block14
        block14.next = block15
        block15.next = block16
        block16.next = block17
        block17.next = block18
        block18.next = block19
        block19.next = end
        end.next = start


    }
}

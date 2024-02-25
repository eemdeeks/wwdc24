//
//  Node.swift
//  Node for LinkedList
//
//  Created by 박승찬 on 2/13/24.
//

import Foundation

class Node<T>{
    var data: T
    var next: Node?
    var directNext: Node?

    init(data: T, next: Node? = nil, directNext: Node? = nil) {
        self.data = data
        self.next = next
        self.directNext = directNext
    }
}

struct Nodes {
    var redStart: [Node<Offset>]
    var blueStart: [Node<Offset>]

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

    let directBlock1: Node<Offset>
    let directBlock2: Node<Offset>
    let directBlock3: Node<Offset>
    let directBlock4: Node<Offset>
    let directBlock5: Node<Offset>

    let directBlock6: Node<Offset>
    let directBlock7: Node<Offset>
    let directBlock8: Node<Offset>
    let directBlock9: Node<Offset>
    let directBlock10: Node<Offset>

    var redFinish: [Node<Offset>]
    var blueFinish: [Node<Offset>]

    init() {
        self.block1 = Node(data: Offset(width: 280, height: 50))
        self.block2 = Node(data: Offset(width: 280, height: -55))
        self.block3 = Node(data: Offset(width: 280, height: -160))
        self.block4 = Node(data: Offset(width: 280, height: -265))
        self.block5 = Node(data: Offset(width: 280, height: -390))

        self.block6 = Node(data: Offset(width: 160, height: -390))
        self.block7 = Node(data: Offset(width: 55, height: -390))
        self.block8 = Node(data: Offset(width: -50, height: -390))
        self.block9 = Node(data: Offset(width: -155, height: -390))
        self.block10 = Node(data: Offset(width: -280, height: -390))

        self.block11 = Node(data: Offset(width: -280, height: -265))
        self.block12 = Node(data: Offset(width: -280, height: -160))
        self.block13 = Node(data: Offset(width: -280, height: -55))
        self.block14 = Node(data: Offset(width: -280, height: 50))
        self.block15 = Node(data: Offset(width: -280, height: 170))

        self.block16 = Node(data: Offset(width: -155, height: 170))
        self.block17 = Node(data: Offset(width: -50, height: 170))
        self.block18 = Node(data: Offset(width: 55, height: 170))
        self.block19 = Node(data: Offset(width: 160, height: 170))
        self.end = Node(data: Offset(width: 280, height: 170))

        self.directBlock1 = Node(data: Offset(width: 170, height: -275))
        self.directBlock2 = Node(data: Offset(width: 100, height: -205))
        self.directBlock3 = Node(data: Offset(width: 0, height: -110))
        self.directBlock4 = Node(data: Offset(width: -95, height: -10))
        self.directBlock5 = Node(data: Offset(width: -165, height: 60))
        self.directBlock6 = Node(data: Offset(width: -170, height: -275))
        self.directBlock7 = Node(data: Offset(width: -100, height: -205))
        self.directBlock8 = Node(data: Offset(width: 0, height: -110))
        self.directBlock9 = Node(data: Offset(width: 100, height: -10))
        self.directBlock10 = Node(data: Offset(width: 170, height: 60))

        self.redStart = []
        self.blueStart = []
        self.redFinish = []
        self.blueFinish = []
        for index in 0..<2 {
            redStart.append(Node(data: Offset(width: Double(index * 70) + 180, height: 405), next: block1))
            redFinish.append(Node(data: Offset(width: Double(index * 70) + 180, height: 405)))

            blueStart.append(Node(data: Offset(width: Double(index * -70) - 180, height: 405), next: block1))
            blueFinish.append(Node(data: Offset(width: Double(index * -70) - 180, height: 405)))

            redFinish[index].next = redFinish[index]
            blueFinish[index].next = blueFinish[index]
        }

        for index in 2..<4 {
            redStart.append(Node(data: Offset(width: Double(index-2) * 70 + 180, height: 475), next: block1))
            redFinish.append(Node(data: Offset(width: Double(index-2) * 70 + 180, height: 475)))

            blueStart.append(Node(data: Offset(width: Double(index-2) * -70 - 180, height: 475), next: block1))
            blueFinish.append(Node(data: Offset(width: Double(index-2) * -70 - 180, height: 475)))

            redFinish[index].next = redFinish[index]
            blueFinish[index].next = blueFinish[index]
        }


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

        block5.directNext = directBlock1
        directBlock1.next = directBlock2
        directBlock2.next = directBlock3
        directBlock3.next = directBlock4
        directBlock4.next = directBlock5
        directBlock5.next = block15

        block10.directNext = directBlock6
        directBlock6.next = directBlock7
        directBlock7.next = directBlock8
        directBlock8.next = directBlock9
        directBlock9.next = directBlock10
        directBlock10.next = end

        directBlock3.directNext = directBlock9

    }
}

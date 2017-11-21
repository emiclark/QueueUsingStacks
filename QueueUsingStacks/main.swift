//
//  main.swift
//  QueueUsingStacks
//
//  Created by Emiko Clark on 11/21/17.
//  Copyright © 2017 Emiko Clark. All rights reserved.
//

import Foundation

class Node {
    var value: Int
    var next: Node?
    
    init(value: Int) {
        self.value = value
    }
}

class Stack {
    var top: Node?
    
    func push(node: Node) {
        let new = Node(value: node.value)
        new.next = top
        top = new
    }
    
    func pop() -> Any {
        guard let newNode = top else { return  false }
        if newNode.next != nil {
            top = newNode.next!
        } else {
            top = nil
        }
        return newNode
    }

    func isEmpty(stack: Stack) -> Bool {
        return (stack.top == nil ? true : false)
    }
    
    func printStack(label: String, stack: Stack) {
        var output = label
        output += "\n----------\n"
        var n = stack.top
        
        if isEmpty(stack: stack) {
            print("Stack '\(label)' is empty")
        } else {
            while(n?.next != nil && n != nil) {
                output += "\(String(describing: (n?.value)!))\n"
                n = n?.next
            }
            if n?.next == nil {
                output += "\(String(describing: (n?.value)!))" + "\n"
            }
            output += "----------\n"
            print(output)
        }
    }
}

class MyQueue {
    var oldest = Stack()
    var newest = Stack()
    
    init() {
        let n1 = Node(value: 20)
        newest.push(node: n1)
        let n2 = Node(value: 5)
        newest.push(node: n2)
        let n3 = Node(value: 52)
        newest.push(node: n3)
        let n4 = Node(value: 17)
        newest.push(node: n4)
        let n5 = Node(value: 36)
        newest.push(node: n5)
    }
    
    func transferItems(from stack1: Stack, to stack2: Stack) {

        while (!stack1.isEmpty(stack: stack1)) {
            stack2.push(node: stack1.pop() as! Node)
        }
    }
    
    func getNextItemFromQueue() -> Any {
        
        if (oldest.isEmpty(stack: oldest) && newest.isEmpty(stack: newest)) {
            print("The queue is empty")

        } else if (!newest.isEmpty(stack: newest) && oldest.isEmpty(stack: oldest)){
            // transfer items from newest to oldest and pop top item from oldest
            transferItems(from: newest, to: oldest)
        }
        
        guard let nextItemInQueue = oldest.pop() as? Node else {
            let new = "nil"
            return new
        }
        return nextItemInQueue
    }
    
    func addToQueue(value: Int) {
        let newNode = Node(value: value)
        newest.push(node: newNode)
        print("pushed \(newNode.value) to queue")
    }
}

let myQueue = MyQueue()
myQueue.newest.printStack(label: "newest", stack: myQueue.newest)
myQueue.oldest.printStack(label: "oldest", stack: myQueue.oldest)

var nextItem = myQueue.getNextItemFromQueue()
if nextItem as? Node != nil {
    print("Next item in queue is: ", (nextItem as! Node).value)
}

nextItem = myQueue.getNextItemFromQueue()
if nextItem as? Node != nil {
    print("Next item in queue is: ", (nextItem as! Node).value)
}

myQueue.addToQueue(value: 65)
myQueue.newest.printStack(label: "newest", stack: myQueue.newest)
myQueue.oldest.printStack(label: "oldest", stack: myQueue.oldest)

nextItem = myQueue.getNextItemFromQueue()
if nextItem as? Node != nil {
    print("Next item in queue is: ", (nextItem as! Node).value)
}

nextItem = myQueue.getNextItemFromQueue()
if nextItem as? Node != nil {
    print("Next item in queue is: ", (nextItem as! Node).value)
}

myQueue.addToQueue(value: 31)
myQueue.newest.printStack(label: "newest", stack: myQueue.newest)
myQueue.oldest.printStack(label: "oldest", stack: myQueue.oldest)

nextItem = myQueue.getNextItemFromQueue()
if nextItem as? Node != nil {
    print("Next item in queue is: ", (nextItem as! Node).value)
}

nextItem = myQueue.getNextItemFromQueue()
if nextItem as? Node != nil {
    print("Next item in queue is: ", (nextItem as! Node).value)
}
nextItem = myQueue.getNextItemFromQueue()
if nextItem as? Node != nil {
    print("Next item in queue is: ", (nextItem as! Node).value)
}
nextItem = myQueue.getNextItemFromQueue()
if nextItem as? Node != nil {
    print("Next item in queue is: ", (nextItem as! Node).value)
}

nextItem = myQueue.getNextItemFromQueue()
if nextItem as? Node != nil {
    print("Next item in queue is: ", (nextItem as! Node).value)
}

myQueue.newest.printStack(label: "newest", stack: myQueue.newest)
myQueue.oldest.printStack(label: "oldest", stack: myQueue.oldest)


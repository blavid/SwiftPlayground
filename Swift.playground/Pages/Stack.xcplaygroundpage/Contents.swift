
//: # Stack implementation
import Foundation

//: ## The Stack struct
struct Stack {
    var top: Node?
    
    mutating func push(val: Int) {
        let oldTop = top
        top = Node(value: val)
        top?.next = oldTop
    }
    
    mutating func pop() -> Int? {
        let oldTop = top
        self.top = top?.next
        return oldTop?.value
    }
    
    func peek() -> Int? {
        return top?.value
    }
}
//: ## The Node class
class Node {
    var value: Int
    var next: Node?
    init(value: Int) {
        self.value = value
    }
}
/*:
 ### Testing the stack
 */
var stack = Stack()
let peek0 = stack.peek()

stack.push(val: 1)
stack.push(val: 2)
stack.push(val: 3)

let peek1 = stack.peek()

let pop1 = stack.pop()
let peek2 = stack.peek()

let pop2 = stack.pop()
let pop3 = stack.pop()


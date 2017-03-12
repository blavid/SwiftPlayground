/*:
 # Fibonacci Sequence
 
 Fibonacci numbers are formed by summing the previous two values in the sequence.
 The zeroth Fibonacci number is defined to be 1, so the sequence looks like:
 
 0, 1, 1, 2, 3, 5, 8, 13, 21, 34...
 
 */



//: ## Return the nth Fibonacci number using recursion
func fibonacciNumber(_ n: Int) -> Int? {
    if n <= 0 { return nil }
    if n <= 2 {
        return n - 1
    } else {
        return fibonacciNumber(n - 1)! + fibonacciNumber(n - 2)!
    }
}
fibonacciNumber(0) //Wrong
fibonacciNumber(1)
fibonacciNumber(2)
fibonacciNumber(3)
fibonacciNumber(4)
fibonacciNumber(5)
fibonacciNumber(6)
fibonacciNumber(7)
fibonacciNumber(8)

//: ## Return a sequence of Fibonacci numbers of a given length
func fibonacciSequenceOfLength(_ length: Int) -> [Int] {
    var fibSequence = [0, 1]
    if length <= 2 {
        return Array(fibSequence.dropLast(2 - length))
    }
    for _ in (3...length) {
        let first = fibSequence[fibSequence.count - 2]
        let second = fibSequence.last!
        fibSequence.append(first + second)
    }
    
    return fibSequence
}

fibonacciSequenceOfLength(0)
fibonacciSequenceOfLength(1)
fibonacciSequenceOfLength(2)
fibonacciSequenceOfLength(3)
fibonacciSequenceOfLength(5)
fibonacciSequenceOfLength(55)



//: # Factorial Calculator


//: ## Using reduce
func factorialUsingReduce(num: UInt) -> UInt {
    if num == 0 { return 1 }
    return (1...num).reduce(1, { $0 * $1 })
}

factorialUsingReduce(num: 0)
factorialUsingReduce(num: 3)
factorialUsingReduce(num: 5)
factorialUsingReduce(num: 8)
factorialUsingReduce(num: 20)

//: ## Using recursion
func factorialUsingRecursion(num: UInt) -> UInt {
    if num == 0 {
        return 1
    } else {
        return num * factorialUsingRecursion(num: num - 1)
    }
}

factorialUsingRecursion(num: 0)
factorialUsingRecursion(num: 3)
factorialUsingRecursion(num: 5)
factorialUsingRecursion(num: 8)
factorialUsingRecursion(num: 20)

//: ## Using for loop

func factorialUsingLoop(num: UInt) -> UInt {
    var result: UInt = 1
    if num == 0 { return 1 }
    for value in 1...num {
        result = result * value
    }
    return result
}

factorialUsingLoop(num: 0)
factorialUsingLoop(num: 3)
factorialUsingLoop(num: 5)
factorialUsingLoop(num: 8)
factorialUsingLoop(num: 20)
let numbers = [1,2,3,4,5,6]
numbers

// Filter only odd numbers

//: ## Naive approach: Use a for loop
func extractOddUsingLoop(numbers: [Int]) -> [Int] {
    var oddNumbers = [Int]()
    for number in numbers {
        if number % 2 == 1 {
            oddNumbers.append(number)
        }
    }
    return oddNumbers
}
extractOddUsingLoop(numbers: numbers)

/*:
 That works, but it's not optimal. First, it uses about 5 lines of code to do something
 very simple. Second, we need to use a var, which is mutable.


 ## Second approach: Use a higher order function
 Let's use the built in filter function. It takes a function as a parameter. That function
 is used to determine if an element should or should not be in the array.
 
 The shape of the function is (Int) -> Bool
 */

func isOdd(_ num: Int) -> Bool {
    return num % 2 == 1
}

/*:
 Now, let's pass that function into the filter function
 */

let oddNumbersFromFilterFunction = numbers.filter { isOdd($0) }
oddNumbersFromFilterFunction

/*:
 Still, this is too much work. We had to declare the function, then put the function inside
 the filter function. We can do better.
 
 Let's put the higher order filter function inside a closure:
 */

let oddNumbers = numbers.filter { $0 % 2 == 1}
oddNumbers

// filter only even numbers
let evenNumbers = numbers.filter { (num) -> Bool in
    return num % 2 == 0
}
evenNumbers


// Map experiments
let doubleNumbers = numbers.map { (num) -> Int in
    return num * 2
}
doubleNumbers

let tripleNumbers = numbers.map({ $0 * 3})
tripleNumbers

// Reduce experiments
let reduction = numbers.reduce(0, { $0 + $1})
reduction

func factorial(num: Int) -> Int {
    return (1...num).reduce(1, { $0 * $1 })
}

factorial(num: 3)
factorial(num: 5)
factorial(num: 8)

let numbers = [1,2,3,4,5,6]
numbers

// Filter only odd numbers
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

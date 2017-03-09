// Fizz Buzz
// If a number is divisible by 3, print "Fizz"
// If a number is divisible by 5, print "Buzz"
// if a number is divisible by both 3 and 5, print "Fizz Buzz"

func fizzBuzz(num: Int) -> String? {
    switch num {
    case let x where x % 15 == 0 :
        return "Fizz Buzz"
    case let x where x % 5 == 0:
        return "Buzz"
    case let x where x % 3 == 0:
        return "Fizz"
    default:
        return nil
    }
}

fizzBuzz(num: 3)
fizzBuzz(num: 12)
fizzBuzz(num: 5)
fizzBuzz(num: 30)

for x in (1...100) {
    print("\(x): \(fizzBuzz(num: x))")
}

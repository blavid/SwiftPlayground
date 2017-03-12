//: Given an ordered (ascending) list of numbers, find any two that add up to a given sum

/*:
 For example, suppose we have a list:
 let numberList = [1, 2, 3, 5, 8, 13]
 
 and we wish to know if any two of those numbers sum to 7
 
 Write a function to do this.
 
 
 */


//: ## Naieve approach: Linear walk through array twice
//: This is O n^2
let numberList = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]

func findSum(_ num: Int, inList numberList: [Int]) -> Bool {
    print("Looking for a sum of \(num)")
    var iterationCount = 1
    for firstIndex in (0..<numberList.count) {
        let firstNumber = numberList[firstIndex]
        if firstNumber >= num {
            break
        }
        for secondIndex in ((firstIndex + 1)..<numberList.count) {
            iterationCount += 1
            let secondNumber = numberList[secondIndex]
            if secondNumber >= num || firstNumber + secondNumber > num {
                break
            }
            if firstNumber + secondNumber == num {
                print("Found \(firstNumber) + \(secondNumber) = \(num)")
                print("iteration count: \(iterationCount)\n")
                return true
            }
        }
    }
    print("returning FALSE")
    print("iteration count: \(iterationCount)\n")
    return false
}

print("Searching the simple way:")
findSum(7, inList: numberList)
findSum(22, inList: numberList)
findSum(27, inList: numberList)

/*: ## A better approach:
 Since the list is ordered, we can walk through once, from top and bottom.
 This is O n (linear)
*/

func findSumLinear(_ num: Int, inList numberList: [Int]) -> Bool {
    print("Looking for a sum of \(num)")
    var leftIndex = 0
    var rightIndex = numberList.count - 1
    var iterationCount = 1
    while leftIndex < rightIndex {
        iterationCount += 1
        let leftNumber = numberList[leftIndex]
        let rightNumber = numberList[rightIndex]
        let sum = leftNumber + rightNumber
        if sum == num {
            print("Found \(leftNumber) + \(rightNumber) = \(sum)")
            print("Iteration Count: \(iterationCount)\n")
            return true
        }
        if sum < num {
            leftIndex += 1
            continue
        }
        if sum > num {
            rightIndex -= 1
            continue
        }
    }
    print("returning FALSE")
    print("Iteration Count: \(iterationCount)\n")
    return false
}
print("\n\nSearching the better way:")

findSumLinear(7, inList: numberList)
findSumLinear(22, inList: numberList)
findSumLinear(27, inList: numberList)


/*: ## Unordered search
 What about if the array of numbers is not guaranteed to be in order?
 
 In this case, a simple walk throught the array is insufficient. A naieve approach
 to this problem would be a nested array and a big O of n^2, comparing every 
 number with every other number.
 
 We need a different strategy. Since we are summing two numbers
 together, we can look for a number's complement in the list that we've already read.
 1. Read the first number
 2. Store the complement in a set
 3. Read subsequent numbers. If that number exists in the set, we have a match.
 
 This is O n
 */

func findSumInUnordered(_ num: Int, inList numberList: [Int]) -> Bool {
    print("Looking for a sum of \(num)")
    var complements = Set<Int>()
    var iterationCount = 0
    for number in numberList {
        iterationCount += 1
        let complement = num - number
        if complements.contains(number) {
            print("Found \(number) + \(complement) = \(num)")
            print("Iteration Count: \(iterationCount)\n")
            return true
        } else {
            complements.insert(complement)
        }
    }
    print("returning FALSE")
    print("Iteration Count: \(iterationCount)\n")
    return false
}

print("Now the efficient way (in an unordered list")
findSumInUnordered(7, inList: numberList)
findSumInUnordered(22, inList: numberList)
findSumInUnordered(27, inList: numberList)

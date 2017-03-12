/*: # Binary Search Algorithm
 Given an array of sorted numbers, use a binary search to find a given integer in the array.
 */

func binarySearch(num: Int, array: [Int] ) -> Bool {
    var leftIndex = 0
    var rightIndex = array.count - 1
    
    while leftIndex <= rightIndex {
        print("Search for \(num) in \(array[leftIndex...rightIndex])")
        let middleIndex = (rightIndex + leftIndex) / 2
        let middleValue = array[middleIndex]
        
        if num == middleValue {
            return true
        }
        if num < middleValue {
            rightIndex = middleIndex - 1
        }
        if num > middleValue {
            leftIndex = middleIndex + 1
        }
    }

    return false
}

let mySortedArray = [1, 2, 3, 5, 8, 13, 21, 33, 54, 87, 141]
// let mySortedArray = [Int](1...1000)

print(binarySearch(num: 3, array: mySortedArray))
print(binarySearch(num: 4, array: mySortedArray))

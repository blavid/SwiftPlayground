/*: # Counting Algorithm
 
 Given an array of strings (such as names) find the most common one.
 */

let nameArray = ["Joe", "Margaret", "Muhammad", "Sally", "Jamal", "Paul",
                 "Sally", "Joe", "Ingrid", "Muhammad", "Steve", "Christine",
                 "Muhammad", "Blake", "Paul", "Sally", "Muhammad", "Blake",
                 "Christine", "Muhammad", "Sally", "Joe", "Steve"]

func mostCommonString(strings: [String]) -> String {
    var wordCounts = [String: Int]()
    
    //: Add each word to a dictionary with their counts
    for word in strings {
        if let count = wordCounts[word] {
            wordCounts[word] = count + 1
        } else {
            wordCounts[word] = 1
        }
    }
    
    //: Iterate through the dictionary and identify the largest count
    var mostCommonString = ""
    var biggestStringCount = 0
    for entry in wordCounts {
        print(entry)
        if entry.value > biggestStringCount {
            biggestStringCount = entry.value
            mostCommonString = entry.key
        }
    }
    
    return mostCommonString
}

mostCommonString(strings: nameArray)

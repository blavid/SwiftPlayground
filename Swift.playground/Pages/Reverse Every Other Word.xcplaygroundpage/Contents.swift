//: # Reverse Every Other Word

//: Given a sentence, return the sentence with every other word reversed.
import Foundation

let sentence = "The quick brown fox jumps over the lazy dog."

extension String {

    func reverse() -> String {
        var returnString = ""
        let stringLength = self.characters.count
        for idx in (0..<stringLength).reversed() {
            let index = self.index(self.startIndex, offsetBy: idx)
            let char = self[index]
            returnString.append(char)
        }
        return returnString
    }
}

sentence.reverse()


"Blake".reverse()

let reverseString = sentence.components(separatedBy: " ")
print(reverseString)


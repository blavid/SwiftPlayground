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
    
    func reverseEveryOtherWord() -> String {
        let wordArray = self.components(separatedBy: " ")
        var isOddWord = false
        var sentence = ""
        for word in wordArray {
            isOddWord = !isOddWord
            if isOddWord {
                sentence.append(word.reverse() + " ")
            } else {
                sentence.append(word + " ")
            }
        }
        return sentence
    }
    
    /*:
     ## Remove all the vowels in a string
     */
    func removeVowels() -> String {
        var returnString = ""
        let vowels = "AaEeIiOoUuYy"
        for index in (0..<self.characters.count) {
            let character = self[self.index(self.startIndex, offsetBy: index)]
            if !vowels.contains(String("\(character)")) {
                returnString.append(character)
            }
        }
        
        return returnString
    }
}
print(sentence)
print(sentence.reverseEveryOtherWord())
print(sentence.removeVowels())


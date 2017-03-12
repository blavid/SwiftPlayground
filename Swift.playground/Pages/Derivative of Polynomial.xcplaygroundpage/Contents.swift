/*: # Derivative of a Polynomial
 
 Given a polynomial, return the derivative using the Power Rule
 
 */

/*: ## Storing a polynomial
 
 We first have to create a way to store and pass around a polynomial.
 Options include:
 * A simple array of numbers, with the nth number representing x to the nth power
 And the number equal to the coefficient of the term
 
 For example: 3x^2 + 2x - 1 could be represented as [-1, 2, 3]
 
 * A struct to hold each term, then a struct to hold the polynomial
 A Term would have a coefficient and a power
 A Polynomial would have an array of Terms
 
 */

struct Term: CustomStringConvertible {
    var coefficient: Int
    var power: Int
    var description: String {
        let exponent = power > 1 ? "^\(power)" : ""
        let x = power > 0 ? "x" : ""
        return "\(abs(coefficient))\(x)\(exponent)"
    }
    
    func derivative() -> Term {
        let newCoefficient = coefficient * power
        let newPower = power - 1
        return Term(coefficient: newCoefficient, power: newPower)
    }
    
}

struct Polynomial: CustomStringConvertible {
    var terms = [Term]()
    
    var description: String {
        if terms.count == 0  {
            return ""
        }
        var polynomialString = ""
        for index in (0..<terms.count) {
            let term = terms[index]
            var sign = ""
            if index > 0 {
                sign = term.coefficient > 0 ? "+ " : "- "
            }
            
            polynomialString.append("\(sign)\(term) ")
        }
        return polynomialString
    }
    
    mutating func addTerm(_ newTerm: Term) {
        if newTerm.coefficient == 0 {
            return
        }
            for index in (0..<terms.count) {
                var existingTerm = terms[index]
                if existingTerm.power == newTerm.power {
                    // remove the existing term
                    terms.remove(at: index)
                    existingTerm.coefficient += newTerm.coefficient
                }
            }
        terms.append(newTerm)
    }
    
    func derivative() -> Polynomial {
        var newPolynomial = Polynomial()
        for term in terms {
            newPolynomial.addTerm(term.derivative())
        }
        return newPolynomial
    }
}

var pn = Polynomial()
var term1 = Term(coefficient: 3, power: 2)
var term2 = Term(coefficient: 2, power: 1)
var term3 = Term(coefficient: -1, power: 0)
pn.addTerm(term1)
pn.addTerm(term2)
pn.addTerm(term3)
print(pn.description)

term1.derivative()
term2.derivative()
term3.derivative()


print("Derivative: \(pn.derivative())")
pn.derivative().derivative()


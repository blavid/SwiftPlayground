/*: # Binary Search Tree
 
 Some functions that implement and search a binary search tree
 
 A binary tree looks like this:
 
           41
         /   \
        20    57
       /    /   \
      19   50   62
     /    /    /  \
    2    44   60   70
                  /  \
                 68   75
                   \
                    69
 
 Each node has a value and a possible left and right sub-node. The value of a Node is always
 larger than all sub-nodes on the left and always larger than all sub-nodes on the right.
 */

/*: ## The BSTNode class
 
 The BSTNode class is used to store the values and pointers to the sub-nodes of the tree.
 */

class BSTNode {
    var value: Int
    var leftChild: BSTNode?
    var rightChild: BSTNode?
    
    init(value: Int, left: BSTNode?, right: BSTNode?) {
        self.value = value
        self.leftChild = left
        self.rightChild = right
    }
}

/*: ## The BST class
 
 The BST is very simple. It contains a root node and associated functions for inserting
 deleting, searching, and extracting values.
 */

class BinarySearchTree {
    var root: BSTNode?
    
    init(root: BSTNode) {
        self.root = root
    }
    
    init() {
        self.root = nil
    }
}

/*: ## Creating the Binary Tree from scratch
 
 Let's populate our tree with the values in the diagram above. Since we don't yet have a
 function to add nodes, we'll do it manually, starting at the bottom.
 */
let node69 = BSTNode(value: 69, left: nil, right: nil)
let node68 = BSTNode(value: 68, left: nil, right: node69)
let node75 = BSTNode(value: 75, left: nil, right: nil)
let node70 = BSTNode(value: 70, left: node68, right: node75)
let node60 = BSTNode(value: 60, left: nil, right: nil)
let node44 = BSTNode(value: 44, left: nil, right: nil)
let node2 = BSTNode(value: 2, left: nil, right: nil)
let node19 = BSTNode(value: 19, left: node2, right: nil)
let node50 = BSTNode(value: 50, left: node44, right: nil)
let node62 = BSTNode(value: 62, left: node60, right: node70)
let node20 = BSTNode(value: 20, left: node19, right: nil)
let node57 = BSTNode(value: 57, left: node50, right: node62)
let node41 = BSTNode(value: 41, left: node20, right: node57)

/*: ## Search Function
 
 Now that we have the tree built, let's create a search function to find a value within the tree.
 We know that the nodes are sorted already, which makes searching much more efficient. We simply
 start at the root node:
 
 * If the value is our target, return true
 * If the target is less than the value, recursively search the left node
 * if the tartet is larger than the value, recursively search the right node
 
 */
func searchNode(_ startingNode: BSTNode?, value: Int) -> Bool {
    // Base Case
    if startingNode == nil {
        return false
    }
    
    if startingNode?.value == value {
        return true
    }
    if value < (startingNode?.value)! {
        return searchNode(startingNode!.leftChild, value: value)
    } else {
        return searchNode(startingNode!.rightChild, value: value)
    }
}

searchNode(node41, value: 60)
searchNode(node41, value: 41)
searchNode(node41, value: 69)
searchNode(node41, value: 71)

/*: ## The BSTNode add function
 
 */
extension BSTNode {
    func add(_ insertValue: Int) -> Bool {
        if insertValue == value {
            return false
        } else if insertValue < value {
            if leftChild == nil {
                leftChild = BSTNode(value: insertValue, left: nil, right: nil)
                return true
            } else {
                return leftChild!.add(insertValue)
            }
        } else {
            if rightChild == nil {
                rightChild = BSTNode(value: insertValue, left: nil, right: nil)
                return true
            } else {
                return rightChild!.add(insertValue)
            }
        }
    }
    
    func searchNode(_ startingNode: BSTNode?, value: Int) -> Bool {
        // Base Case
        if startingNode == nil {
            return false
        }
        
        if startingNode?.value == value {
            return true
        }
        if value < (startingNode?.value)! {
            return searchNode(startingNode!.leftChild, value: value)
        } else {
            return searchNode(startingNode!.rightChild, value: value)
        }
    }

}

/*: ## A function to add a node to the Binary Search Tree
 
 
 */
extension BinarySearchTree {
    func add(_ insertValue: Int) -> Bool {
        // First node in this tree?
        if root == nil {
            root = BSTNode(value: insertValue, left: nil, right: nil)
            return true
        } else {
            return root!.add(insertValue)
        }
    }
    
    func find(_ searchValue: Int) -> Bool {
        if root == nil {
            return false
        }
        return root!.searchNode(root, value: searchValue)
    }
}

    /*:
     Now, let's try it out.
     */
    
    var bst = BinarySearchTree()
bst.add(5)
bst.add(41)
bst.add(55)

bst.find(4)
bst.find(5)


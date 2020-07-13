# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right

# This is a straightforward traversal problem. The goal is to keep track of the previous closest node value and compare if the current node is closer. 

# It's important to also remember that binary search trees have a special property. The left child node is always smaller than its parent node and the right child node is always geter than its parent node.

# I do 3 checks at each node. Do I need to move to the left or the right? The third case is that the current node value is the same as the target, in which case no other number can be closer!

# The choice of a while node is handy so that the loop terminates once the traversal hits a NULL value.

class Solution(object):
    def closestValue(self, root, target):
        """
        :type root: TreeNode
        :type target: float
        :rtype: int
        """
        
        node = root
        current = root.val 
        
        while node:
            current = min((current, node.val), key = lambda x: abs(target - x))
            
            if node.val > target:
                node = node.left
                
            elif node.val < target:
                node = node.right
            
            else:
                return node.val
            
        return current

        # Time complexity: O(n), as with many tree problems, the worst case scenario is when the tree is entirely stacked to one side. 
        # Space complexity: O(1), I'm simply updating the value of current at each step. 
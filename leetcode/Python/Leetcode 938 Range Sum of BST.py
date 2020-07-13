# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right

# A binary search tree has at most 2 children nodes, a left and right side. 
# A common approach to solving binary search tree problems is to use recursion. A recursive function is one that directly or indirectly calls on itself. 
# The function "bst_helper" is an example of a recursive function. 

# Recursive algorithms always start with a base case. In this case, the first thing that I always want to check is if my current "root" value is between my left and right thresholds. If so, add it to my running total. 

# Next, I check to see if my left child node exists, and if so, call bst_helper. I hope you can see that the recursive function will continue traversing down the left and right side sides of the tree, adding values to total, until it reaches a leaf node points to NULL.

def bst_helper(root, L, R):
    
    total = 0
    
    if root.val >= L and root.val <= R:
        total += root.val
    
    if root.left and root.val > L:
        total += bst_helper(root.left, L, R)
        
    if root.right and root.val < R:
        total += bst_helper(root.right, L, R)
        
    return total


class Solution(object):
    def rangeSumBST(self, root, L, R):
        """
        :type root: TreeNode
        :type L: int
        :type R: int
        :rtype: int
        """
        
        return bst_helper(root, L, R)

        # Time complexity: O(n), the worst case scenario is that the tree is perfectly unbalanced. All the values are on the right or all the values are on the left. In this scenario, the time complexity is the number of nodes. 
        # Space complexity: O(1), the only value that is being updated is total so the space is constant.
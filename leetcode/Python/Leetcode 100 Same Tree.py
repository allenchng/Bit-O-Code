# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

# This solution will use recursive depth first search.
# I want to traverse down each tree concurrently and compare the values. 
# If there's ever a mismatch, I know the trees are not the same. If I traverse all the way to the bottom, I can conclude the trees are the same. 
# During the traversal, I have 3 situations I need to check.

# 1) Are both nodes pointing to null (end of the tree)? If so, keep going.
# 2) Is one node pointing to null and the other pointing to a node? If so, I know that the trees are not the same. Return False 
# 3) Are the two nodes equal in value? If not, return False

# Return if left and right side are True

class Solution(object):
    def isSameTree(self, p, q):
        """
        :type p: TreeNode
        :type q: TreeNode
        :rtype: bool
        """
        
        if not (p or q):
            return True
        if not (p and q):
            return False
        if p.val != q.val:
            return False
        
        return self.isSameTree(p.left, q.left) and self.isSameTree(p.right, q.right)
        

        # Time complexity: O(n), in case of unbalanced tree
        # Space complexity: O(1), but keep in mind that recursive calls take space as well. 
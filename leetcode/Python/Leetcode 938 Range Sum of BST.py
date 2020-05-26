# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right

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
        
        # recursion
        # base case, is root value between L and R
        # if left side exists and it's great than L, recurse down left side
        # if right side exists and it's less than R, recurse down right side
        # return total
        
        return bst_helper(root, L, R)
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def closestValue(self, root, target):
        """
        :type root: TreeNode
        :type target: float
        :rtype: int
        """
        
        # start at root
        # compare each node to current minimum
        # choose to go left or right child based on comparison of current node against target
        # when reach null, break loop
        
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
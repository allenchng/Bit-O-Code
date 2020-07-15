# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right

# Iterative Solution

# Check edge case for empty tree, return 0 if empty
# Create a stack to hold initial starting point and depth (root / 1)
# While loop to run until the stack is empty
# Pop the tuple off the stack and store as current node and current depth 
# Update depth counter
# Check if left and right children exist, if so, append to stack 
# Continue iterating until reach leaves

class Solution(object):
    def maxDepth(self, root):
        """
        :type root: TreeNode
        :rtype: int
        """

        if not root:
            return 0
        
        s = [(root,1)]
        depth = 0
        
        while s:
            cur, cur_depth = s.pop()
            if cur:
                depth = max(depth,cur_depth)
                if cur.left:
                    s.append((cur.left,cur_depth+1))
                if cur.right:
                    s.append((cur.right,cur_depth+1))
        return depth

# recursive solution

class Solution(object):
    def maxDepth(self, root):
        """
        :type root: TreeNode
        :rtype: int
        """
        if root is None:
            return 0
        else:
            return 1 + max(self.maxDepth(root.left),self.maxDepth(root.right))
class Solution(object):
    def maxArea(self, height):
        """
        :type height: List[int]
        :rtype: int
        """
        
        # rectangle is height * width
        # two pointers
        # while loop
        # check if height of start is less or equal to height of end
        # use lower heights
        # update counters
        
        res = 0
        i = 0
        j = len(height) - 1
        
        while i < j:
            if height[i] <= height[j]:
                res = max(res, height[i]*(j-i))
                i += 1
            else:
                res = max(res, height[j]*(j-i))
                j -= 1
        return res
class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        
        # for loop
        # each value take difference from target
        # use hash map to look up if seen previously
        # if yes, return indices
        
        h = {}
        
        for idx, val in enumerate(nums):
            diff = target - val
            
            if diff not in h:
                h[val] = idx
            else:
                return [h[diff], idx]
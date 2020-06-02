class Solution(object):
    def productExceptSelf(self, nums):
        """
        :type nums: List[int]
        :rtype: List[int]
        """
        
        # get length of array
        # instantiate unit array for output
        # create accumulator variables
        # accumulate everything to the right, accumulate everything to the left
        # multiply accumulations together
        
        n = len(nums)
        res = [1] * n
        l_accum = r_accum = 1
        
        for i in range(n):
            res[i] *= l_accum
            res[~i] *= r_accum
            l_accum *= nums[i]
            r_accum *= nums[~i]
        return res
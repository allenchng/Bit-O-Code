class Solution(object):
    def maxSubArray(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        
        # make a window
        # calculate the window sum
        # check max of window_sum + curr or curr
        # keep track of window sum
        # keep track of max sum
        # return window sum at end
        
        window_sum = nums[0]
        n = len(nums)
        max_sum = window_sum
        
        
        for i in range(1, n):
            curr = nums[i]
            window_sum = max(window_sum + curr, curr)
            max_sum = max(max_sum, window_sum)
        
        return max_sum
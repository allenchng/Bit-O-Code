class Solution(object):
    def maxSubArray(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        
        # I'll start by solving this using the linear approach. 
        # One way to think about this problem is to use expanding windows. At each index, I ask if it makes sense to expand or reset the window. The decision criteria I use is whether the sum of the current value and the previous window is greater than the current value. Remember that the questions asks for the CONTIGUOUS array, so even if I'm adding a negative number, if the sum + current value > current value, I should expand the window. 
        
        # If you're struggling with the logic, it might be helpful to go back and think about the stock selling problem again. 
        
        window_sum = nums[0]
        max_sum = window_sum
        n = len(nums)
        
        for i in range(1,n):
            curr_value = nums[i]
            window_sum = max(window_sum + curr_value, curr_value)
            
            max_sum = max(max_sum, window_sum)
        
        return max_sum
    
        # Time complexity: O(n) because I walk through each element of the array (minus the first)
        # Space complexity: O(1) constant because I am updating a single variable continuously.
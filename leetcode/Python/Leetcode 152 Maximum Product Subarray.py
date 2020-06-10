class Solution(object):
    def maxProduct(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        
        # loop through array keeping track of max
        # at each value, check if product between current max and value > current max
        # ALSO check if product product between current min and value > current max
        # accounts for negative * negative
        # check if max between those two products is greater than current value
        # if yes, update current max
        
        curr_max = nums[0]
        curr_min = nums[0]
        final_max = nums[0]
        i = 1
        
        while i < len(nums):
            tmp = curr_max
            
            curr_max = max(max(curr_max * nums[i], curr_min * nums[i]), nums[i])
            
            curr_min = min(min(tmp * nums[i], curr_min * nums[i]), nums[i])
            
            if curr_max > final_max:
                final_max = curr_max
            i += 1
        return final_max
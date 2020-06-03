class Solution(object):
    def findMin(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        
        # sorted array -> binary search
        # set left end, right end
        # set middle
        # check if middle is less than end -> pivot
        # if larger than end, move left pointer to m+1
        # else move right pointer to m
        
        i = 0
        j = len(nums) - 1
        
        while i < j:
            mid = (i + j) // 2
            
            if nums[mid] > nums[j]:
                i = mid + 1
            else:
                j = mid
                
        return nums[i]
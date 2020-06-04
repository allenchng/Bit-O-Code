class Solution(object):
    def search(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        
        # runtime complexity O(log n)
        # binary search
        # 3 conditions: target = mid, mid > target, mid < target
        # if not in array return -1
        # extension of where's the pivot problem
        # two pivots to check, is it pivoted to the left, or the right?
        #
        
        
        i = 0
        j = len(nums) - 1
        
        while i <= j:
            mid = (i + j) // 2
            
            if target == nums[mid]:
                return mid
            
            if nums[mid] >= nums[i]:
                if nums[i] <= target and target < nums[mid]:
                    j = mid - 1
                else:
                    i = mid + 1
                    
            else:
                if nums[mid] < target and target <= nums[j]:
                    i = mid + 1
                else:
                    j = mid - 1
        
        return -1 
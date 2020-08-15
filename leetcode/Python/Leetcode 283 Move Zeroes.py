
# This problem can be solved using two pointers. 
# Pointers initially start at the beginning of the array.
# Do two checks for non-zero values, for each iteration, move 'j' pointer forward
# Since 'i' pointer only moves for non-zero values, swap will always move a 0 towards the end
# bubble to the end


class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        
        i = 0
        j = 0
        
        while j < len(nums):
            if nums[j] != 0:
                nums[i], nums[j] = nums[j], nums[i]
            
            if nums[i] != 0:
                i += 1
            
            j += 1

# Time complexity: O(n), iterate until the end of the array
# Space complexity: O(1), swapping in place
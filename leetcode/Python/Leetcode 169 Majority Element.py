class Solution(object):
    def majorityElement(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        d = {}
        
        for i in nums:
            if i not in d:
                d[i] = 1
                
            if d[i] > (len(nums) // 2):
                return i
            else:
                d[i] += 1

# O(n) / O(n)

class Solution(object):
    def majorityElement(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        
        count = 0
        
        for num in nums:
            if count == 0:
                candidate = num
            if candidate == num:
                count += 1
            else:
                count -= 1
                
        return candidate

# O(n) / O(1)
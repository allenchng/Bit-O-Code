class Solution(object):
    def intersection(self, nums1, nums2):
        """
        :type nums1: List[int]
        :type nums2: List[int]
        :rtype: List[int]
        """
        
       # sort and use pointers
       # store in hash map for constant look up
       # 
    
        nums1.sort()
        nums2.sort()
        
        a = 0
        b = 0
        res = {}
        
        while a < len(nums1) and b < len(nums2):
            if nums1[a] < nums2[b]:
                a += 1
            elif nums1[a] > nums2[b]:
                b += 1
            else:
                if nums1[a] not in res:
                    res[nums1[a]] = 1
                a += 1
                b += 1
                
        return res
                
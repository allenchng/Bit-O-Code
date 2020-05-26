class Solution(object):
    def arraysIntersection(self, arr1, arr2, arr3):
        """
        :type arr1: List[int]
        :type arr2: List[int]
        :type arr3: List[int]
        :rtype: List[int]
        """
        
        # three pointers
        # remember they're sorted, so once you reach the max of an array, no other numbers past that will intersect
        # first check values equal, if so, iterate all pointers forward
        # otherwise check max and iterate pointers for other arrays until a match is found or greater max
        
        a = 0
        b = 0
        c = 0
        res = []
        
        while a < len(arr1) and b < len(arr2) and c < len(arr3):
            if arr1[a] == arr2[b] == arr3[c]:
                res.append(arr1[a])
                a +=1 
                b += 1
                c += 1
                continue
        
            curr_max = max(arr1[a], arr2[b], arr3[c])
            
            while a < len(arr1) and arr1[a] < curr_max:
                a += 1
            while b < len(arr2) and arr2[b] < curr_max:
                b += 1
            while c < len(arr3) and arr3[c] < curr_max:
                c += 1
                
        return res
        
        
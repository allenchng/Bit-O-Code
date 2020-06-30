class Solution(object):
    def intersection(self, nums1, nums2):
        """
        :type nums1: List[int]
        :type nums2: List[int]
        :rtype: List[int]
        """
        
       
        # There are multiple ways to solve this problem. I will show one approach using pointers and a dictionary. I encourage you to think about other ways to solve the problem!
        
        # Looking at the inputs, I need to keep in mind two things. 
        # 1) The elements are out of order. If I'm searching for matches between arrays, it's inefficient to have to check each array. One way to solve this challenge is to sort both arrays in place before iterating through them. 
        # 2) The second thing to keep in mind is that integers can be repeated within an array and I don't want to double count that in my array.
        
        nums1.sort()
        nums2.sort()
        
        # Here I set up two pointers to keep track of where I am in each array. I also set up a dictionary to solve my second problem. Remember, a dictionary has constant look up time. 
        
        a = 0
        b = 0
        res = {}
        
        # Next I iterate through each array, if I ever reach the end of the array, I know there's no more elements to check for intersection. As I iterate, I check the values at each of my pointers. If one is greater than the other, I move the pointer until I find when the array values are equal. From there, I check if the value is in my dictionary. If not, add it. Ohterwise move both pointers forward.
        
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
    
        # Time complexity: Sorting in place is O(n log n) time and the loop is O(n), where n is the length of the shorter array. 
        # Space complexity: O(n) where there is perfect intersection across arrays and the values within each array are unique.
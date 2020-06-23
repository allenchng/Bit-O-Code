class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """

        # Broad overview
        
        # In Python, dictionaries are used as hash maps. A benefit of hash maps is that the lookup time for a key is constant O(1). I just call it h to remind myself it's a hash map!
        h = {}

        # Iterate across the array. I use enumerate so that I can get the current value and index at each iteration.
        
        for idx, val in enumerate(nums):

        # First take the difference between the target number and the current value. This is the second number you're looking for to make a two sum
            diff = target - val
        
        # Next check to see if the difference is a value in your dictionary. If it isn't, like when you look at the first element of the array, store the value and the index. 
            if diff not in h:
                h[val] = idx
        # If the difference exists in your dictionary, great! Return a list of the index matching the value and your current index.
            else:
                return [h[diff], idx]

        # Don't forget to talk about the time and space complexity.
        # Time complexity: O(n). In the worst case scenario, you have to traverse the entire length of the array to find the two sum.
        # Space complexity: O(n). Similarly, if you have to traverse the entire length of the array, that means you're continuing to increase the size of your dictionary.
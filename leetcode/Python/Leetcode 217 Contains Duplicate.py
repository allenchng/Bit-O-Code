import collections

class Solution:
    def containsDuplicate(self, A):

        # Broad overview - There are multiple ways of solving this question. Since we're on the discussion of hash maps / dictionaries, I'll show that solution. The solution is straightforward. 

        # What's default dictionary? Default dictionary automatically initializes a key for you. You might say it does the process for you ... by default.
        d = collections.defaultdict(int)

        # For each value in A, lookup if that value exists in the dictionary. If it doesn't, set the value to 1, otherwise increase the value by 1. 
        for i in A:
            d[i] += 1

        # Do a check to see if value is > 1. If so, then you have a duplicate
            if d[i] > 1:
                return True

        # If you make it to the end, then there's no duplicates. 
        return False

        # Time complexity: O(n). The time complexity here is linear because the worst case scenario is that the duplicate is the last element of the array and all previous elements are unique. 
        # Space complexity: O(n). The space complexity here is linear because the worst case scenario is that the duplicate is the last element of the array and all previous elements are unique, requiring you to store them in your dictionary.
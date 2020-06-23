class Solution(object):
    def isMonotonic(self, A):
        """
        :type A: List[int]
        :rtype: bool
        """
        
        # set priors on whether array is increasing or decreasing
        # iterate through array, changing priors based on evidence
        # if at any point an array is both increasing and decreasing, then not monotonic
        # else if you get to the end, must be monotonic
        
        # Broad overview - One way to think about this problem is to consider it from the Bayesian perspective. Assume that the arrays are neither increasing nor decreasing before you see any numbers. As you observe pairs of numbers, update your variables to account for the new evidence.

        # Set your prior variables
        increasing = False
        decreasing = False

        # Saving the length of the array makes writing the next step a bit cleaner is all
        n = len(A)
        
        # Next I'll iterate through our array. I start with the 1st index and compare it to the 0th index to check if it's increasing or decreasing. Importantly, if the values are the same, there's no need to change the priors. I'll check and update priors at each step.
        for i in range(1,n):
            if A[i-1] > A[i]:
                decreasing = True
            if A[i-1] < A[i]:
                increasing = True
        
        # An array can't be monotonic if it's increasing and decreasing! This is a pythonic way of checking if both decreasing and increasing are true. If so, it's not monotonic.
            if decreasing and increasing:
                return False
        
        # If you make it to the end of the array, then your array must be monotonic.
        return True

        # Time complexity: O(n). The worst case scenario here is that the last element violates the monotonic pattern. Hence a linear time complexity.
        # Space complexity: O(1). I update a variable at each step, so the time complexity is constant. 
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
        
        increasing = False
        decreasing = False
        
        n = len(A)
        
        for i in range(1,n):
            if A[i-1] > A[i]:
                decreasing = True
            if A[i-1] < A[i]:
                increasing = True
                
            if decreasing and increasing:
                return False
        return True
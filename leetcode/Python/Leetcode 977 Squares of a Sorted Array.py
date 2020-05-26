class Solution(object):
    def sortedSquares(self, A):
        """
        :type A: List[int]
        :rtype: List[int]
        """
        
        # two pointers, one on each side
        # 

        i = 0
        j = len(A) - 1
        res = []

        while i <= j:
            if A[j]**2 > A[i]**2:
                res.append(A[j]**2)
                j -= 1
            else:
                res.append(A[i]**2)
                i += 1
        return res[::-1]

        
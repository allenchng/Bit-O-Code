class Solution(object):
    def longestPalindrome(self, s):
        """
        :type s: str
        :rtype: str
        """
        
        # consider "even" and "odd" palindromes
        # start at center and expand outwards until no longer palindrome
        # loop through array, saving max palindrome at each step
        
        p = ""
        
        for i in range(len(s)):            
            even = self.isPalindrome(s, i, i+1)
            odd = self.isPalindrome(s, i, i)

            p = max((p, even, odd), key = lambda x: len(x))
        
        
        return p
    
    def isPalindrome(self, s, l, r):
        
        # keep expanding ends until break
        # update counters at each step
        
        while l >= 0 and r < len(s) and s[l] == s[r]:
            l -= 1
            r += 1
        
        return s[l+1:r]
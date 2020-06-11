class Solution(object):
    def countSubstrings(self, s):
        """
        :type s: str
        :rtype: int
        """
        

        # single letters are always a palindrome (including same letters diff index)
        # same consecutives letters in a row are also palindromes (aa, aaa, aaaa)
        # for all other cases, do expansion. add to count if values same
        
        count = 0
        n = len(s)
        
        for i in range(n):
            count += 1
            left = i -1
            right = i + 1
            
            while right < n and s[right] == s[i]:
                count += 1
                right += 1
                
            while left >= 0 and right < n and s[left] == s[right]:
                count += 1
                left -= 1
                right += 1
        
        return count
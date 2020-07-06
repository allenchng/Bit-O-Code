class Solution(object):
    def isPalindrome(self, s):
        """
        :type s: str
        :rtype: bool
        """
        
        # It's important to remember what a palindrom is in order to solve this problem. A palidrome is a string that is the same if it is reversed. One way to solve this problem then, is to have two pointers on each end of the string and iterate them towards each other. If they ever cross, then you know you a valid palindrome. 
        
        i = 0 
        j = len(s) - 1
        
        while i < j:

            # an empty string is still a palindrome!
            if len(s) == 0:
                return True

            # skip spaces and punctuation marks!
            while i < j and not s[i].isalnum():
                i += 1
                
            while i < j and not s[j].isalnum():
                j -= 1
            
            if s[i].lower() != s[j].lower():
                return False
                
            i += 1
            j -= 1
        
        return True

        # Time complexity: O(n), technically I have to iterate over at least half of the string to determine a palindrome. n/2 though still simplifies to linear. 
        # Space complexity: O(1), I update a counter at each step. 
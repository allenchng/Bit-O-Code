class Solution(object):
    def addStrings(self, num1, num2):
        """
        :type num1: str
        :type num2: str
        :rtype: str
        """
        
        # 99
        #  2
       # 101
    
        # start from right to left
        # whenever your sum is greater than 10, need to carry over to next place
        # keep the remainder
        # append to a string, from left to right
        # don't forget to reverse at the end
        # don't forget to decrement pointer
        
        i = len(num1) - 1
        j = len(num2) - 1
        
        res = ""
        carry = 0
        
        while i >= 0 or j >= 0 or carry > 0:
            if i >= 0:
                carry += int(num1[i])
                
                i -= 1
            
            if j >= 0:
                carry += int(num2[j])
                
                j -= 1
            
            res += str(carry % 10)
            
            carry //= 10
            
        return res[::-1]
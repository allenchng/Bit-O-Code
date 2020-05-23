class Solution(object):
    def addBinary(self, a, b):
        """
        :type a: str
        :type b: str
        :rtype: str
        """

      # 99
      #  2
     # 101


        i = len(a) - 1
        j = len(b) - 1
        
        res = ""
        carry = 0
        
        while i >= 0 or j >= 0 or carry > 0:
            if i >= 0:
                carry += int(a[i])
                i -= 1

            if j >= 0:
                carry += int(b[j])
                j -= 1
            
            res = str(carry % 2) + res
            
            carry //= 2
 
        return res
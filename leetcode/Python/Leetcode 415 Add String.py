class Solution(object):
    def addStrings(self, num1, num2):
        """
        :type num1: str
        :type num2: str
        :rtype: str
        """

      # In this problem, I assume that I can't convert the entire string to numbers, but can convert individual elements to int. The way to approach this problem is to think about how we naturally solve addition. First we align the numbers based on the place, add the two numbers, then "carry" the remainder. You'll build on some of the foundational tools you developed last week and use points for this problem
        
        # 99
        #  2
       # 101

       
      # To "align" numbers, I'll use pointers. I'm going to start on the right most side and move my way "left" by decreasing the pointer. I also create a placeholder variable for my end result and a placeholder to carry sums that are greater than 9. 
        
        i = len(num1) - 1
        j = len(num2) - 1
        res = ""
        carry = 0
        
      # I keep iterating until one of my numbers runs out of places. I use carry to keep track of the sum and decrement my pointer after each iteration. 

        while i >= 0 or j >= 0:
            if i >= 0:
                carry += int(num1[i])
                i -= 1
            
            if j >= 0:
                carry += int(num2[j])
                j -= 1

      # After adding the two digits, I use the modulo operator to return the remainder between the sum of the digits (carry) and 10. If my sum is 10 or more, I also need to carry over the value to my next sum. I use the floor division operator to determine what value gets passed forward. 

            res += str(carry % 10)
            
            carry = carry // 10

      # Once the loop breaks, you can still have a value for carry! Don't forget to append it to the string.

        if carry:
            res += str(carry)

      # One last thing to remember. I appended my results from left to right as I iterated through the arrays. I need to reverse the string to return the correct answer.  
        return res[::-1]
      
      # Time complexity: O(m + n) where m is the length of nums1 and n is the length of nums 2. This functionally can be simplified as O(n) for linear time since I have to walk through each element of the string. 
      # Space complexity: O(n). The length of the string increases with the length of the numbers I'm adding together.
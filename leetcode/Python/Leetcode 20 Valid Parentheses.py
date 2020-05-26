class Solution(object):
    def isValid(self, s):
        """
        :type s: str
        :rtype: bool
        """
    
    # going to need a paired dictionary and empty stack to start
    # whenever you see a left hand paren, append the corresponding char onto a stack
    # when you see a right had paren, pop from stack and compare
    # if not the same, violation
    # else just continue forward until the end
        
        d = {"{": "}", "(":")", "[":"]"}
        a = []
        
        for c in s:
            if c in d:
                a.append(d[c])
            else:
                if len(a) == 0 or c != a.pop():
                    return False
        return not a
class Solution(object):
    def isValid(self, s):
        """
        :type s: str
        :rtype: bool
        """
        stack = []
        pairs = {"{": "}", "(":")", "[":"]"}

        for i in s:
            if i in pairs:
                stack.append(pairs[i])

        else:
            if len(stack)==0 or stack.pop() != i:
                return False
        return not stack
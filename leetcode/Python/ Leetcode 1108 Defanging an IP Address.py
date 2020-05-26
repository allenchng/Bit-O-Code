class Solution(object):
    def defangIPaddr(self, address):
        """
        :type address: str
        :rtype: str
        """
        
        # loop through string
        # if = "." or is not alphanum, append [.]
        # don't forget to continue, otherwise you'll append "." again
        res = ""
        
        for c in address:
            if c == ".":
                res += "[.]"
                continue
            res += str(c)
        
        return res
            
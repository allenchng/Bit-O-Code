class Solution(object):
    def isAnagram(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        # list or hash map
        # do a look up and remove
        # emtpy hash or list = True anagaram, else false
        

        dict_s = {}
        dict_t = {}
        
        for i in s:
            dict_s[i] = dict_s.get(i, 0) + 1
        for i in t:
            dict_t[i] = dict_t.get(i, 0) + 1
            
        return dict_s == dict_t
# or 

class Solution(object):
    def isAnagram(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        
        if len(s) != len(t):
            return False
        
        hs = collections.Counter(s)
        ht = collections.Counter(t)
        
        return hs == ht
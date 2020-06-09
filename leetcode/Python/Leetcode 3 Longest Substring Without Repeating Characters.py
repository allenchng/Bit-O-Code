class Solution(object):
    def lengthOfLongestSubstring(self, s):
        """
        :type s: str
        :rtype: int
        """
        
        # take a sliding window approach
        # use two pointers. right pointer (j_ expands the window)
        # if element not in set, add and iterate right pointer
        # otherwise remove current elemnt and update left pointer
        
        
        i = 0
        j = 0
        max_len = 0
        h = set()
        
        while j < len(s):
            if s[j] not in h:
                h.add(s[j])
                max_len = max(max_len, len(h))
                j += 1
            else: 
                h.remove(s[i])
                i += 1
        return max_len
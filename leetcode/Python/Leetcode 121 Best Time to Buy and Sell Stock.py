class Solution(object):
    def maxProfit(self, prices):
        """
        :type prices: List[int]
        :rtype: int
        """
        
        # Broad overview - You want to keep track of two things in this problem. First, the lowest stock price, because subtracting the lowest price will always yield higher numbers. Second, the current max profit. So at each iteration, I'll recalculate the minimum price and maximum value. 
        
        # Set some initial variables. Setting float('inf') is just a trick to guarentee that the first time you check the minimum that you will return the first element of the array. You could do a similar thing for max_profit, but 0 is functionally the same.
        min_price = float('inf')
        max_profit = 0
        
        # Iterate through each value of the array. Check if the new price is a minimum and set as new min_price if so. Check to see if the difference between the current value and the min price is greater than the previous max profit.
        for i in prices:
            min_price = min(min_price, i)
            diff = i - min_price
            max_profit = max(max_profit, diff)
            
        return max_profit
        
        # Time complexity: O(n). You have to iterate through every value of the array so this is linear time. 
        # Space complexity: O(1). You are only modifying two variables in place, so the space complexity is constant.
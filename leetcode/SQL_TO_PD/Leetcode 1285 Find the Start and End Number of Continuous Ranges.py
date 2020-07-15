import pandas as pd
import numpy as np
import datetime

Logs = pd.DataFrame(
    {
        'log_id': [1, 2, 3, 7, 8, 10]
    }
)

Logs['row_number'] = Logs.log_id.rank(ascending=True)
Logs['diff'] = Logs.log_id - Logs.row_number

start_id = Logs.groupby(['diff']).log_id.min().reset_index()[['log_id']]
end_id = Logs.groupby(['diff']).log_id.max().reset_index()[['log_id']]

start_id.columns = ['start_id']
end_id.columns = ['end_id']

pd.concat([start_id, end_id], axis = 1)
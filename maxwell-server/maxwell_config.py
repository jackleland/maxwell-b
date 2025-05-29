""" Configuration file for Maxwell.

    Holds constants and such...
"""

import os

path = os.environ["MAXWELL_SERVER_FILES"]
log_level = os.environ.get("MAXWELL_LOG_LEVEL", "INFO").upper()

if not os.path.exists(path):
    os.makedirs(path)

def list_requests():
    return [f for f in os.listdir(path) \
                if f[-len('.request'):] == '.request']

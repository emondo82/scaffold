import os
from functools import wraps

def on_new_commit(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        # Checks if commit hash changed
        if cache.get_commit() != os.getenv("GITHUB_SHA"):  
            func(*args, **kwargs) 

    return wrapper

@on_new_commit
def deploy_app(*args):
   print("Deploying application")

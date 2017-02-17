from IPython.terminal.prompts import Prompts, Token
from IPython import get_ipython
import os
import sys

class MyPrompt(Prompts):
     def in_prompt_tokens(self, cli=None):
         path = os.getcwd()
         homedir = '/afs/mpa/home/georgsto/'
         if path == homedir:
             path = path.replace(homedir,'~/')
         elif path == '/':
             path = '/'
         else:
             path = os.getcwd().split('/')[-1]
             path = '.../' + path
         return [(Token.Prompt, path),
                 (Token.Prompt, ' > ')]

ip = get_ipython()
ip.prompts = MyPrompt(ip)
_path = sys.path[:]
_path = sorted(_path, key = lambda x: 0 if 'georgsto' in x else 1)
sys.path = _path[:]

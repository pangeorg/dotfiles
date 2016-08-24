import sys
def fprint(*args, **kwargs):
    sargs = ' '.join([str(a)for a in args])
    skwargs = ' '.join([k +': ' + str(v) for k, v in kwargs.iteritems()])
    what = ' '.join([sargs, skwargs])
    sys.stdout.write('\r ' + sargs)
    sys.stdout.flush()

def _sys_add():
    import cPickle as cp
    import os

    def diff(a, b):
        b = set(b)
        return [aa for aa in a if aa not in b]

    pdir =  os.path.dirname(os.path.realpath(__file__))
    with open(pdir + '/path', 'r') as f:
        new_path = cp.load(f)
    old_path = sys.path

    path_diff = diff(new_path, old_path)
    for f in path_diff:
        sys.path.append(f)

# _sys_add()

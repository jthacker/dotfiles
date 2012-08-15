import collections, itertools
import cPickle as pickle
import numpy as np
from redis import Redis
from decorator import decorator
from UserDict import DictMixin
from hashlib import sha1

class Cache(DictMixin):
    def __init__(self):
        self._redis = Redis()

    def __contains__(self, key):
        return key in self._redis

    def __getitem__(self, key):
        '''According to the doc for __getitem__, if a key is missing then
        a KeyError should be raised.'''
        print "CACHE GET: key=%s" % str(key)
        val = self._redis.get(key)
        if not val:
            raise KeyError(key)
        return pickle.loads(val) if val else None

    def __setitem__(self, key, item):
        print "CACHE SET: key=%s" % str(key)
        self._redis.set(key, pickle.dumps(item, pickle.HIGHEST_PROTOCOL))

    def __delitem__(self, key):
        '''According to the doc for __delitem__, if the key missing then
        a KeyError should be raised'''
        self._redis.delete(key)

    def keys(self):
        return self._redis.keys()


DictProxyType = type(object.__dict__)

def make_hash(o):
    """
    Makes a hash from a dictionary, list, tuple or set to any level, that 
    contains only other hashable types (including any lists, tuples, sets, and
    dictionaries). In the case where other kinds of objects (like classes) need 
    to be hashed, pass in a collection of object attributes that are pertinent. 
    For example, a class can be hashed in this fashion:
  
    make_hash([cls.__dict__, cls.__name__])

    A function can be hashed like so:

    make_hash([fn.__dict__, fn.__code__])
    """
    
    if type(o) == DictProxyType:
        o2 = {}
        for k, v in o.items():
            if not k.startswith("__"):
                o2[k] = v
        o = o2

    if isinstance(o, set) or isinstance(o, tuple) or isinstance(o, list):
        return tuple([make_hash(e) for e in o])

    if isinstance(o, np.ndarray):
        return sha1(o).hexdigest()
        
    if not isinstance(o, dict):
        return hash(o)

    for k, v in o.items():
        o[k] = make_hash(v)

    return hash(tuple(frozenset(o.items())))  

    
_cache = Cache()

@decorator
def persistedcache(func, *args, **kw):
    keyHash = sha1(str(map(make_hash, (func.func_code, args, kw)))).hexdigest()
    key = "%s:%s" % (func.func_name,keyHash)

    if key in _cache:
        return _cache[key]
    else:
        _cache[key] = result = func(*args, **kw)
        return result



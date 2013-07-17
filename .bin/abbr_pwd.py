#! /usr/bin/env python
def abbreviatedPWD(currentDir = '.', abbreviateLength=20):
    import re,os
    homeDir = os.path.expanduser('~')
    currentDir = os.path.abspath(currentDir)
    #Check for home directory abbreviation, if found, will replace with '~'
    p = re.compile(r'(^%s)(.*$)' % homeDir)
    homeMatch = p.match(currentDir)
    output = ''

    if homeMatch:
        output = '~'
        dir = homeMatch.group(2).strip('/')
        if len(dir) == 0:
            return output
        else:
            dir = dir.split('/')
    else:
        dir = currentDir.strip('/').split('/')

    if len("".join(dir)) > abbreviateLength and len(dir) > 3:
        output += '/%s/.../%s/%s' % (dir[0], dir[-2], dir[-1])
    elif len(dir) > 0:
        output += '/' + '/'.join(dir)
    
    return output

if __name__ == '__main__':
    try:
        print(abbreviatedPWD())
    except (KeyboardInterrupt, SystemExit):
        print("")
    except:
        print('?')

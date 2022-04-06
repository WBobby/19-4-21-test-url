#!/usr/bin/python
import re


def _read_file(file_name):
    _result = []
    with open(file_name, 'r') as fl:
        for _line in fl:
            if not re.match(r"^#.*", _line) and _line.rstrip():
                _result.append(_line.rstrip())
    return _result

def _split_str_list(_list):
    return [item.rsplit(':', maxsplit=1) for item in _list]

def _get_version(_string, _pytorch_vers):
    _release = 'release-'
    _staging = 'internal_testing'
    if _release in _string:
        _ver = _string.split(_release)[-1].split('_')[0]
#        print("verion:", _ver, len(_ver))
        if not re.match(r'[0-9]+.[0-9]+(.[0-9]+)?', _ver):
            raise ValueError(f"The version number is NOT correct...")
        _ver_pytorch = ""
        for ix in range(len(_pytorch_vers)):
            if _ver in _pytorch_vers[ix]:
                _ver_pytorch = re.sub(r'[a-z]+[0-9]\+\D+.*|\+[a-z|0-9]+', 
                                      r'', _pytorch_vers[ix])
                return _ver_pytorch
    if _staging in _string:
        _ver = 'staging'
        return _ver

def _retag_to_public_docker(_split_list, _pytorch_vers, prefix='rocm/pytorch', delim='pytorch'):
    _result = {}
    for item in _split_list:
        if len(item) != 2:
            raise ValueError(f"The format of {item} is NOT correct...")
        _temp = []
        front_tag, tail_tag = item[1].split(delim)
        _temp.append(prefix + ':' + front_tag + delim)
        _ver = _get_version(tail_tag, _pytorch_vers)
        _temp.append('_' + _ver)
        _result[''.join(item)] = ''.join(_temp)
    return _result 

# Check before running it
def _final_fix(_dict):
    _result = {}
    for k, v in _dict.items():
        if 'centos' in v:
            print(k, v)
            break
            _result[k] = re.sub(r'centos7.[0-9]+.[0-9]+', 
                                r'centos7', v)
#        elif '1.8' in item:
#            _result.append(re.sub(r'1.8', r'1.8.1', item))
        else:
            _result[k] = v
    return _result


#_lst = _read_file('list.conf')
#print(_lst, len(_lst))
if __name__ == '__main__':
    LIST_NAME = _read_file('list.conf')
    PYTORCH_REAL_VER = _read_file('pytorch.ver')

    SPLIT_STR_LIST = _split_str_list(LIST_NAME)
    FINAL_RESULT = _retag_to_public_docker(SPLIT_STR_LIST, PYTORCH_REAL_VER)
    print(FINAL_RESULT, len(FINAL_RESULT))
    FINAL_RESULT = _final_fix(FINAL_RESULT)
    for k, v in FINAL_RESULT:
        print(f"docker tag {k} {v}")


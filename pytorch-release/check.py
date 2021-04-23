#!/opt/conda/bin/python

try:
    import torch
except ImportError as error:
    print("torch is NOT found...")
print("pytorch is installed...")

try:
    import apex
except ImportError as error:
    print("apex is NOT found...")
print("apex is installed...")

try:
    import torchvision
except ImportError as error:
    print("torchvision is NOT found...")
print("torchvision is installed...")

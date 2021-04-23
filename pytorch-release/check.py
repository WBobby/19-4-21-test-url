#!/opt/conda/bin/python

try:
    import torch
    print("pytorch is installed...")
except ImportError as error:
    print("torch is NOT found...")

try:
    import apex
    print("apex is installed...")
except ImportError as error:
    print("apex is NOT found...")

try:
    import torchvision
    print("torchvision is installed...")
except ImportError as error:
    print("torchvision is NOT found...")

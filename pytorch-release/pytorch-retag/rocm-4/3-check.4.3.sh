#!/bin/bash

# pytorch_images=(
#         "rocm/pytorch:rocm4.3_centos7_py3.6_pytorch" 
#         "rocm4.3_ubuntu18.04_py3.6_pytorch"
#         "rocm/pytorch:rocm4.3_ubuntu18.04_py3.6_pytorch_1.7.0"
#         "rocm/pytorch:rocm4.3_ubuntu18.04_py3.6_pytorch_1.8.1"
#         "rocm/pytorch:rocm4.3_ubuntu18.04_py3.6_pytorch_1.9.0"
# )

function pause(){
   read -p "$*"
}

cd ..

echo ""
echo ""
echo "checking rocm/pytorch:rocm4.3_centos7_py3.6_pytorch"
echo ""
echo ""
bash run.sh rocm/pytorch:rocm4.3_centos7_py3.6_pytorch
pause 'Press [Enter] key to continue...'


echo ""
echo ""
echo "checking rocm/pytorch:rocm4.3_ubuntu18.04_py3.6_pytorch"
echo ""
echo ""
bash run.sh rocm/pytorch:rocm4.3_ubuntu18.04_py3.6_pytorch
pause 'Press [Enter] key to continue...'


echo ""
echo ""
echo "checking rocm/pytorch:rocm4.3_ubuntu18.04_py3.6_pytorch_1.7.0"
echo ""
echo ""
bash run.sh rocm/pytorch:rocm4.3_ubuntu18.04_py3.6_pytorch_1.7.0
pause 'Press [Enter] key to continue...'


echo ""
echo ""
echo "checking rocm/pytorch:rocm4.3_ubuntu18.04_py3.6_pytorch_1.8.1"
echo ""
echo ""
bash run.sh rocm/pytorch:rocm4.3_ubuntu18.04_py3.6_pytorch_1.8.1
pause 'Press [Enter] key to continue...'

echo ""
echo ""
echo "checking rocm/pytorch:rocm4.3_ubuntu18.04_py3.6_pytorch_1.9.0"
echo ""
echo ""
bash run.sh rocm/pytorch:rocm4.3_ubuntu18.04_py3.6_pytorch_1.9.0
pause 'Press [Enter] key to continue...'

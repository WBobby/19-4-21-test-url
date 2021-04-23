CURRENT_FOLDER=/var/lib/jenkins

CURT_DOCKER_OS=$(. /etc/os-release && echo "$ID")
CURT_DOCKER_OS_VER=$(. /etc/os-release && echo "$VERSION_ID")
#FW_NAME=$(echo $BUILD_ENVIRONMENT | cut -d "-" -f 1)
TEMP=$(ls)
if [[ "$TEMP" =~ ^caffe2 ]];
then
    FW_NAME=caffe2
fi
if [[ "$TEMP" =~ ^pytorch ]];
then
    FW_NAME=pytorch
fi
FW_BRANCH=$(cd $CURRENT_FOLDER/$FW_NAME; git branch; cd ..)

if [ "$CURT_DOCKER_OS" = "ubuntu" ];
then
    echo "=========================================================="
    echo "GENERAL CHECK"
    echo "=========================================================="
    echo "Current OS: $CURT_DOCKER_OS    Version: $CURT_DOCKER_OS_VER"
    rocm_pkg_version=$(dpkg -s rocm-dev | grep "Version")
    echo "Current ROCm Version: $rocm_pkg_version"
    echo "Current FW Name: $FW_NAME"
    echo "Current FW Branch: $FW_BRANCH"
    echo "=========================================================="
fi

if [ "$CURT_DOCKER_OS" = "centos" ];
then
    echo "=========================================================="
    echo "GENERAL CHECK"
    echo "=========================================================="
    echo "Current OS: $CURT_DOCKER_OS    Version: $CURT_DOCKER_OS_VER"

    rocm_pkg_version=$(rpm -q rocm-dev)
    echo "Current ROCm Version: $rocm_pkg_version"
    echo "Current FW Name: $FW_NAME"
    echo "Current FW Branch: $FW_BRANCH"
    echo "=========================================================="
fi

echo "=========================================================="
echo "APEX/TORCHVISION CHECK"
echo "=========================================================="
python check.py
echo "=========================================================="

echo "=========================================================="
echo "MPI CHECK"
echo "=========================================================="
mpirun --allow-run-as-root --use-hwthread-cpus -n 16 hostname
echo "=========================================================="

echo "=========================================================="
echo "NON-ROOT USER AND MPI CHECK"
echo "=========================================================="
useradd -m bobby || true
sudo -H -u bobby env "PATH=$PATH" bash -c 'id; cd /var/lib/jenkins; pwd; cd test; ./check.py; /opt/ompi/bin/mpirun --allow-run-as-root --use-hwthread-cpus -n 16 hostname'
echo "=========================================================="

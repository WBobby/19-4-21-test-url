# set -x

CURRENT_FOLDER=/var/lib/jenkins

CURT_DOCKER_OS=$(. /etc/os-release && echo "$ID")
CURT_DOCKER_OS_VER=$(. /etc/os-release && echo "$VERSION_ID")
#FW_NAME=$(echo $BUILD_ENVIRONMENT | cut -d "-" -f 1)
TEMP=$(ls $CURRENT_FOLDER)
MPI_THREAD=4

echo "TEMP=$TEMP"
if [[ "$TEMP" =~ caffe2 ]];
then
    FW_NAME=caffe2
fi
if [[ "$TEMP" =~ pytorch ]];
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
    cat /etc/apt/sources.list.d/rocm.list
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
    cat /etc/yum.repos.d/rocm.repo
    echo "=========================================================="
fi

echo "=========================================================="
echo "APEX/TORCHVISION CHECK"
echo "=========================================================="
python $CURRENT_FOLDER/test/check.py
echo ""
pip show apex || true
echo ""
pip show torchvision || true
echo "=========================================================="

echo "=========================================================="
echo "GPU ARCH CHECK"
echo "=========================================================="
roc-obj-ls -v /opt/conda/lib/python3.6/site-packages/torch/lib/libtorch_hip.so | grep gfx || true
echo "=========================================================="
echo "=========================================================="
echo "GPU check magma"
echo "=========================================================="
roc-obj-ls -v /opt/rocm/magma/lib/libmagma.so | grep gfx || true
echo "=========================================================="
echo "=========================================================="
echo "UCX CHECK"
echo "=========================================================="
ucx_info -v || true
echo "=========================================================="

echo "=========================================================="
echo "MPI CHECK"
echo "=========================================================="
mpirun --version
echo "=========================================================="
mpirun --allow-run-as-root --use-hwthread-cpus -n ${MPI_THREAD} hostname
echo "=========================================================="

echo "=========================================================="
echo "OFED CHECK"    fix at 5.3-1.0.5.0
echo "=========================================================="
dpkg -l | grep ibverbs-providers || true
echo "=========================================================="

echo "=========================================================="
echo "NON-ROOT USER AND MPI CHECK"
echo "=========================================================="
useradd -m bobby || true
sudo -H -u bobby env "PATH=$PATH" "MPI_THREAD=${MPI_THREAD}" bash -c 'id; /var/lib/jenkins/test/check.py; /opt/ompi/bin/mpirun --allow-run-as-root --use-hwthread-cpus -n ${MPI_THREAD} hostname'
echo "=========================================================="

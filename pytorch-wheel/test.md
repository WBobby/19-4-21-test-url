### Test wheel files:
1. push wheel files:
```bash
curl -i -X PUT -H X-JFrog-Art-Api:AKCp5btVXwoUVMCP1yFLjU7y7zw7PkwvV3KrD5PGYtw1ZH8QgkDJdEqbitKLkjJT3Cdcw7nhR     http://compute-artifactory.amd.com/artifactory/compute-pytorch-rocm/test/5.2.3/ -T {$(echo ${PWD}/*.whl | sed 's/  */,/g')}
```
2. docker command to start test docker:
```bash
   sudo docker run \
      --rm -it  -v $PWD:/root/whl   \
      --shm-size 8G     --cap-add=SYS_PTRACE     \
      --privileged     --security-opt seccomp=unconfined     \
      --network=host     --device=/dev/kfd     --device=/dev/dri     \
      --group-add video     -v $HOME/dockerx:/dockerx \
      compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:ub20-py3.7-test bash
```
3. install torch torchvision in the docker:
```bash
pip3 install --verbose --use-deprecated=legacy-resolver torch==1.12.1 torchvision==0.13.1 -f http://compute-artifactory.amd.com/artifactory/list/compute-pytorch-rocm/release/5.2.3/ --trusted-host compute-artifactory.amd.com
```
4. run micro-benchmarking test:
```bash
Steps to run the benchmark
git clone https://github.com/pytorch/vision.git
cd vision
PYTORCH_ROCM_ARCH=gfx1030 python3.6 setup.py install
cd ~ && git clone https://github.com/ROCmSoftwarePlatform/pytorch-micro-benchmarking.git
python3 micro_benchmarking_pytorch.py --network resnext101  --batch-size 32  --iterations 100
```


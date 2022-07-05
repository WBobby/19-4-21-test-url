# retag docker images:
docker push \ 
    wangyanyao/work:rocm5.0_centos7_py3.7_pytorch_staging
docker push \
    wangyanyao/work:rocm5.0_ubuntu18.04_py3.7_pytorch_staging
# release/1.8_atomicAddNoReturn branch:
docker push \
    wangyanyao/work:rocm5.0_ubuntu18.04_py3.7_pytorch_1.8.1
# release/1.9_atomicAddNoReturn branch:
docker push \
    wangyanyao/work:rocm5.0_ubuntu18.04_py3.7_pytorch_1.9.0
#release/1.10 branch:
docker push \
    wangyanyao/work:rocm5.0_ubuntu18.04_py3.7_pytorch_1.10.0_base
docker push \
    wangyanyao/work:rocm5.0_ubuntu18.04_py3.7_pytorch_1.10.0

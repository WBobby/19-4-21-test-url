docker run --rm -v $PWD:/var/lib/jenkins/test -v $PWD/bin:/root/bin $1 bash -c "cd /var/lib/jenkins/test; bash test.sh"
#docker run --rm -v $PWD:/var/lib/jenkins/test $1 bash -c "cd test; bash test.sh"

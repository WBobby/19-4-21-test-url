docker run --rm -v $PWD:/var/lib/jenkins/test $1 bash -c "cd /var/lib/jenkins/test; bash test.sh"

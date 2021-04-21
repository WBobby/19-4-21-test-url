CURRENT_FOLDER=/var/lib/jenkins

python check.py

mpirun --allow-run-as-root --use-hwthread-cpus -n 16 hostname

useradd -m bobby || true

sudo -H -u bobby bash -c 'id; cd /var/lib/jenkins; pwd; cd test; ./check.py; /opt/ompi/bin/mpirun --allow-run-as-root --use-hwthread-cpus -n 16 hostname'


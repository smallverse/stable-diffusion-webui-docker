#!/bin/bash
echo "try to stop the process"
./stop.sh

################################################################
echo "try to start the process"

#nohup /bin/bash docker-compose-publish-no-root.sh > /dev/null 2>&1 &
nohup /bin/bash docker-compose-publish-no-root.sh > docker-compose-publish-no-root.log 2>&1 &

echo "current process id is "$$
echo $! > tpid

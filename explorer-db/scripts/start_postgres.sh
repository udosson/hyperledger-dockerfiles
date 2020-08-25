
# Sets new /etc/passwd file with indy user
# export USER_ID=$(id -u)
# export GROUP_ID=$(id -g)
# envsubst < /tmp/passwd.template > /tmp/passwd
# export LD_PRELOAD=/usr/lib/libnss_wrapper.so
# export NSS_WRAPPER_PASSWD=/tmp/passwd
# export NSS_WRAPPER_GROUP=/etc/group
# echo "Postgres container prepared to run as user postgres"



echo "postgres:x:$(id -u):$(id -g):,,,:/var/lib/postgresql:/bin/sh" >> /etc/passwd
# echo "postgres:x:$(id -G | cut -d' ' -f 2)" >> /etc/group

# Start postgres
postgres
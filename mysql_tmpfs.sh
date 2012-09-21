# MySQL Service

#description     "MySQL Server"
#author          "Mario Limonciello>"

#start on (net-device-up
#          and local-filesystems
#	  and runlevel [2345])
#stop on runlevel [016]

respawn

env HOME=/etc/mysql
umask 007

# The default of 5 seconds is too low for mysql which needs to flush buffers
kill timeout 300

pre-start script
    #Sanity checks
    [ -r $HOME/my.cnf ]
    [ -d /var/run/mysqld ] || install -m 755 -o mysql -g root -d /var/run/mysqld
    /lib/init/apparmor-profile-load usr.sbin.mysqld
    LC_ALL=C BLOCKSIZE= df --portability /var/lib/mysql/. | tail -n 1 | awk '{ exit ($4<4096) }'

    # Create ramdisk and sync content.
    mount -t tmpfs -o rw,nosuid,nodev,noexec,uid=`id -u mysql`,gid=`id -g mysql` tmpfs /var/lib/mysql
    cp -r /var/lib/.mysql/* /var/lib/mysql
    chown mysql:mysql -R /var/lib/mysql
end script

exec /usr/sbin/mysqld

post-start script
   for i in `seq 1 30` ; do
        /usr/bin/mysqladmin --defaults-file="${HOME}"/debian.cnf ping && {
            exec "${HOME}"/debian-start
            # should not reach this line
            exit 2
        }
        sleep 1
    done
    exit 1
end script

post-stop script
    # Save ramdisk content.
    rsync -a --delete /var/lib/mysql/ /var/lib/.mysql
    umount /var/lib/mysql/
end script


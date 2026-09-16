#!/bin/sh

echo "Giving ElasticSearch time to start..."
sleep 10
until curl -sS "http://$ES_HOST:$ES_PORT/_cluster/health?wait_for_status=yellow"
do
    echo "Waiting for ES to start"
    sleep 1
done
echo
#Configure Arkime to Run
if [ ! -f /data/configured ]; then
	touch /data/configured
	/opt/arkime/bin/Configure
fi
#Give option to init ElasticSearch
if [ "$INITIALIZEDB" = "true" ] ; then
	echo INIT | /opt/arkime/db/db.pl http://$ES_HOST:$ES_PORT init
	/opt/arkime/bin/arkime_add_user.sh admin "Admin User" $ARKIME_PASSWORD --admin
fi
#Give option to wipe ElasticSearch
if [ "$WIPEDB" = "true" ]; then
	/data/wipearkime.sh
fi

echo "Look at log files for errors"
echo "  ./arkime/logs/{Instance}.log"
echo "Visit http://127.0.0.1:8005 with your favorite browser."
echo "  user: admin"
echo "  password: $ARKIME_PASSWORD"

if [ "$WISE" = "on" ]
then
    echo "Launch wise..."
    /bin/sh -c 'cd $ARKIMEDIR/wiseService; node wiseService.js >> $ARKIMEDIR/logs/wise.log 2>&1' &
fi

if [ "$CAPTURE" = "on" ]
then
    echo "Launch capture..."
    if [ "$VIEWER" = "on" ]
    then
        # Background execution
	sleep 10
        $ARKIMEDIR/bin/capture >> $ARKIMEDIR/logs/capture.log 2>&1 &
    else
        # If only capture, foreground execution
	sleep 10
        $ARKIMEDIR/bin/capture |tee -a $ARKIMEDIR/logs/capture.log 2>&1
    fi
fi

if [ "$CONT3XT" = "on" ]
then
    echo "Launch cont3xt..."
    /bin/sh -c 'cd $ARKIMEDIR/cont3xt; node cont3xt.js >> $ARKIMEDIR/logs/cont3xt.log 2>&1' &
fi

if [ "$VIEWER" = "on" ]
then
    echo "Launch viewer..."
    sleep 1
    /bin/sh -c 'cd $ARKIMEDIR/viewer; $ARKIMEDIR/bin/node viewer.js -c $ARKIMEDIR/etc/config.ini | tee -a $ARKIMEDIR/logs/viewer.log 2>&1' 
fi 


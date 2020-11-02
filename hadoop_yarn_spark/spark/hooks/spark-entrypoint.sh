#!/bin/bash


for c in `printenv | perl -sne 'print "$1 " if m/^SPARK_CONF_(.+?)=.*/'`; do 
    name=`echo ${c} | perl -pe 's/___/-/g; s/__/_/g; s/_/./g'`
    var="SPARK_CONF_${c}"
    value=${!var}
    echo "Setting SPARK property $name=$value"
    echo $name $value >> $SPARK_HOME/conf/spark-defaults.conf
done 

case $1 in
    master)
        shift
        exec /entrypoint.sh /spark-master.sh $@
        ;;
    slave)
        shift
        exec /entrypoint.sh /spark-slave.sh $@
        ;;
    historyserver)
        shift
        exec /entrypoint.sh /spark-historyserver.sh $@
        ;;
    submit)
        shift
        exec /entrypoint.sh spark-submit $@
        ;;
    *)
        
        if [ "$HADOOP_ON_CLASSPATH" = "1" ]; then
            export CLASSPATH="$(hadoop classpath)${CLASSPATH:+:$CLASSPATH}"
        fi

        if [ "$SPARK_ON_CLASSPATH" = "1" ]; then
            export CLASSPATH="${SPARK_HOME}/jars/*${CLASSPATH:+:$CLASSPATH}"
        fi

        exec /entrypoint.sh $@
        ;;
esac

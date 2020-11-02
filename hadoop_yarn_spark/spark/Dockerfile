FROM uhopper/hadoop:2.8.1

ENV SPARK_VERSION 2.1.2

ENV SPARK_BIN_URL https://www.archive.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-without-hadoop.tgz

ENV SPARK_HOME=/opt/spark-$SPARK_VERSION

RUN set -x \
	&& curl -sL https://archive.apache.org/dist/spark/spark-2.1.2/spark-2.1.2-bin-without-hadoop.tgz | gunzip | tar -x -C /usr/local \
	&& cp -r /usr/local/spark-${SPARK_VERSION}-bin-without-hadoop $SPARK_HOME

WORKDIR $SPARK_HOME
ENV PATH $SPARK_HOME/bin:$PATH

COPY . $SPARK_HOME

RUN chmod a+x \
    hooks/spark-entrypoint.sh \
    spark-historyserver.sh \
    spark-master.sh \
    spark-slave.sh
    
RUN echo "export SPARK_DIST_CLASSPATH=$(hadoop classpath)" >> /opt/spark-$SPARK_VERSION/conf/spark-env.sh

ENTRYPOINT ["hooks/spark-entrypoint.sh"]
FROM apache/airflow:2.7.1-python3.11

USER root

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    gcc \
    python3-dev \
    openjdk-11-jdk \
    procps \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set JAVA_HOME environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# Set PATH environment variable to include JAVA_HOME/bin
ENV PATH="$JAVA_HOME/bin:${PATH}"

USER airflow

# Install Python packages
RUN pip install \
    apache-airflow \
    apache-airflow-providers-apache-spark \
    pyspark

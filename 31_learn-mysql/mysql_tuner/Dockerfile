FROM ubuntu:18.04

RUN apt-get update \
 && apt-get install -yq --no-install-recommends \
        apt-utils \
        curl \
        wget \
        perl \
        perl-doc \
        mysql-client \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Installing MySQL Tuner
RUN set -eux \
    && echo "Downloading MySQL Tuner script ..." \
    && wget --no-check-certificate https://raw.githubusercontent.com/major/MySQLTuner-perl/master/mysqltuner.pl -O /mysqltuner.pl \
    && wget --no-check-certificate https://raw.githubusercontent.com/major/MySQLTuner-perl/master/basic_passwords.txt -O /basic_passwords.txt \
    && wget --no-check-certificate https://raw.githubusercontent.com/major/MySQLTuner-perl/master/vulnerabilities.csv -O /vulnerabilities.csv

ENTRYPOINT ["sh", "-c", "perl mysqltuner.pl --host ${MYSQL_HOST} --user ${MYSQL_USER} --pass ${MYSQL_PASS}"]

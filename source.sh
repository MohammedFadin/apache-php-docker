#!/bin/bash
source /etc/apache2/envvars
/usr/sbin/apache2 -V
/usr/sbin/apache2 -DFOREGROUND

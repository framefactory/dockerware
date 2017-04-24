#!/bin/bash
# UBUNTU SERVER START

# start services
service apache2 start
service mysql start
service ssh start

# keep bash running
tail -f /dev/null
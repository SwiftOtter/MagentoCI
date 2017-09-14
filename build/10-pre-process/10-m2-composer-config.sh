#!/bin/bash

### 10-composer.sh: this file installs the composer dependencies and the base Magento system

logvalue "Setting up Magento 2 Composer Credentials"

if [ -n ${MAGENTO_USERNAME} == 0 ] || [ -z ${MAGENTO_USERNAME+x} ]; then
  composer config -a -g http-basic.repo.magento.com ${MAGENTO_USERNAME} ${MAGENTO_PASSWORD}
fi

#!/bin/bash

### 50-m2-merge.sh: this file copies Magento 2 customizations and files

rsync_cmd="rsync --recursive --copy-links --specials --exclude='.git/' --exclude='.gitignore' --exclude='*README*'"

${rsync_cmd} --exclude='var/' --exclude='*.sample' --exclude='LICENSE.*' ${CHECKOUT_DIR}/. ${BUILD_DIR}/
${rsync_cmd} ${CHECKOUT_DIR}/home/* ${BUILD_DIR}/pub
rm -rf ${BUILD_DIR}/pub/override

if [ -d ${CHECKOUT_DIR}/home/override ]; then
    logvalue "Applying overrides"
    ${rsync_cmd} -v ${CHECKOUT_DIR}/home/override/* ${BUILD_DIR}
fi

mkdir -p ${BUILD_DIR}/scripts
${rsync_cmd} ${SCRIPT_DIR}/. ${BUILD_DIR}/scripts

rm -rf ${BUILD_DIR}/home

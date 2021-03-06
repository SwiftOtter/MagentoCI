#!/bin/bash

### 100-artifact.sh: this file compiles the build/ folder into a .tar.gz artifact

#if [ ! -f ${BUILD_DIR}"/public/skin/frontend/path/to/css" ]; then
#    printf "Gulp did not run as expected. Please investigate." 1>&2
#    printf "BUILD ERROR" 1>&2
#    exit 20
#fi

logvalue "Running artifact builder."

if [[ ${TESTMODE} == 0 ]] || [[ -z ${TESTMODE+x} ]]; then
    rm -rf "${BUILD_DIR}/build/"
    rm -rf "${BUILD_DIR}/pub/static/ub-tool/"

    (
        cd "${BUILD_DIR}"; \
        tar --gzip --create --file "${BASE}/build.tar.gz" .
    )
    
    if [[ -f "${BUILD_FILE}" ]]; then
        printf "BUILD SUCCESS"
    else
        printf "BUILD FAILED. NO ${BUILD_FILE} FOUND." 1>&2
        exit 125
    fi
else 
    logvalue "Test mode active. No artifact generated."
fi

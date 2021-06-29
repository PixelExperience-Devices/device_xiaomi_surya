#!/bin/bash
#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=surya
VENDOR=xiaomi

# Check host-OS before doing anything
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    PLATFORM='linux-x86'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    PLATFORM='darwin-x86'
fi

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

NAD_ROOT="${MY_DIR}"/../../..

HELPER="${NAD_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Use prebuilts from tools-lineage
TOOLS_EXTRAS="$NAD_ROOT"/prebuilts/tools-extras/"$PLATFORM"/bin
PATCHELF="$TOOLS_EXTRAS"/patchelf

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true
SECTION=
KANG=

while [ "$1" != "" ]; do
    case "$1" in
        -n | --no-cleanup )     CLEAN_VENDOR=false
                                ;;
        -k | --kang)            KANG="--kang"
                                ;;
        -s | --section )        shift
                                SECTION="$1"
                                CLEAN_VENDOR=false
                                ;;
        * )                     SRC="$1"
                                ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC=adb
fi

function blob_fixup() {
    case "${1}" in
        system_ext/lib64/libwfdnative.so)
            "${PATCHELF}" --remove-needed "android.hidl.base@1.0.so" "${2}"
            ;;
    esac
}

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${NAD_ROOT}" false "${CLEAN_VENDOR}"

extract "${MY_DIR}/proprietary-files.txt" "${SRC}" ${KANG} --section "${SECTION}"

"${MY_DIR}/setup-makesfiles.sh"

#!/bin/bash
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# name: provisioning-ubuntu.sh
# Author: George Li
#

## Variables -----------------------------------------------------------------
export REPO_URL=${REPO_URL:-"http://www.yongxin.info/projects/captainL"}
export NTP_SERVER=${NTP_SERVER:-"ubuntu.pool.ntp.org"}

if [ -s "/etc/provisioning-URL.sh" ]; then
    source /etc/provisioning-URL.sh
fi

## Functions -----------------------------------------------------------------

LINE='-----------------------------------------------------------------------'

# Output details provided as parameters
function print_info() {
    set +x
    PROC_NAME="- [ $@ ] -"
    printf "\n%s%s\n" "$PROC_NAME" "${LINE:${#PROC_NAME}}"
}

# Output a formatted block around a message
function info_block(){
    set +x
    echo "${LINE}"
    print_info "$@"
    echo "${LINE}"
}

## Main -----------------------------------------------------------------------

# check network connectivity, stop script if no internet access
if ! (curl --silent --head http://www.google.com/  | egrep "20[0-9] Found|30[0-9] Found" >/dev/null) then
   info_block "Internet connection is required to run this script. "
   exit 0
fi

# Remove unused Kernels
dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs apt-get -y purge

# image clean up .
apt-get remove tasksel aptitude -y
apt-get autoremove -y
apt-get clean
rm -f /var/cache/apt/archives/*.deb
rm -f /var/cache/apt/*cache.bin
rm -f /var/lib/apt/lists/*_Packages
rm -rf /usr/src/*

# Job completed, so disable the script
chmod -x ${0}
sed -i '/'"${0##*/}"'/d' /etc/rc.local

# Final message
info_block "System has be reconfigured."
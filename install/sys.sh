#!/usr/bin/env bash
#
# These are projects we're going to install into $HOME/sys

source $HOME/.build/install/functions.sh

__title "sys.sh"

__msg "Installing csi; starting"
ln -s $HOME/projects/csi/bin/csi.pl $HOME/bin/csi
ln -s $HOME/projects/csi/lib/CSI $HOME/lib/
nohup $HOME/bin/csi $HOME/sys/csi > $HOME/logs/csi_logs &

__done "sys.sh"
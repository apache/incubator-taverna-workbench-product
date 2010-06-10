#!/bin/sh

## resolve links - $0 may be a symlink
PRG="$0"
progname=`basename "$0"`
saveddir=`pwd`

# need this to resolve relative symlinks
cd "`dirname "$PRG"`"
while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '.*/.*' > /dev/null; then
        PRG="$link"
    else
        PRG=`dirname "$PRG"`"/$link"
    fi
done

# 300 MB memory, 140 MB for classes
exec java -Xmx300m -XX:MaxPermSize=140m \
  -Draven.profile=file:conf/current-profile.xml \
  -Dtaverna.startup=. \
  -Djava.system.class.loader=net.sf.taverna.raven.prelauncher.BootstrapClassLoader \
  -Draven.launcher.app.main=net.sf.taverna.t2.commandline.CommandLineLauncher \
  -Draven.launcher.show_splashscreen=false \
  -jar lib/prelauncher-*.jar \
  $@

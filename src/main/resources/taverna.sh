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

TAVERNA_HOME="`dirname "$PRG"`"
cd $TAVERNA_HOME

# 400 MB memory, 140 MB for classes
exec java -Xmx400m -XX:MaxPermSize=140m \
  -Draven.profile=file:conf/current-profile.xml \
  -Dtaverna.startup=. \
  -Djava.system.class.loader=net.sf.taverna.raven.prelauncher.BootstrapClassLoader \
  -Dapple.laf.useScreenMenuBar=true \
  -Dapple.awt.graphics.UseQuartz=false \
  -Dsun.swing.enableImprovedDragGesture \
  -jar lib/prelauncher-*.jar

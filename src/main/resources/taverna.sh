#!/bin/sh

set -e

## resolve links - $0 may be a symlink
prog="$0"

real_path() {
    readlink -m "$1" 2>/dev/null || python -c 'import os,sys;print os.path.realpath(sys.argv[1])' "$1"
}

realprog=`real_path "$prog"`
taverna_home=`dirname "$realprog"`
javabin=java
if test -x "$JAVA_HOME/bin/java"; then
    javabin="$JAVA_HOME/bin/java"
fi

# 1000 MB memory, 140 MB for classes
exec "$javabin" -Xmx1000m -XX:MaxPermSize=140m \
  "-Dcom.sun.net.ssl.enableECC=false" \
  "-Djsse.enableSNIExtension=false" \
  "-Draven.profile=file://$taverna_home/conf/current-profile.xml" \
  "-Dtaverna.startup=$taverna_home" \
  -Djava.system.class.loader=net.sf.taverna.raven.prelauncher.BootstrapClassLoader \
  -Dapple.laf.useScreenMenuBar=true \
  -Dapple.awt.graphics.UseQuartz=false \
  -Dsun.swing.enableImprovedDragGesture \
  -jar "$taverna_home/lib/"prelauncher-*.jar \
  ${1+"$@"}
  
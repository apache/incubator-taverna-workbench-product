#!/bin/sh

## resolve links - $0 may be a symlink
prog="$0"
realprog=`readlink -e "$prog"`
taverna_home=`dirname "$realprog"`

# 400 MB memory, 140 MB for classes
exec java -Xmx400m -XX:MaxPermSize=140m \
  "-Draven.profile=file://$taverna_home/conf/current-profile.xml" \
  "-Dtaverna.startup=$taverna_home" \
  -Djava.system.class.loader=net.sf.taverna.raven.prelauncher.BootstrapClassLoader \
  -Dapple.laf.useScreenMenuBar=true \
  -Dapple.awt.graphics.UseQuartz=false \
  -Dsun.swing.enableImprovedDragGesture \
  -jar "$taverna_home/lib/"prelauncher-*.jar \
  $@
  
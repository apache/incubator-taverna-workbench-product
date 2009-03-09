#!/bin/sh
java -Xmx300m -Draven.profile=file:conf/current-profile.xml \
  -Dtaverna.startup=. \
  -Djava.system.class.loader=net.sf.taverna.raven.prelauncher.BootstrapClassLoader \
  -Dapple.laf.useScreenMenuBar=true \
  -Dsun.swing.enableImprovedDragGesture \
  -jar lib/prelauncher-*.jar

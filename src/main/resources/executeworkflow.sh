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

interaction_settings = ""
## Uncomment and change the value of the following line to enable web-driven interaction with
## an external site
## interaction_settings +=  " -Dtaverna.interaction.host=localhost"

## Uncomment the following three lines to enable web-driven interaction
## interaction_settings +=  " -Dtaverna.interaction.port=8080"
## interaction_settings +=  ' -Dtaverna.interaction.webdav_path="/interaction"'
## interaction_settings +=  ' -Dtaverna.interaction.feed_path="/feed"'


# 1000 MB memory, 140 MB for classes
exec "$javabin" -Xmx1000m -XX:MaxPermSize=140m \
  "-Draven.profile=file://$taverna_home/conf/current-profile.xml" \
  "-Dtaverna.startup=$taverna_home" \
  -Djava.system.class.loader=net.sf.taverna.raven.prelauncher.BootstrapClassLoader \
  -Draven.launcher.app.main=net.sf.taverna.t2.commandline.CommandLineLauncher \
  -Draven.launcher.show_splashscreen=false \
  $interaction_settings \
  -Djava.awt.headless=true \
  -jar "$taverna_home/lib/"prelauncher-*.jar \
  ${1+"$@"}

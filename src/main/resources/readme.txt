=======================
Taverna workbench 2.3.0
=======================
http://www.taverna.org.uk/
http://www.mygrid.org.uk/

Released by myGrid, 2011-07-12
(c) Copyright 2005-2011 University of Manchester, UK


Licence
=======
Taverna is licenced under the GNU Lesser General Public Licence. (LGPL) 2.1.
See the file LICENCE.txt or http://www.gnu.org/licenses/lgpl-2.1.html for
details.

If the source code was not included in this download, you can download it from
http://www.taverna.org.uk/download/workbench/2-3/#download-source or 
http://www.taverna.org.uk/download/source-code/

Taverna uses various third-party libraries that are included under compatible
open source licences such as the Apache Licence.


Running Taverna
===============

Windows
-------
If you used the installer you should have Taverna->Taverna workbench 2.3.0 in
your Start menu. If you used the self-extracting archive, double-click on
"taverna.exe" in the extracted folder.

If you used the installer, it should have checked that you have a recent
version of Java installed. See "Requirements" below.


Mac OS X
--------
Running Taverna on a Mac requires Mac OS X 10.5 or later with the latest
updates installed for Java 6. 32-bit machines will need 10.6 or later.

Copy the "Taverna" application bundle to /Applications or a folder of your
preference. Eject the disk image, and run Taverna from the installed location.

You might also need to install Graphviz as it is no longer bundled with Taverna. 
See "Requirements" below.


Linux
-----
For Linux, either double-click on "taverna.sh", or start a Terminal and execute
"./taverna.sh" or "sh taverna.sh" from the folder where you extracted Taverna.

You will need to have Graphviz and Oracle's Java runtime installed. See
"Requirements" below.


Documentation
=============
See http://www.taverna.org.uk/documentation/taverna-2-x/ for
documentation and tutorials on using Taverna.

See http://www.mygrid.org.uk/dev/wiki/display/taverna23/User+Manual for the
Taverna 2.3 user manual.

See the file ''known-issues.txt'' for known issues with this release, and the
file ''release-notes.txt'' for improvements since the previous version of
Taverna.


Examples
========
Example Taverna 2.3 workflows can be found in the myExperiment starter pack at
http://www.myexperiment.org/packs/192

You can also access these as the tab 'Starter pack' under the *myExperiment*
view inside Taverna.

You can share and find other workflows at http://www.myexperiment.org/

You can find and describe web services in life sciences at
http://www.biocatalogue.org/


Support
=======
See http://www.taverna.org.uk/about/contact-us/ for contact details.

You may email <support@mygrid.org.uk> for any questions on using Taverna
workbench. myGrid's support team should respond to your query within a 
week.


Mailing lists
-------------

We also encourage you to sign up to the public *taverna-users* mailing list,
where you may post about any problem or give us feedback on using Taverna.
myGrid developers are actively monitoring the list.

 * http://lists.sourceforge.net/lists/listinfo/taverna-users
 * http://taverna-users.markmail.org/search/?q=


If you are a developer, writing plugins for Taverna, dealing with the code
behind Taverna or integrating Taverna with other software, you might find it
interesting to also sign up for the public *taverna-hackers* mailing list,
where you can also track the latest developments of Taverna.

  * http://lists.sourceforge.net/lists/listinfo/taverna-hackers
  * http://taverna-hackers.markmail.org/search/?q=


Registration
============
Taverna might ask if you would like to register as a Taverna user. The myGrid
team would appreciate if you do, as it would:

  * Allow us to support you better; future plans will be directed towards
    solutions Taverna users require

  * Help sustain Taverna development

By registering, you will *not* be giving us access to your data or service
usage. We will *not* be monitoring your usage of Taverna, we will only record
the information you provide in the registration form.

For full terms and condition of our registration, see
http://www.taverna.org.uk/about/legal-stuff/terms/


Requirements
============

Graphviz
--------
The external tool Graphviz ( http://www.graphviz.org/ ) is used for generating
the workflow diagram in Taverna. A version of Graphviz is bundled in the
Windows install, while Linux and Mac OS X users will need to install Graphviz
separately.

For OS X, see http://www.graphviz.org/Download_macos.php where you can download
the *current stable release* for your operating system.

For Linux, most distributions have a way to install Graphviz. For Ubuntu, try:
  sudo apt-get install graphviz

For other distributions, see http://www.graphviz.org/Download.php for
instructions. Please note that you do *not* need the Grappa java library.

In most cases Taverna should be able to pick up the location of the Graphviz
binary "dot" from the PATH, if this is not the case, see
http://www.mygrid.org.uk/dev/wiki/display/taverna/Workbench+preferences on how
to configure the location of "dot".


Java
-----
Taverna requires the Java Runtime Environment (JRE) version 6 or later from
Oracle.  No other versions of Java are officially tested with Taverna. 

Windows users might need to download Java from http://java.com/ - but in most
cases the Taverna installer would already have checked if Java is installed.

Linux users have different options to install Java depending on their Linux
distribution. Some distributions, such as Ubuntu, might come with alternative
open source implementations of Java, like Gnu GCJ and OpenJDK. We've identified
some issues with these implementations, and recommend using the official Java
implementation from Sun/Oracle. 

To download Oracle Java 6 for Ubuntu, start a Terminal, and type the following:
  sudo apt-get install sun-java6-jre

and follow the instructions. You might also need to change the default Java
implementation by running:
  sudo update-alternatives --config java

To check your version of Java on the command line, try:

  $ java -version
  java version "1.6.0_22"
  Java(TM) SE Runtime Environment (build 1.6.0_22-b04)
  Java HotSpot(TM) 64-Bit Server VM (build 17.1-b03, mixed mode)


Read http://www.taverna.org.uk/download/workbench/system-requirements/
for more requirement details.


Secure web services
-------------------
If you need to invoke secure services or access secured data from your
workflows (e.g. if you need to provide username and password to gain access to
your service/data or your service's URL starts with HTTPS), then you need to
allow Taverna to communicate securely to such resources using the strongest
possible cryptography. 

To do so, you have to install the 'Unlimited Strength Java Cryptography
Extension' policy instead of the default restrictive policy that is
shipped with Java; the default policy will for export reasons only
allows the use of "weak" cryptography (e.g. short passwords and keys).

Java by default only comes with limited-strength cryptography support
because of import control restrictions in some countries, where
unlimited-strength cryptography is classified as a "weapon technology".
Thus, you must determine whether your country's laws allow you to
install such software and you are responsible for doing so.

The policy files on your system are located in:

   <java-home>/lib/security/local_policy.jar
   <java-home>/lib/security/US_export_policy.jar

where <java-home> is the jre directory of the Java Development Kit (JDK) or the
top-level directory of the JRE (Java Runtime Environment) on your system.

If eligible, you may download the unlimited strength versions of the above
policy files and replace the ones that were installed by default.  This will
effectively "turn on" the use of unlimited-strength security in Java on your
system. Not installing these files will most probably cause invoking of secure
services from Taverna to fail. Note that if you switch to another Java version
you will have to install the policy files again in the appropriate directory of
your new Java installation.

For Java 6, you can download the unlimited cryptography policy jar files from:
  http://tinyurl.com/java6sec    -or-
  https://cds.sun.com/is-bin/INTERSHOP.enfinity/WFS/CDS-CDS_Developer-Site/en_US/-/USD/ViewProductDetail-Start?ProductRef=jce_policy-6-oth-JPR@CDS-CDS_Developer


Advanced
========

Logging
-------

If you are using a Windows operating system and want to see Taverna's
logging information, then run "taverna-debug.bat" from the installed
Taverna folder.

In OS X, start "/Applications/Utillities/Console".

In Linux run "taverna.sh" from a Terminal.

You can also find detailed logs in Taverna's home directory. You can 
view this directory from within Taverna by choosing 
Advanced->Show Log Folder in the menu.

See:

    Windows 7/Vista: C:\Users\JohnDoe\AppData\Roaming\taverna-2.3.0\logs

    Windows XP: C:\Documents and settings\JohnDoe\
                   Application Data\taverna-2.3.0\logs


    OS X: /Users/JohnDoe/Library/Application support/taverna-2.3.0/logs

    Linux: /home/johndoe/.taverna-2.3.0/logs

Note that "Application data" and "AppData" are hidden folders in Windows.

To modify the log levels, edit "conf/log4j.properties" in the Taverna
installation folder.


Default services and plugins
----------------------------

You can edit the default service list for the Taverna installation by
editing "conf/default_service_providers.xml". You can generate this
service list from within Taverna by right-clicking on "Available
Services" and selecting "Export Services To File".
 
Similarly you can replace the installation "plugins/plugins.xml" with
"plugins.xml" from the Taverna home directory to force installation of a
plugin by default. Note that in this case it is also recommended to copy
the full content of "repository" from the Taverna home directory to
append the installation directory's "repository".


Memory usage 
------------
For OS X and Linux, Taverna will use a maximum of 400 MB. In Windows,
"taverna-debug.bat" will also use 400 MB, while "taverna.exe" will use up to
400 MB or, if higher, 15% of available memory at the point of launching
Taverna.

If Taverna happens to run out of memory while running a workflow with
large data (or large number of data), you can set Taverna to store data
in a database by going to Preferences->Data and Provenance and remove
the tick for "In-memory storage". This will reduce execution speed
slightly, but should consume less memory. Also remember to click
'Remove' on old runs you are no longer interested in.

http://www.mygrid.org.uk/dev/wiki/display/taverna/Data+and+provenance+preferences
has more details on the data settings.


If you need to increase the available memory, edit "taverna.sh" or
"taverna-debug.bat" and replace "-Xmx400m" with say "-Xmx600m" to use
600 MiB.

For OS X you would need to right click on "Taverna.app" and go inside
the application bundle to edit Contents/Info.plist and change the same
parameter using the Property List Editor.

http://www.mygrid.org.uk/dev/wiki/display/taverna/Increase+memory+allocation
has more details on memory allocation.

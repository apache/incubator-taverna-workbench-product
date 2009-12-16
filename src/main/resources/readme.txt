=====================
Taverna workbench 2.1
=====================
http://www.taverna.org.uk/

Released by myGrid, 2009-12-16
(c) Copyright 2005-2009 University of Manchester, UK


Licence
=======
Taverna is licenced under the GNU Lesser General Public Licence. (LGPL) 2.1.
See the file LICENCE.txt for details.

If the source code was not included in this download, you can download it from
http://www.taverna.org.uk/download/source-code/


Support
=======
You may email support@mygrid.org.uk for any questions on using
Taverna workbench. myGrid's support team should respond to your
query within a couple of days.


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


See http://www.taverna.org.uk/about/contact-us/ for contact details.



Examples
========
Example Taverna 2.1 workflows can be found in the myExperiment 
starter pack at http://www.myexperiment.org/packs/103

You can also access these as the tab 'Starter pack' under the 
*myExperiment* view inside Taverna.

You can share and find other workflows at http://www.myexperiment.org/

You can find and describe web services at http://www.biocatalogue.org/



Documentation
=============
See http://prototype.taverna.org.uk/documentation/taverna-2-1/
for documentation and tutorials on using Taverna.

See the file known-issues.txt for known issues with this release, and 
the file release-notes.txt for improvements since the previous version
of Taverna.


Requirements
============
Taverna requires the Java Runtime Environment (JRE) version 5 or 6 from Sun.
No other versions of Java have been tested. 

Mac OS X 10.5 (Leopard) and later should come with Java 5 or newer.  

Windows users might need to download Java from http://java.com/

Linux users have different options to install Java depending on the Linux
distribution. Some distributions, such as Ubuntu, might come with alternative
implementations of Java, like Gnu GCJ and OpenJDK. We've identified some issues
with these implementations, and recommend using the official Java
implementation from Sun. 

To download Sun Java 6 for Ubuntu, start a Terminal, and type the following:
  sudo aptitude install sun-java6-jre

and follow the instructions. You might also need to change the default Java
implementation by running:
  sudo update-alternatives --config java

Read http://www.mygrid.org.uk/tools/taverna/taverna-requirements/ for more
requirement details.


Secure web services
-------------------
If you need to invoke secure services or access secured data from your
workflows (e.g. if you need to provide username and password to gain access to
your service/data or your service's URL starts with HTTPS), then you need to
allow Taverna to communicate securely to such resources using the strongest
possible cryptography. To do so, you have to install the 'Unlimited Strength
Java Cryptography Extension' policy instead of the default restrictive policy
that is shipped with Java; the default policy only allows the use of "weak"
cryptography (e.g. short passwords and keys).

Java by default only comes with limited-strength cryptography support because
of import control restrictions in some countries, where unlimited-strength
cryptography is classified as a "weapon technology". Thus, you must determine
whether your country's laws allow you to install such software and you are
responsible for doing so.

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

For Java 5, you can download the unlimited cryptography policy jar files from:
  http://tinyurl.com/java5sec    -or- 
  https://cds.sun.com/is-bin/INTERSHOP.enfinity/WFS/CDS-CDS_Developer-Site/en_US/-/USD/ViewProductDetail-Start?ProductRef=jce_policy-1.5.0-oth-JPR@CDS-CDS_Developer



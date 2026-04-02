 Instructions
Case Scenario

A staff member has requested a list of the names of the services recognized by the current Linux image. A file named /etc/services has been located that contains the pertinent information; however it is not organized to easily determine all of the services.

Using a combination of pipes, redirects and control statements, produce output that contains only the service names. The entire task must be accomplished without using any intermediary files. Each service should only be listed once and captured to a file named uniqueservices.txt, located in the home directory. Remove any blank lines or lines that are deemed to be comments.
There could be more than one possible solution for obtaining the desired results.
Objectives

    Extract all the service names from the file.
    Sort the names alphabetically removing any duplicates.
    Remove any blank lines or lines that do not begin with a letter of the alphabet.
    Capture the final output to a file named uniqueservices.txt.
    Count the lines in the file using a conditional command that is only executed if the previous combined commands are successful.

Curriculum Resources

    Module 5 - Command Line Skills
    Module 6 - Getting Help
    Module 7 - Navigating the Filesystem
    Module 10 - Working with Text

 
Deliverables

    Provide the final command line for successful completion.

    The final result should match the following:

    340 uniqueservices.txt                                                          
    sysadmin@localhost:~$ head uniqueservices.txt                                   
    acr-nema                                                                        
    afbackup                                                                        
    afmbackup                                                                       
    afpovertcp                                                                      
    afs3-bos                                                                        
    afs3-callback                                                                   
    afs3-errors                                                                     
    afs3-fileserver                                                                 
    afs3-kaserver                                                                   
    afs3-prserver 
    sysadmin@localhost:~$ tail uniqueservices.txt                                   
    zabbix-trapper                                                                  
    zebra                                                                           
    zebrasrv                                                                        
    zephyr-clt                                                                      
    zephyr-hm                                                                       
    zephyr-srv                                                                      
    zip                                                                             
    zope                                                                            
    zope-ftp                                                                        
    zserv


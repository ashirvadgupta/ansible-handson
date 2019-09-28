#!/bin/bash                                                                                                                                            
                                                                                                                                                     
KEY="${HOME}/.ssh/id_rsa.pub"                                                                                                                          
if [ ! -f $KEY ];then                                                                                                                                
    echo "Private Key not found at $KEY"                                                                                                             
    echo "* Please create it with \"ssh-keygen -t rsa -b 4096 -C \"user@domain\"\" *"                                                                                           
    exit                                                                                                                                             
fi                                                                                                                                                   
                                                                                                                                                     
if [ -z $1 ];then                                                                                                                                    
    echo "Usage: $0 username@host-address"                                                                                                                       
    exit                                                                                                                                             
fi                                                                                                                                                   
                                                                                                                                                     
echo "Putting your key on $1... "  
ssh -q $* "umask 0077; mkdir -p ~/.ssh ; echo "`cat $KEY`" >> ~/.ssh/authorized_keys"                                                                
echo "done!"                                                                                                                                      
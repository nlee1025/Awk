#!/usr/bin/bash
#find   . -type f -name "*.cvs"  -print '%P\n' |xargs -I {}   echo "working here \"{}\""
# find   * -type f -name "*.cvs" -maxdepth 0  -print  |xargs -I {}   echo "working here \"{}\""
# find   * -type f -name "*.cvs" -maxdepth 0 -print |xargs -I {} sh -c " cp \"{}\" c ; awk -v MYFILE=\"c\" -f b_phone2.awk" # fixed this issue with .
find   * -type f -name "*.cvs" -maxdepth 0 -print |xargs -I {} sh -c "awk -v MYFILE=\"{}\" -f b_phone2.awk"

#find   . -type f -name "*.cvs"  | xargs -I {} sh -c " cp \"{}\" c ; awk -v MYFILE=\"c\" -f b_phone2.awk;
 #print \"======================\" "
# for i in *.cvs ; do 
#    print "======================="
#    awk -v MYFILE=$i -f b_phone2.awk
#    print "======================="
# done


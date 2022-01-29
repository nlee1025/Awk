#awk -v MYFILE="b" -f b_phone2.awk

function printFormat(num) {
	print "(" substr(num,0,3) ")"  substr(num,3,3) "-" substr(num,6,4)
}

function formatPhoneNumber() {
	#print "item: " item
	jstr = ""
	for (k = 1; k <= length(item); k++) {
			  l = substr(item, k, 1)
			  if (l ~ /[0-9]/) {
			    jstr = jstr l
			   #print "k is " k " and l is " l " and jstr is " jstr
			}
		}
		#print "item :" item
		#print "length:" length(item)s
		#print "Second output is :" jstr
}

BEGIN{
OUTFILE=MYFILE"_o"
OUTDIR="kid_directory/"
OUTDIR_FILE="kid_directory/" OUTFILE     #this is issue with your computer that after > you need to have only one variable.
CMDmkdir="mkdir -p " OUTDIR " 2>/dev/null"
system(CMDmkdir)
close(CMDmkdir)

        a = 0;
	      b = 0;
              fstring="code"
              while(getline < MYFILE ) {
                           array[a]=$0
			   print "from file: " array[a]
                           a=a+1			  
              }#while

              for(i=0; i< a; i++){
                           item = array[i]
                           gsub(/^[ \t]+|[ \t]+$/, " ", item)
                           gsub(/[ \t]+/, " ", item)
			   if (length(item) > 1) {
			     array2[b] = item
			     b = b+1
			     print "outpus is : "  item
			   }
             }
	     
	     for(j=0; j< b; j++){
	                split(array2[j],larray," ")
			#print length(larray)
			#print larray[1] " " larray[5]                        >    OUTDIR_FILE ##this example of printing output
			print larray[1] " " larray[5]                        >    OUTDIR_FILE
			# daughter's info
			
			array[ "kid" SUBSEP j] = larray[1]
			array[ larray[1] SUBSEP "m"] = larray[6]
			array[ larray[1] SUBSEP "d"] = larray[3]
			array[ larray[1] SUBSEP "i_sex"] = larray[2]
			array[ larray[1] SUBSEP "i_grade"] = 7
			
			# dad's info
			#array[ larray[3] SUBSEP "m"] = larray[6]
			#array[ larray[3] SUBSEP "d"] = larray[3]
			#array[ larray[3] SUBSEP "i_sex"] = larray[2]
			#array[ larray[3] SUBSEP "i_grade"] = 7
			array[ larray[3] SUBSEP "i_email"] = larray[4]
			array[ larray[3] SUBSEP "i_phone"] = larray[5]
			
			# mom's info
			array[ larray[6] SUBSEP "i_email"] = larray[7]
			array[ larray[6] SUBSEP "i_phone"] = larray[8]
			
			array[ "num_kid" SUBSEP 7] = array[ "num_kid" SUBSEP 7] + 1
			array[ "max_kid"  ] = b
	     
	     }
	     b=array[ "max_kid"  ]
	     print b
    	     for(m=0; m< b; m++){
	     #for m in array[ "kid" SUBSEP]{
	        print "Second output is : " array[ "kid" SUBSEP m ]
		k_name = array[ "kid" SUBSEP m ]
		print "mom : " array[ k_name SUBSEP "m"]
		m_name = array[ k_name SUBSEP "m"]
		print "mom's phone: " array[m_name SUBSEP "i_phone"]
		
		# dad print
		print "dad : " array[ k_name SUBSEP "d"]
		d_name = array[ k_name SUBSEP "d"]
		print "dad's phone: " array[d_name SUBSEP "i_phone"]
		
		jstr = array[ "phone" SUBSEP m ]
	        if (length(jstr) == 10){
		     if (jstr == "0000000000") {
	#	     	printError()
		     }
	             #print "----" jstr
		     printFormat(jstr)
	             #print "(" substr(jstr,0,3) ")"  substr(jstr,3,3) "-" substr(jstr,6,4)
	        } else {
	             #print "****[" jstr "] is not correct , length is " length(jstr)
                }
	     }
print "work is done================================" 
}#END BEGIN

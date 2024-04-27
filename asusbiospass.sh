#!/bin/bash
echo "ASUS Administrative BIOS password generator v0.1";
echo "by ... - 05/2017";
echo

#user input
read -p "Enter *recovery date* (format YYYY-MM-DD): " var1
dateval=$(date -d "$var1" +"%Y%m%d"); 

#check if date is valid or exit
#todo

#slice it & octal base no more
days=${dateval:6:2};
days=$((10#$days));
month=${dateval:4:2};
month=$((10#$month));
year=${dateval:3:1};

array7=( [0]="AAAABLDDBB0LB211C9BAAAAABLDDBB0" );
array6=( [0]="LBAL0AL0ADLADLADLADBADBABBAB2AA" );
array5=( [0]="BADBOA01AAH1ABBALLBABLBAH1ADL1A" [1]="A0CAABALBBALBBAH1ABH1ABLABL9ABO" );
array4=( [0]="A49BLA0ODBLA0OD1ALAOD2ALABCA0OA" [1]="BCA0AHBL20A4BLBAOADLBA0AD1ABA" [2]="1ABAA9BLAAACBLA0OD2LAHBD2ALABL2" [3]="ALAB1A0AHB1A0A4BLBAA49BBA0AD1L" [4]="0AD1ABAA91ALAACBLAHACA0AHBD2AAH" [5]="BD2AOAB1AAOAB1A0A491ABA49BBA0A" [6]="BBA0OD1AB0OD1ALAACAALABCA0AHB1A" [7]="0AHBL2AOABLBAOAB1ABOAD1ABA49BAB" [8]="A49BLA0ODBLA0OD1ALAOD2ALABCA0O" [9]="0AHBL2AOABLBAOAB1ABOAD1ABA49BAB" [10]="A49BLA0ODBLA0OD1ALAOD2ALABCA0O" [11]="BCA0AHBL20A4BLBAOADLBA0AD1ABAOD" );
array3=( [0]="DA1HABBDAA24ABBLA244A9LLABAA99O" [1]="9LLA2AA9LLBABAACOBAALBACOAALB" [2]="BACOBALBAA10AALDA100AO0DA1HAOOB" [3]="O0DA1HAO00DA1HABBDAA24ABBLA244" [4]="4ABBDA24AA9LLA2AA9LLBABAACOBAAL" [5]="ABAA9OBABBBACOBALBAA10AALDA100" [6]="0AALBA10AAO0DA1HAO00DA1HABBDAA2" [7]="A1HAOBDA114ABBDA24AA9LLA2AA9LLB" [8]="LLA24A9LLLABAA9OBABBBACOBALBAA" [9]="LA24A9LLAABAA9LBABAAACOBALBACC0" [10]="COBABBACOOAALBA10AAA0DA10AO0DD" [11]="DA10AO0DAA1HAO0DA1HHABBDA24ABBL" );
array2=( [0]="LA24ABBDAA1HAO0DA1H0AALBA10AAAB" [1]="1HAOBDA1H0AALDA10AAABAACOBABA" [2]="AO0DA10AAALBACOBABAAA9LLA24ABBB" [3]="LBACOBABAAA9LLA24ABBBDA1HAO0DD" [4]="A9LLA24A9BBDA1HAOBDDA10AA0DA1CO" [5]="BDA14ABBDDA10AO0DA1COBALBACOBL" [6]="A1HAO0DA110AALBACOBBABAA9LLA224" [7]="0AALBACOBBABAA9LLA224ABBDA1HAAO" [8]="ABAA9LLAB24ABBDA14AAO0DA1HAO0L" [9]="AO0DA10AAALBACOBABAAA9LLA24ABBB" [10]="LBACOBABBAA9LLA24A9BBDA1HABBDD" [11]="A9LLABAA9BBDA24ABBDDA1HAO0DA1CO" );
array1=( [0]="BL4AA20BAAAA2HBA1LDBHBA1ODA90A1" [1]="ODA9BBAOBACBDAOL4AADABLAAA20B" [2]="AA2HBA1LDBHAA1ODA9BA1OLACBBAOLA" [3]="CBDABL4AADABLAAA2HB0AAABHBA1OO" [4]="HAA1ODA9BA10LACBDAOLACLDABLAALD" [5]="AB0AAA2HB0BAABHAA1OOB4AA1OLACA" [6]="10LACBDABBACLDABLAALDA90AAABH90" [7]="BAOBHAA1OOB4AA10LACAA20LACLDA0B" [8]="A1LDAB0AALDA90BAABH9BBAOB4AA1A" [9]="OLA9BBAOLACBDABL4AADABLAAA2HB0A" [10]="AA2HBA1ODBHAA1ODA9BA1OLACBDAOL" [11]="CBDABLAAADAB0AAA2HB0AAABHAA1OOB"] [12]="BAABHAA1OOB4AA1OLACAA10LACLDA0B" [13]="ACLDAB0AALDA90AAABH90BAOB4AA" [14]="L4AA10LACAA20LACLDAHBA1LDAB0A1O" [15]="DA90BAABH9BBAOB4AA1AOL4AA10LAA" [16]="A20BACLDAHBA1LDA90A1ODA90BAOBAC" [17]="BBAOB4AA1ABL4AA20LAAAA2HBA1LDB" [18]="BA1ODA90B1ODA9BBAOBACBDAOL4AADA" [19]="BLAAA20BAAAA2HBA1LDBHAA1ODA90A1" [20]="OLA9BBAOBACBDABL4AADABLAAA20B0" [21]="A1LDAB0AALDA90BAABH9BBAOB4AA1AO" [22]="L4AA10LACAA20BACLDAHBA1LDA90A1" [23]="DA90BAOBH9BBAOB4AA1AOL4AA20LAAA");
#months even first, odd later - first digit is the year 0 1 2 3 etc
arraytable0=( [0]="B0AB1A0BB0" [1]="B1A0BB0AB1" [2]="0BB0AB1A0B" [3]="B1A0BB0AB1" [4]="1A0BB0AB1A" [4]="0AB1A0BB0A" [6]="1A0BB0AB1A" [7]="0AB1A0BB0A" [8]="AB1A0BB0AB" [9]="BB0AB1A0BB" [10]="AB1A0BB0AB" [11]="A0BB0AB1A0" [12]="B0AB1A0BB0" [13]="A0BB0AB1A0" [14]="B0AB1A0BB0" [15]="B1A0BB0AB1" );

arrayd1=( [0]="B1A0BB0AB1" [1]="H9ABAD2AH9" [2]="BAD2AH9ABA" [3]="BA4CALADBA" [4]="CALADBA4CA" [5]="OLLAA1AOOL" [6]="AA1AOOLLAA" [7]="AOOLLAA1AO" [8]="B0AB1A0BB0" [9]="AA1AOOLLAA" [10]="A0BB0AB1A0" [11]="B0AB1A0BB0" );
arrayd2=( [0]="B1A0BB0AB1" [1]="0BB0AB1A0B" [2]="BAD2AH9ABA" [3]="2AH9ABAD2A" [4]="CALADBA4CA" [5]="ADBA4CALAD" [6]="A4CALADBA4" [7]="          " [8]="          " [9]="          " [10]="          " [11]="          " );
arrayd3=( [0]="A1AOOLLAA1" [1]="0BB0AB1A0B" [2]="0AB1A0BB0A" [3]="2AH9ABAD2A" [4]="9ABAD2AH9A" [5]="AD2AH9ABAD" [6]="A4CALADBA4" [7]="ALADBA4CAL" [8]="          " [9]="A4CALADBA4" [10]="ALADBA4CAL" [11]="          " );
arrayd4=( [0]="A1AOOLLAA1" [1]="OOLLAA1AOO" [2]="          " [3]="1A0BB0AB1A" [4]="9ABAD2AH9A" [5]="AD2AH9ABAD" [6]="AH9ABAD2AH" [7]="ALADBA4CAL" [8]="DBA4CALADB" [9]="A4CALADBA4" [10]="ALADBA4CAL" [11]="DBA4CALADB" );
arrayd5=( [0]="4CALADBA4C" [1]="OOLLAA1AOO" [2]="          " [3]="          " [4]="BB0AB1A0BB" [5]="AB1A0BB0AB" [6]="AH9ABAD2AH" [7]="ABAD2AH9AB" [8]="DBA4CALADB" [9]="AH9ABAD2AH" [10]="ABAD2AH9AB" [11]="DBA4CALADB" );
arrayd6=( [0]="4CALADBA4C" [1]="LADBA4CALA" [2]="          " [3]="          " [4]="          " [5]="AB1A0BB0AB" [6]="          " [7]="ABAD2AH9AB" [8]="D2AH9ABAD2" [9]="A0BB0AB1A0" [10]="ABAD2AH9AB" [11]="D2AH9ABAD2" );
arrayd7=( [0]="H9ABAD2AH9" [1]="LADBA4CALA" [2]="BA4CALADBA" [3]="          " [4]="          " [5]="          " [6]="A0BB0AB1A0" [7]="B0AB1A0BB0" [8]="D2AH9ABAD2" [9]="          " [10]="          " [11]="D2AH9ABAD2" );
arrayd8=( [0]="H9ABAD2AH9" [1]="BAD2AH9ABA" [2]="BA4CALADBA" [3]="CALADBA4CA" [4]="ADBA4CALAD" [5]="          " [6]="          " [7]="B0AB1A0BB0" [8]="B1A0BB0AB1" [9]="          " [10]="          " [11]="" );
arrayd9=( [0]="0BB0AB1A0B" [1]="BAD2AH9ABA" [2]="2AH9ABAD2A" [3]="9ABAD2AH9A" [4]="ADBA4CALAD" [5]="A4CALADBA4" [6]="          " [7]="          " [8]="B1A0BB0AB1" [9]="          " [10]="          " [11]="" );
arrayd10=( [0]="BAD2AH9ABA" [1]="2AH9ABAD2A" [2]="9ABAD2AH9A" [3]="ADBA4CALAD" [4]="A4CALADBA4" [5]="          " [6]="          " [7]="         " [8]="          " [9]="LLAA1AOOLL" [10]="          " [11]="" );
arrayd11=( [0]="0AB1A0BB0A" [1]="1A0BB0AB1A" [2]="9ABAD2AH9A" [3]="AD2AH9ABAD" [4]="A4CALADBA4" [5]="ALADBA4CAL" [6]="          " [7]="          " [8]="          " [9]="          " [10]="A1AOOLLAA1" [11]="" );
arrayd12=( [0]="0AB1A0BB0A" [1]="1A0BB0AB1A" [2]="          " [3]="AD2AH9ABAD" [4]="AH9ABAD2AH" [5]="ALADBA4CAL" [6]="DBA4CALADB" [7]="          " [8]="          " [9]="DBA4CALADB" [10]="          " [11]="OOLLAA1AOO" );
arrayd13=( [0]="LAA1AOOLLA" [1]="1AOOLLAA1A" [2]="BB0AB1A0BB" [3]="          " [4]="AH9ABAD2AH" [5]="ABAD2AH9AB" [6]="DBA4CALADB" [7]="4CALADBA4C" [8]="          " [9]="DBA4CALADB" [10]="4CALADBA4C" [11]="" );
arrayd14=( [0]="BA4CALADBA" [1]="1AOOLLAA1A" [2]="          " [3]="          " [4]="          " [5]="ABAD2AH9AB" [6]="D2AH9ABAD2" [7]="4CALADBA4C" [8]="LADBA4CALA" [9]="D2AH9ABAD2" [10]="4CALADBA4C" [11]="LADBA4CALA" );
arrayd15=( [0]="BA4CALADBA" [1]="CALADBA4CA" [2]="ADBA4CALAD" [3]="          " [4]="          " [5]="          " [6]="D2AH9ABAD2" [7]="H9ABAD2AH9" [8]="LADBA4CALA" [9]="D2AH9ABAD2" [10]="H9ABAD2AH9" [11]="LADBA4CALA" );
arrayd16=( [0]="2AH9ABAD2A" [1]="CALADBA4CA" [2]="ADBA4CALAD" [3]="AA1AOOLLAA" [4]="          " [5]="          " [6]="          " [7]="H9ABAD2AH9" [8]="BAD2AH9ABA" [9]="          " [10]="H9ABAD2AH9" [11]="BAD2AH9ABA" );
arrayd17=( [0]="2AH9ABAD2A" [1]="9ABAD2AH9A" [2]="          " [3]="A4CALADBA4" [4]="AOOLLAA1AO" [5]="          " [6]="          " [7]="          " [8]="BAD2AH9ABA" [9]="B1A0BB0AB1" [10]="0BB0AB1A0B" [11]="BAD2AH9ABA" );
arrayd18=( [0]="1A0BB0AB1A" [1]="9ABAD2AH9A" [2]="AD2AH9ABAD" [3]="A4CALADBA4" [4]="ALADBA4CAL" [5]="LLAA1AOOLL" [6]="          " [7]="          " [8]="          " [9]="          " [10]="          " [11]="" );
arrayd19=( [0]="1A0BB0AB1A" [1]="BB0AB1A0BB" [2]="AD2AH9ABAD" [3]="AH9ABAD2AH" [4]="ALADBA4CAL" [5]="DBA4CALADB" [6]="A1AOOLLAA1" [7]="          " [8]="          " [9]="          " [10]="OOLLAA1AOO" [11]="" );
arrayd20=( [0]="BB0AB1A0BB" [1]="AD2AH9ABAD" [2]="AH9ABAD2AH" [3]="ALADBA4CAL" [4]="DBA4CALADB" [5]="          " [6]="          " [7]="LAA1AOOLLA" [8]="          " [9]="          " [10]="          " [11]="1A0BB0AB1A" );
arrayd21=( [0]="BB0AB1A0BB" [1]="AB1A0BB0AB" [2]="AH9ABAD2AH" [3]="ABAD2AH9AB" [4]="DBA4CALADB" [5]="4CALADBA4C" [6]="          " [7]="          " [8]="1AOOLLAA1A" [9]="          " [10]="          " [11]="" );
arrayd22=( [0]="          " [1]="AB1A0BB0AB" [2]="          " [3]="ABAD2AH9AB" [4]="D2AH9ABAD2" [5]="4CALADBA4C" [6]="LADBA4CALA" [7]="BA4CALADBA" [8]="          " [9]="LADBA4CALA" [10]="          " [11]="" );
arrayd23=( [0]="          " [1]="AA1AOOLLAA" [2]="A0BB0AB1A0" [3]="          " [4]="D2AH9ABAD2" [5]="H9ABAD2AH9" [6]="BAD2AH9ABA" [7]="BA4CALADBA" [8]="CALADBA4CA" [9]="LADBA4CALA" [10]="BA4CALADBA" [11]="CALADBA4CA" );
arrayd24=( [0]="ADBA4CALAD" [1]="AA1AOOLLAA" [2]="          " [3]="B0AB1A0BB0" [4]="          " [5]="H9ABAD2AH9" [6]="BAD2AH9ABA" [7]="2AH9ABAD2A" [8]="CALADBA4CA" [9]="BAD2AH9ABA" [10]="BA4CALADBA" [11]="CALADBA4CA" );
arrayd25=( [0]="ADBA4CALAD" [1]="A4CALADBA4" [2]="          " [3]="          " [4]="B1A0BB0AB1" [5]="          " [6]="          " [7]="2AH9ABAD2A" [8]="9ABAD2AH9A" [9]="BAD2AH9ABA" [10]="2AH9ABAD2A" [11]="9ABAD2AH9A" );
arrayd26=( [0]="AD2AH9ABAD" [1]="A4CALADBA4" [2]="ALADBA4CAL" [3]="          " [4]="          " [5]="0BB0AB1A0B" [6]="          " [7]="          " [8]="9ABAD2AH9A" [9]="          " [10]="          " [11]="9ABAD2AH9A" );
arrayd27=( [0]="AD2AH9ABAD" [1]="AH9ABAD2AH" [2]="ALADBA4CAL" [3]="DBA4CALADB" [4]="          " [5]="          " [6]="LAA1AOOLLA" [7]="          " [8]="          " [9]="          " [10]="          " [11]="" );
arrayd28=( [0]="          " [1]="AH9ABAD2AH" [2]="ABAD2AH9AB" [3]="DBA4CALADB" [4]="4CALADBA4C" [5]="LADBA4CALA" [6]="          " [7]="          " [8]="          " [9]="          " [10]="          " [11]="" );
arrayd29=( [0]="          " [1]="          " [2]="ABAD2AH9AB" [3]="D2AH9ABAD2" [4]="4CALADBA4C" [5]="LADBA4CALA" [6]="BA4CALADBA" [7]="          " [8]="          " [9]="          " [10]="          " [11]="" );
arrayd30=( [0]="A0BB0AB1A0" [1]="          " [2]="D2AH9ABAD2" [3]="H9ABAD2AH9" [4]="LADBA4CALA" [5]="BA4CALADBA" [6]="          " [7]="          " [8]="          " [9]="BA4CALADBA" [10]="          " [11]="" );
arrayd31=( [0]="A0BB0AB1A0" [1]="          " [2]="          " [3]="          " [4]="          " [5]="BAD2AH9ABA" [6]="CALADBA4CA" [7]="          " [8]="          " [9]="CALADBA4CA" [10]="          " [11]="" );




#7th
n7=${array7[0]:(($days -1)):1};
#6th
n6=${array6[0]:(($days -1)):1};
#5th
if [ $((month%2)) -eq 0 ]; then
	n5=${array5[1]:(($days -1)):1};
else
	n5=${array5[0]:(($days -1)):1};
fi
#4th-3th-2th
n4=${array4[$((month - 1))]:(($days -1)):1};
n3=${array3[$((month - 1))]:(($days -1)):1};
n2=${array2[$((month - 1))]:(($days -1)):1};
#1st
if [ $((year%2)) -eq 0 ]; then
	n1=${array1[($month -1)]:(($days -1)):1};
else
	n1=${array1[($month +11)]:(($days -1)):1};
fi
#zero
#cual de las 4 tablas corresponde?
	
	#mes par o impar?
	if [ $((month%2)) -eq 0 ]; then
		#que dia es? despues que a;o es?
		if [[ "$days" -eq 1 ]] || [[ "$days" -eq 9 ]] || [[ "$days" -eq 17 ]] || [[ "$days" -eq 25 ]]; then
		n0=${arraytable0[0]:($year):1}
		fi
		if [[ "$days" -eq 2 ]] || [[ "$days" -eq 10 ]] || [[ "$days" -eq 18 ]] || [[ "$days" -eq 26 ]]; then
		n0=${arraytable0[2]:($year):1}
		fi
		if [[ "$days" -eq 3 ]] || [[ "$days" -eq 11 ]] || [[ "$days" -eq 19 ]] || [[ "$days" -eq 27 ]]; then
		n0=${arraytable0[4]:($year):1}
		fi
		if [[ "$days" -eq 4 ]] || [[ "$days" -eq 12 ]] || [[ "$days" -eq 20 ]] || [[ "$days" -eq 28 ]]; then
		n0=${arraytable0[6]:($year):1}
		fi
		if [[ "$days" -eq 5 ]] || [[ "$days" -eq 13 ]] || [[ "$days" -eq 21 ]] || [[ "$days" -eq 29 ]]; then
		n0=${arraytable0[8]:($year):1}
		fi
		if [[ "$days" -eq 6 ]] || [[ "$days" -eq 14 ]] || [[ "$days" -eq 22 ]] || [[ "$days" -eq 30 ]]; then
		n0=${arraytable0[10]:($year):1}
		fi
		if [[ "$days" -eq 7 ]] || [[ "$days" -eq 15 ]] || [[ "$days" -eq 23 ]] || [[ "$days" -eq 31 ]]; then
		n0=${arraytable0[12]:($year):1}
		fi
		if [[ "$days" -eq 8 ]] || [[ "$days" -eq 16 ]] || [[ "$days" -eq 24 ]]; then
		n0=${arraytable0[14]:($year):1}
		fi
	else
		if [[ "$days" -eq 1 ]] || [[ "$days" -eq 9 ]] || [[ "$days" -eq 17 ]] || [[ "$days" -eq 25 ]]; then
		n0=${arraytable0[1]:($year):1}
		fi
		if [[ "$days" -eq 2 ]] || [[ "$days" -eq 10 ]] || [[ "$days" -eq 18 ]] || [[ "$days" -eq 26 ]]; then
		n0=${arraytable0[3]:($year):1}
		fi
		if [[ "$days" -eq 3 ]] || [[ "$days" -eq 11 ]] || [[ "$days" -eq 19 ]] || [[ "$days" -eq 27 ]]; then
		n0=${arraytable0[5]:($year):1}
		fi
		if [[ "$days" -eq 4 ]] || [[ "$days" -eq 12 ]] || [[ "$days" -eq 20 ]] || [[ "$days" -eq 28 ]]; then
		n0=${arraytable0[7]:($year):1}
		fi
		if [[ "$days" -eq 5 ]] || [[ "$days" -eq 13 ]] || [[ "$days" -eq 21 ]] || [[ "$days" -eq 29 ]]; then
		n0=${arraytable0[9]:($year):1}
		fi
		if [[ "$days" -eq 6 ]] || [[ "$days" -eq 14 ]] || [[ "$days" -eq 22 ]] || [[ "$days" -eq 30 ]]; then
		n0=${arraytable0[11]:($year):1}
		fi
		if [[ "$days" -eq 7 ]] || [[ "$days" -eq 15 ]] || [[ "$days" -eq 23 ]] || [[ "$days" -eq 31 ]]; then
		n0=${arraytable0[13]:($year):1}
		fi
		if [[ "$days" -eq 8 ]] || [[ "$days" -eq 16 ]] || [[ "$days" -eq 24 ]]; then
		n0=${arraytable0[15]:($year):1}
		fi
	fi

#password
echo "Password: " $n0$n1$n2$n3$n4$n5$n6$n7


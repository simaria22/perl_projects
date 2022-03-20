
print"Give the size of the window: ";
$x=<STDIN>;
chomp $x;
$k=($x-1)/2;
print"$k\n";

open (DATA1,"<uniprotein.txt");
open(DATA2,">temp2.txt");
open (DATA3, ">>outfile.txt");
$/="\/\/\n";
while (<DATA1>)
{
   while ($_=~/^\s{5}(.*)/mg)  
       {
         $sequence=$1;    
         $sequence=~s/\s//g;  
         print DATA2 "$sequence";
         
        }

print "\n";
}
close(DATA2);
open(DATA2,"<temp2.txt");
my $word=<DATA2>;
print "$word\n";

#$k=9; 
#megethos parathiroy einai symmetriko k einai 2k+1 dhladh 11

@hydrovalue=(); #orismos pinaka poy apouhkeuei tis meses times ydrobobikothtas gia kaue parathiro

%hyd=( R=>'-4.5',	#hash udrofovikothtas
				K=>'-3.9',
				N=>'-3.5',
				D=>'-3.5',
				Q=>'-3.5',
				E=>'-3.5',
				H=>'-3.2',
				P=>'-1.6',
				Y=>'-1.3',
				W=>'-0.9',
				S=>'-0.8',
				T=>'-0.7',
				G=>'-0.4',
				A=>'1.8',
				M=>'1.9',
				C=>'2.5',
				F=>'2.8',
				L=>'3.8',
				V=>'4.2',
				I=>'4.5' );

for($i=$k; $i<length($word)-$k;$i++){   #diabazei thn akolouthia k vriskei thn kenrikh timh toy parathyrou
	$q=0;
	
	for($j=$i-$k; $j<=$i+$k; $j++){     #vriskei ta stoixeia prin k meta thn kenrikh timh toy parathyrou
		$a=substr($word,$j,1);            #orizv to parathyro
		
		#print "$a ";  #typonei to parauyro
		
		$p=$hyd{$a}; #upologizei tis ydribobikothtes toy kathe aminokseos
		$q=$q+$p;  #athrizei tis ydrobobikothtes tvn aminoksevn enos parathiroy
	}
	$q=$q/(2*$k+1); #vriskei th mesh timh ths ydrobobikothtas enos parathiroy
	$hydrovalue[$i]=$q; #bazei se enan pinaka k antistoixei th mesh timh sto meso aminoksi toy parathiroy
	$t=substr($word,$i,1);  #vriskei to meso aminoksi enos parathiroy
	#print DATA3 "$i \t $t \t $hydrovalue[$i]"; 
        print DATA3 $i; 
        print DATA3 "\t";
        print DATA3  $t;
        print DATA3  "\t";
        print DATA3   $hydrovalue[$i];  #typonei th thesi toy aminokseos to meso amonoksi k th mesh ydrobobikothta toy parauyrou gyrv apo ayto to aminiksi
        print DATA3  "\n";	
	
}
print DATA3 "\t";

close(DATA1);
close(DATA2);
close(DATA3);

#diamemvraniko thewreitai to tmhma me panw apo 5-6 aminksea oxi ena thetiko aminoksu anamesa se polla arnhtika

#vazo ayta poy typvnei ayto se ena excel me treis steiles k kano ena grafhma me mia sthlh th uesh toy aminokeos k thn allh thm timh ths ydrobobikothtas k bgainei h grafikh parastash


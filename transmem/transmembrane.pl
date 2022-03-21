$/="\/\/\n";
open (OUT,">file.txt");
 while (<>) {
 $i=0;

  if ($_=~/^ID\s{3}(.*?)\s+(.*?)\;\s+(\d+\sAA.)/m)
 {

   print OUT ">$1"; 
 } 
 if ($_=~/^AC\s{3}(.*?)\;/m) { 
    print OUT "|$1"; 
}
  if ($_=~/^SQ   SEQUENCE\s+(.*?)\;/m) {
   print OUT "|$1\n";
   $size=$1;
   $size=~s/\D//g;
   
 } 
  
 
  while($_=~/^FT\s{3}TRANSMEM\s+(\d+)\s+(\d+)\s+(.*)\./mg)   
  {  
  $i=$i+1; 
  push @tmstart,$1;
  push @tmend,$2;
  $array[$i]=([@tmstart,@tmend]);
  #print @tmstart; 
  #print "\t";
  #print @tmend;
  #print "\n"; 
  pop @tmstart,$1;
  pop @tmend,$2;

}
 
#print OUT "\n";


  while ($_=~/^\s{5}(.*)/mg)
 {
 $sequence=$1;
 $sequence=~s/\s//g;
  print OUT "$sequence";
 }


print OUT "\n";

 $temp=$i;
$temp_array[$temp][1]=$array[$i][1];
 for($m=1; $m<$array[1][0]; $m++){
   print OUT "-";
}

for($i=1; $i<=$temp; $i++)
{
  for($a=$array[$i][0]; $a<=$array[$i][1]; $a++)
   {
    print OUT "M";
   
}
 if($i != $temp){
  while($array[$i][1]+1 <$array[$i+1][0]){
    print OUT "-";
   $array[$i][1]=$array[$i][1]+1;
    }
  }
}

for($k=$temp_array[$temp][1]+1; $k<=$size; $k++){
 print OUT "-";
}





 print OUT "\n\/\/\n"; 


}
close (OUT);

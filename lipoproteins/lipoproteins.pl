while (<>){

if ($_=~/^ID\s{3}(.*?)\s+(.*?)\;\s+(\d+\sAA.)/m)
{
#print ">$1|$3";
print ">$1\n";
}

 while ($_=~/^\s{5}(.*)/mg)
{
$seq=$1;
$seq=~s/\s//g;
print "$seq\n";


  #$name=$1; 
  #$seq=<>; 
  #if($seq=~/(.*LA[GA]C)/) 
  #if($seq=~/(.*[LVI][ASTG][GA]C)/) #36
  #if($seq=~/(.*[^DERK]{6}[LIVMFWSTAG]{2}[LIVMFYSTAGCQ][AGS]C)/)  #60
  if($seq=~/^([MV].{0,13}[RK][^DERK]{6,20}[LIVMFESTAG][LVIAM][IVMSTAFG][AG]C)/) #47
{
  $x=length($1);
   $a=$a+1; 
   

}
} 
}
print "$seq\n";

print "$a LIPOPROTEINS FOUND";


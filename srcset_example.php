<?php
$employers_dir = "./employer_logo/formatted/";
$extension = "webp";
$src_set_suffixes = ["1.5x", "2x", "3x", "4x"];
$employers = array(
  "box.com"=>"box", 
  "CA Technologies"=>"ca",
  "Cisco"=>"cisco",
  "FWIX"=>"fwix",
  "Huawei"=>"huawei",
  "liveNation"=>"liveNation",
  "Intacct"=>"intacct",
  "Samsung"=>"samsung",
  "Yahoo-Finance"=>"Yahoo-Finance"
);
foreach ($employers as $ename=>$logo) {
  $src_set="$employers_dir$logo.$extension,";
  foreach($src_set_suffixes as $suf){
    $src_set .= " $employers_dir{$logo}@$suf.$extension $suf,";
  }
  echo "\t\t\t\t<img alt='$ename'\n \t\t\t\t\tsrcset='$src_set'\n \t\t\t\t\tsrc='$employers_dir$logo.$extension'>\n";
}
?>        

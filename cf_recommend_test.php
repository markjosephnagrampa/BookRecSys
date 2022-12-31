<?php

require_once("cf_recommend.php");
require_once("cf_sample_list.php");


$re = new Recommend();
print_r($re->getRecommendations($books, "jill"));

?>
<?php

// Amazon Price Grabber (APG)
// Copyright (c) 2008 Portland State University
// Created by: Mike Flakus mflakus@pdx.edu and Sherry Buchanan sherryb@pdx.edu
// All Rights Reserved
// Please see the file “COPYING” included in the software package for license information

// Enter your AWS Access Key Id
$AWSAccessKeyId = "1QM0R4GED30XSJJ98JG2";


$isbn = $_GET['isbn'];
if(!strcmp($isbn,''))
	exit();	
	
$Service = "AWSECommerceService";
$Operation = "ItemSearch";
$SearchIndex = "Books";
$ResponseGroup = "OfferFull";

$xml = @file_get_contents("http://ecs.amazonaws.com/onca/xml?Service=$Service&AWSAccessKeyId=$AWSAccessKeyId&Operation=$Operation&Power=isbn:$isbn&SearchIndex=$SearchIndex&ResponseGroup=$ResponseGroup");

$price_start = strrpos($xml,"<FormattedPrice>");

if($price_start === false)
{
	print("No List Price on Amazon");	// no price info found
}
else
{
	$price = substr(trim(strip_tags(substr($xml,$price_start,50))),1);
	if($price < 20)
		print("Amazon: $price");
	else	
		print("Amazon(>\$20): $price");
}


?>
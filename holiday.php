<?php


error_reporting(0);
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASSWORD', '');
define('DB_DATABASE', 'test_crm');
//Connect to mysql server
$link = mysql_connect(DB_HOST, DB_USER, DB_PASSWORD);
if(!$link) {
die('Failed to connect to server: ' . mysql_error());
}
//Select database
$db = mysql_select_db(DB_DATABASE);
if(!$db) {
die("Unable to select database");
}


//Define out start and end dates
$start = new DateTime('2016-01-01');
$end = new DateTime('2016-02-01');
//Define our holidays
//New Years Day
//Martin Luther King Day
$result = mysql_query("SELECT holiday from holidays");
$holidays = mysql_fetch_array($result);
//Create a DatePeriod with date intervals of 1 day between start and end dates
$period = new DatePeriod( $start, new DateInterval( 'P1D' ), $end );
//Holds valid DateTime objects of valid dates
$days = array();
//iterate over the period by day
foreach( $period as $day )
{
        //If the day of the week is not a weekend
	$dayOfWeek = $day->format( 'N' );
	if( $dayOfWeek < 6 ){
                //If the day of the week is not a pre-defined holiday
		$format = $day->format( 'Y-m-d' );
		if( false === in_array( $format, $holidays ) ){
                        //Add the valid day to our days array
                        //This could also just be a counter if that is all that is necessary
			$days[] = $day;
		}
	}
}
echo $days_total=count( $days )-1 ;
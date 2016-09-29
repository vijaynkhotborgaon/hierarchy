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






    // look up the parent of this node
   /*$result = mysql_query("SELECT c1.parent_id,c2.category_name AS parent_name FROM category AS c1
LEFT JOIN category AS c2 ON c1.parent_id=c2.category_id 
WHERE c1.category_id='4' OR c1.parent_id='4' ");
if (!$result) {
    printf("Error: %s\n", mysqli_error($conn));
    exit();
}
    while($row = mysql_fetch_row($result))
	{
	echo $row[0];
	echo $row[1];

	}*/
 
 
 
 
 /*2)function getOneLevel($catId){
    $query=mysql_query("SELECT category_id FROM category WHERE parent_id='".$catId."'");
    $cat_id=array();
    if(mysql_num_rows($query)>0){
        while($result=mysql_fetch_row($query)){
            $cat_id[]=$result['category_id'];
        }
    }   
    echo $cat_id[0];
}
$parent_id=2;
function getChildren($parent_id, $tree_string=array()) {
    $tree = array();
    // getOneLevel() returns a one-dimensional array of child ids        
    $tree = $this->getOneLevel($parent_id);     
    if(count($tree)>0 && is_array($tree)){      
        $tree_string=array_merge($tree_string,$tree);
    }
    foreach ($tree as $key => $val) {
        getChildren($val, $tree_string);
    }   
    echo $tree_string[1];
}*/
  

/*
 * PHP code to traverse hierarchical data (adjacency list model)
 * http://salman-w.blogspot.com/2012/08/php-adjacency-list-hierarchy-tree-traversal.html
 */

 
 /* 3)$data = array();
$index = array();
$query = mysql_query("SELECT id, parent_id, name FROM categories ORDER BY name");
while ($row = mysql_fetch_assoc($query)) {
    $id = $row["id"];
    $parent_id = $row["parent_id"] === NULL ? "NULL" : $row["parent_id"];
    $data[$id] = $row;
    $index[$parent_id][] = $id;
}
/*
 * Recursive top-down tree traversal example:
 * Indent and print child nodes*
 
function display_child_nodes($parent_id, $level)
{
    global $data, $index;
    $parent_id = $parent_id === NULL ? "NULL" : $parent_id;
    if (isset($index[$parent_id])) {
        foreach ($index[$parent_id] as $id) {
            echo str_repeat("-", $level) . $data[$id]["name"] . "\n";
            display_child_nodes($id, $level + 1);
        }
    }
}
display_child_nodes(NULL, 0);*/



/*4)function fetch_recursive($src_arr, $id, $parentfound = false, $cats = array())
{
    foreach($src_arr as $row)
    {
        if((!$parentfound && $row['site_id'] == $id) || $row['parent_id'] == $id)
        {
            $rowdata = array();
            foreach($row as $k => $v)
                $rowdata[$k] = $v;
            $cats[] = $rowdata;
            if($row['parent_id'] == $id)
                $cats = array_merge($cats, fetch_recursive($src_arr, $row['site_id'], true));
        }
    }
    return $cats;
}*/


/*$id=1;

function tree($id)

{

echo $id;
    $result = mysql_query("SELECT name, id from table_1 WHERE id_parent = '$id'");
     if(mysql_num_rows($result) != 0)
       {
            echo "<ul>";
            while($row = mysql_fetch_array($result))
            {             
                 echo "<li>",$row['name'],"</li>";
                 tree($row['id']);
            }
            echo "</ul>";
       }
}*/

function hierarchy($fname) {
    
	$result = mysql_query("SELECT name, id from table_1 WHERE id_parent = '$fname'");
     if(mysql_num_rows($result) != 0)
       {
            echo "<ul>";
            while($row = mysql_fetch_array($result))
            {             
                 echo "<li>",$row['name'],"</li>";
                 hierarchy($row['id']);
            }
            echo "</ul>";
       }
}

hierarchy(1);
?>
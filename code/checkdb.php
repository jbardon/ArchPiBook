<!-- /usr/share/nginx/html/checkdb.php -->

<?php

if (!$link = mysql_connect('localhost', 'root', '')) {
    echo 'Could not connect to mysql';
    exit;
}

if (!mysql_select_db('mysql', $link)) {
    echo 'Could not select database';
    exit;
}

$sql    = 'SELECT host, user, password FROM user';
$result = mysql_query($sql, $link);

if (!$result) {
    echo "DB Error, could not query the database\n";
    echo 'MySQL Error: ' . mysql_error();
    exit;
}

echo '<table><tr><th>host</th><th>user</th><th>password</th></tr>';
while ($row = mysql_fetch_assoc($result)) {
    echo '<tr><td>' . 
         $row['host'] . '</td><td>' . 
         $row['user'] . '</td><td>' .
         $row['password'] . '</td></tr>';
}
echo '</table>';

mysql_free_result($result);

?>
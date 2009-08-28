<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Connection
 *
 * @author admin
 */

class Connection {
    //put your code here
    const server="127.0.0.1";
    const username="root";
    const password="";
  
    public static function createConnection(){
        $con=mysql_connect(Connection::server, Connection::username,Connection::password);
        if(!$con){
            NetDebug::trace('Could Not connect');
             die('Could not connect: ' . mysql_error());
        }
        mysql_select_db("chess", $con);
        return $con;
    }
    public static function closeConnection($con){
        mysql_close($con);
    }
}
?>

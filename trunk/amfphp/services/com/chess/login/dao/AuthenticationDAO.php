<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of AuthenticationDAO
 *
 * @author admin
 */
include_once("../../util/Connection.php");
class AuthenticationDAO {
    //put your code here
    
    public function isUsernameAvailable($username){
        NetDebug::trace('Checking Username');

        $con=Connection::createConnection();
        $result = mysql_query("SELECT * FROM user WHERE nickname = '$username'");
        $flagToReturn=false;
        
        if(mysql_num_rows($result) == 1){
            //already exist
        }else{
            $flagToReturn=true;
        }
        NetDebug::trace($flagToReturn);
        Connection::closeConnection($con);
        return $flagToReturn;
     
    }

    public function addUserName($username){
        NetDebug::trace('Adding Username');
        $con=Connection::createConnection();
        $result = mysql_query("INSERT INTO user (nickname) VALUES ('$username')");
        mysql_query("commit");
        Connection::closeConnection($con);
    }
}
?>

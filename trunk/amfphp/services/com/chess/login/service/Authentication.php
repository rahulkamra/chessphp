<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Authentication
 *
 * @author kaal
 */
include_once("../dao/AuthenticationDAO.php");

class Authentication {
    //put your code here
    
    function Authentication(){
        $this->methodTable = array
        (
            "chkUsername" => array
            (
                "access" => "remote",
                "description" => "Authentication"
            )
        );
    }
        
        function chkUsername($username){
            $auth=new AuthenticationDAO;
            $availability=$auth->isUsernameAvailable($username);
            if($availability){
                //add in the database and return true
                $auth->addUserName($username);
                return true;
            }else{
               //username already in use
               return false;
            }
        }
}
?>

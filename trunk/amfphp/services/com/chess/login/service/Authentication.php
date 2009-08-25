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
        NetDebug::trace($_SESSION['userlist']+1);
        $_SESSION['userlist']=$_SESSION['userlist']+1;
        NetDebug::trace($_SESSION['userlist']+1);
        /*if(isset($GLOBALS['userlist'])){
               $GLOBALS['userlist']=$GLOBALS['userlist']+1;
               NetDebug::trace('here');
        }else{
            $GLOBALS['userlist']=1;
            NetDebug::trace('there');
        }*/
        return $GLOBALS['userlist'];
        
    }
}
?>

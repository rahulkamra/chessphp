<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ChatUtil
 *
 * @author hp
 */


class ChatUtil {
    //put your code here
    function synchronizeChat($chatMapId){

            $syn=new ChatDAO();
            if($chatMapId==0){
                return $syn->getLastObject();
            }else{
                NetDebug::printr("Rahul");
                return $syn->getChatById($chatMapId);
            }
           // return $chat;

        }
}
?>

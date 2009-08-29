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
            $syn->getChatById($chatMapId);
           // return $chat;

        }
}
?>

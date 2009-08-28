<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Chat
 *
 * @author kaal
 */
include_once("../dao/ChatDAO.php");
include_once("../model/ChatModel.php");

class Chat {
    //put your code here

    function Chat(){
        $this->methodTable = array
        (
            "saveChat" => array
            (
                "access" => "remote",
                "description" => "Chat"
            )
        );
    }

        function saveChat($to,$message){
            $chat= new ChatModel();
            NetDebug::trace("Parr1".$message);

            date_default_timezone_set ("Asia/Calcutta");
            $date="";
            $chat->message=$message;
            $chat->from= $_SESSION['loggedin_user'];
            NetDebug::trace("From".$chat->from);
            $chat->to=$to;
            if($to==NULL){
                //Group Chat
            }else{
                //One 2 one chat
            }
            $save=new ChatDAO;
            $save->saveChatWrapper($chat);
            return $chat;

        }
}
?>

<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
include_once("../../util/Connection.php");
include_once("../model/ChatModel.php");

class ChatDAO{

    public function saveChatWrapper($chat){
        NetDebug::trace('Saving Chat');
        $con=Connection::createConnection();
        $id=$this->saveChat($chat->from,$chat->to);
        $cmid=$this->saveChatMapping($id,$chat->message,$chat->timeStamp);
        Connection::closeConnection($con);
    }
    public function saveChat($to,$from){
        $result = mysql_query("INSERT INTO chat VALUES ('','$from','$to')");
        $id=mysql_insert_id();
        return $id;
    }
    public function saveChatMapping($id,$msg,$time){
        $result=mysql_query("INSERT INTO chatmapping VALUES('','$id','$msg',NOW())");
        
    }

}
?>

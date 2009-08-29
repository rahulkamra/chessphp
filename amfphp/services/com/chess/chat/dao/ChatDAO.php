<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

class ChatDAO{

    public function saveChatWrapper($chat){
        NetDebug::trace('Saving Chat');
        $con=Connection::createConnection();
        $id=$this->saveChat($chat->from,$chat->to);
        $cmid=$this->saveChatMapping($id,$chat->message,$chat->timeStamp);
        Connection::closeConnection($con);
    }
    public function saveChat($from,$to){
        $result = mysql_query("INSERT INTO chat VALUES ('','$from','$to')");
        $id=mysql_insert_id();
        return $id;
    }
    public function saveChatMapping($id,$msg,$time){
        $result=mysql_query("INSERT INTO chatmapping VALUES('','$id','$msg',NOW())");
        
    }
    public function getChatById($chatMapId){
        $con=Connection::createConnection();
        $result=mysql_query("SELECT * FROM chatmapping,chat WHERE chat.id=chatmapping.chatid and chatmapping.chatid>'$chatMapId' and chat.to=0");
       // $dataSet=mysql_fetch_array($result);
        while($row = mysql_fetch_array($result))
        {
            NetDebug::printr($row['']);
             echo "<br />";
        }


        
        Connection::closeConnection($con);
    }

}
?>

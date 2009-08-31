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
        mysql_query("commit");
        $chat->chatId=$cmid;
        Connection::closeConnection($con);
    }
    
    public function checkForChat($from,$to){
        $result = mysql_query("SELECT * from chat WHERE chat.from='$from' AND chat.to='$to'");
         if(mysql_num_rows($result) == 1){
             //means already exist return id
             $tempArray=mysql_fetch_array($result);
          
             NetDebug::trace($tempArray[0]);
             return $tempArray[0];
        }else{
            //retun zero so that a new row can be inserted
            return 0;
        }
    }
    public function saveChat($from,$to){
        $id=$this->checkForChat($from, $to);
        if($id != 0){
            return $id;
        }else{
            //insert
            $result = mysql_query("INSERT INTO chat VALUES (NULL,'$from','$to')");
            $id=mysql_insert_id();
            NetDebug::trace('Ok');
            return $id;
        }
        
    }
    public function saveChatMapping($id,$msg,$time){
        $result=mysql_query("INSERT INTO chatmapping VALUES(NULL,'$id','$msg',NOW())");
        return mysql_insert_id();
    }
    public function getChatById($chatMapId){
        $con=Connection::createConnection();
        NetDebug::printr($chatMapId);
        
        $result=mysql_query("SELECT chatmapping.id,chat.from,chatmapping.text,chatmapping.timestamp,user.nickname FROM chatmapping,chat,user WHERE chat.id=chatmapping.chatid and chatmapping.id >'$chatMapId' and chat.to=0 and user.id=chat.from");
       $arrayToReturn = array();
        while($row = mysql_fetch_array($result)){
            $eachObject = new ChatSyncModel();
            $eachObject->cmid=$row['id'];
            $eachObject->fromId=$row['from'];
            $eachObject->fromName=$row['nickname'];
            $eachObject->text=$row['text'];
            $eachObject->timeStamp=$row['timestamp'];
            array_push($arrayToReturn, $eachObject);
        }
        Connection::closeConnection($con);
        NetDebug::printr($arrayToReturn);

        return $arrayToReturn;
        
    }

    public function getLastObject(){
        $con=Connection::createConnection();
        $result=mysql_query("SELECT chatmapping.id,chat.from,chatmapping.text,chatmapping.timestamp,user.nickname FROM chatmapping,chat,user WHERE chat.id=chatmapping.chatid and chatmapping.id>'$chatMapId' and chat.to=0 and user.id=chat.from ORDER BY id DESC LIMIT 1");
        
        $row=mysql_fetch_row($result);
        NetDebug::printr($row);
        $arrayToReturn = array();
        
        $eachObject = new ChatSyncModel();
        $eachObject->cmid=$row[0];
        $eachObject->fromId=$row[1];
        $eachObject->text=$row[2];
        $eachObject->timeStamp=$row[3];
        $eachObject->fromName=$row[4];
        
        array_push($arrayToReturn, $eachObject);
            
        Connection::closeConnection($con);
        return $arrayToReturn;
    }

}
?>

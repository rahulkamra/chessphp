<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of LobbyDAO
 *
 * @author admin
 */
class LobbyDAO {
    //put your code here

    //Assumptions --> first row i.e id=1 belong to lobbyname = lobby1
    //so on and so forth
    
    function addNewPlayerToLobby($playerId,$lobbyName){
        $conn=Connection::createConnection();
        if($this->IsLobbyFree($lobbyName)){
             
             
        }
        Connection::closeConnection($con);

    }

    function updateLobby($lobbyName,$playerId){
        
    }
    
    function IsLobbyFree($lobbyName){
        $result = mysql_query("SELECT * from game WHERE game.lobbyname='$lobbyName'");
        $tempArray=mysql_fetch_array($result);
        
        
    }

    function getLatestLobbyInfo(){
        $con=Connection::createConnection();
        $result = mysql_query("select game.id as id, game.lobbyname as lobbyname ,user.nickname as nickname1 ,user.id as player1Id, t3.nickname as nickname2, t3.id as player2Id from game left join user on (game.player1 = user.id) left join (select * from user) t3 on (game.player2 = t3.id);");
        //NetDebug::trace($result);
        $arrayToReturn=array();
        while($row = mysql_fetch_array($result)){
            $eachObject = new LobbyInfoModel();
            $eachObject->firstPlayerId=$row['player1Id'];
            $eachObject->firstPlayerName=$row['nickname1'];
            $eachObject->secondPlayerId=$row['player2Id'];
            $eachObject->secondPlayerName=$row['nickname2'];
            $eachObject->lobbyName=$row['lobbyname'];

            //redundant data i know still for fast programming i need will fix in next version
            if($eachObject->secondPlayerName=='' || $eachObject->firstPlayerName == ''){
                $eachObject->isFree=true;
            }else{
                $eachObject->isFree=false;
            }
            array_push($arrayToReturn,$eachObject);
         }
        Connection::closeConnection($con);
        return $arrayToReturn;
    }
}
?>

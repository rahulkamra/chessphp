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
        
    }
}
?>

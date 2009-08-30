<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Synchronize
 *
 * @author hp
 */
include_once("../model/SynchronizeRequestModel.php");
include_once("../model/SynchronizeResponseModel.php");
include_once("../../chat/util/ChatUtil.php");
include_once("../../chat/dao/ChatDAO.php");
include_once("../../chat/model/ChatModel.php");
include_once("../../util/Connection.php");
include_once("../../chat/model/ChatSyncModel.php");

class Synchronize {
    //put your code here
    function Synchronize(){
        $this->methodTable = array
        (
            "synchronizeWithServer" => array
            (
                "access" => "remote",
                "description" => "Synchronize"
            )
        );
    }

    public function synchronizeWithServer($synModel){
        $objToReturn= new SynchronizeResponseModel();
        $lastChatId=$synModel[SynchronizeRequestModel::lastChatId];
        //$lastChatId=0;
        NetDebug::printr("Partestr1".$lastChatId);

        $syn=new ChatUtil();
        $chatSyncArray=$syn->synchronizeChat($lastChatId);
        $objToReturn->chatSynArray=$chatSyncArray;
        return $objToReturn;



    }
}
?>

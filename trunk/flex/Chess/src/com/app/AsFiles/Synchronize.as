// ActionScript file
import com.app.models.ChessUIConstants;

import flash.events.TimerEvent;
import flash.utils.Timer;

public  var synTimer:Timer=new Timer(ChessUIConstants.POLLING_TIME);

public function timerInit():void{
	synTimer.addEventListener(TimerEvent.TIMER,synchronize);
}
public function synchronize(event:TimerEvent):void{
	Chess.chessUIController.syncronizeChat();
}
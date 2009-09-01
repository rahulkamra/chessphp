// ActionScript file
import com.app.models.GameUIConstants;

import flash.events.TimerEvent;
import flash.utils.Timer;

public  var synTimer:Timer=new Timer(GameUIConstants.POLLING_TIME);

public function timerInit():void{
	synTimer.addEventListener(TimerEvent.TIMER,synchronize);
}
public function synchronize(event:TimerEvent):void{
	Game.chessUIController.syncronizeChat();
}
package
{	
	//speech recognition packages
	import com.bmcdo248.SpeechExtension.events.SpeechEvent;
	import com.bmcdo248.SpeechExtension.speechDiplomat.SpeechDiplomat;
	
	import flash.display.Sprite;
	
	
	public class Conversation
	{
		//speech recognition object
		private var speechDiplomat:SpeechDiplomat;
		public var characterVector:Vector.<Character>;
		public var lineVector:Vector.<Line>;
		public var displayer:Sprite;

		public function Conversation(characterVector:Vector.<Character>, lineVector:Vector.<Line>, displayer:Sprite)
		{
			this.characterVector = characterVector;
			this.lineVector = lineVector;
			this.displayer = displayer;
			
			initializeSpeech();
			initalizeUI();
			
			trace(characterVector[lineVector[0].speakerID].charName);
			trace(lineVector[0].lineText + " " + lineVector[0].responses);
		}
		
		private function initalizeUI():void
		{
			var square: Sprite = new Sprite();
			square.graphics.beginFill(0x000000);
			square.graphics.drawRect(0,0,1000,50);
			square.graphics.endFill();
			square.x = 0;
			square.y = 0;
			displayer.addChild(square);
		}
		
		private function initializeSpeech():void
		{				
			speechDiplomat = new SpeechDiplomat();
			
			//begins speech recognition using the SAPI native extension.
			speechDiplomat.addEventListener(SpeechEvent.DATA, dataEventHandler);
			speechDiplomat.startSpeech()
		}
		
		private function dataEventHandler(e:SpeechEvent):void
		{
			//Get the data from "e.data"
		}
		
		private function finalizeApp():void
		{
			speechDiplomat.dispose();
		}
	}
}
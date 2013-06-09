package
{	
	//speech recognition packages
	import com.bit101.components.Label;
	import com.bit101.components.Text;
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
			var topBorder: Sprite = new Sprite();
			topBorder.graphics.beginFill(0x000000);
			topBorder.graphics.drawRect(0,0,1000,50);
			topBorder.graphics.endFill();
			topBorder.x = 0;
			topBorder.y = 0;
			displayer.addChild(topBorder);
			
			var speakerName:Label = new Label();
			speakerName.text = "Current Speaker's Name";
			speakerName.x = 30;
			speakerName.y = 30;
			displayer.addChild(speakerName);
			
			var currentObjective:Label = new Label();
			currentObjective.text = "This is the players current objective.";
			currentObjective.x = 200;
			currentObjective.y = 7;
			displayer.addChild(currentObjective);
			
			var bottomBorder: Sprite = new Sprite();
			bottomBorder.graphics.beginFill(0x000000);
			bottomBorder.graphics.drawRect(0,0,1000,50);
			bottomBorder.graphics.endFill();
			bottomBorder.x = 0;
			bottomBorder.y = 325;
			displayer.addChild(bottomBorder);
			
			var response1:Label = new Label;
			response1.text = "This is Dialog Response 1 It is pretty short.";
			response1.x = 30;
			response1.y = 325;
			displayer.addChild(response1);
			
			var response2:Label = new Label;
			response2.text = "This is Dialog Response 2 It Is a bit longer than dialog response 1.";
			response2.x = 30;
			response2.y = 340;
			displayer.addChild(response2);
			
			var response3:Label = new Label;
			response3.text = "This is Dialog Response 3 It Is a bit longer than both of the others but especially longer than dialog response 1";
			response3.x = 30;
			response3.y = 355;
			displayer.addChild(response3);
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
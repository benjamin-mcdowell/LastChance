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

		public function Conversation(characterVector:Vector.<Character>, lineVector:Vector.<Line>)
		{
			this.characterVector = characterVector;
			this.lineVector = lineVector;
			
			initializeSpeech();
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
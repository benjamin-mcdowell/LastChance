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
		private var speechPhrase:String = "";
		
		//dialog components
		public var lineVector:Vector.<Line>;
		public var displayer:Sprite;
		
		//UI Elements
		public var topBorder: Sprite = new Sprite();
		public var speakerName:Label = new Label();
		public var currentPhrase:Label = new Label();		
		public var bottomBorder: Sprite = new Sprite();
		public var response1:Label = new Label;
		public var response2:Label = new Label;
		public var response3:Label = new Label;

		public function Conversation(lineVector:Vector.<Line>, displayer:Sprite)
		{
			//bring in vectors from episode class
			this.lineVector = lineVector;
			this.displayer = displayer;
			
			//initalization steps
			initializeSpeech();
			initalizeUI();
			
			//begin processing lines
			dialogLoop();
		}
				
		private function initializeSpeech():void
		{	
			//begins speech recognition using the SAPI native extension.
			speechDiplomat = new SpeechDiplomat();
			speechDiplomat.addEventListener(SpeechEvent.DATA, dataEventHandler);
			speechDiplomat.startSpeech()
		}
		
		private function initalizeUI():void
		{
			topBorder.graphics.beginFill(0x000000);
			topBorder.graphics.drawRect(0,0,1000,50);
			topBorder.graphics.endFill();
			topBorder.x = 0;
			topBorder.y = 0;
			displayer.addChild(topBorder);
			
			speakerName.text = "Blank Speaker";
			speakerName.x = 30;
			speakerName.y = 30;
			displayer.addChild(speakerName);
			
			currentPhrase.text = "Blank Recognizer Phrase";
			currentPhrase.x = 200;
			currentPhrase.y = 7;
			displayer.addChild(currentPhrase);
			
			bottomBorder.graphics.beginFill(0x000000);
			bottomBorder.graphics.drawRect(0,0,1000,50);
			bottomBorder.graphics.endFill();
			bottomBorder.x = 0;
			bottomBorder.y = 325;
			displayer.addChild(bottomBorder);
			
			response1.text = "Blank Dialog Response 1";
			response1.x = 30;
			response1.y = 325;
			displayer.addChild(response1);
			
			response2.text = "Blank Dialog Response 2";
			response2.x = 30;
			response2.y = 340;
			displayer.addChild(response2);
			
			response3.text = "Blank Dialog Response 3";
			response3.x = 30;
			response3.y = 355;
			displayer.addChild(response3);
		}
		
		private function finalizeApp():void
		{
			speechDiplomat.dispose();
		}
		
		private function dataEventHandler(e:SpeechEvent):void
		{
			//get the current phrase from the recognizer as e.data
			speechPhrase = e.data;
			currentPhrase.text = speechPhrase;
		}
		
		//primary loop for the conversation
		private function dialogLoop():void
		{
			for each (var line:Line in lineVector) 
			{
				//reads in the data for this line
				speakerName.text = lineVector[line.lineID].speaker;
				response1.text = lineVector[lineVector[line.lineID].responses[0]].lineText;
				response2.text = lineVector[lineVector[line.lineID].responses[1]].lineText;
				response3.text = lineVector[lineVector[line.lineID].responses[2]].lineText;
				var allWords:String = response1.text.toLowerCase() + " " + response2.text.toLowerCase() + " " + response3.text.toLowerCase();
				
				//Takes all words from the current line as input and removes all words occuring more than once.
				for each (var word:String in allWords.split(" "))
				{
					var countArray:Array = allWords.split(" " + word + " ");
					var count:int = countArray.length - 1;
					
					if(count >= 2)
					{
						for (var i:Number=0; i<count; i++)
						{ 
							allWords = allWords.replace(" " + word + " ", " ");
						}
					}
				}
				
				//uses the processed words list, to determine the unique words in each response
				var response1String:String = response1.text.toLowerCase();
				var response1Array:Array = response1String.split(" ");
				var response1Processed:String = "";
				
				var response2String:String = response2.text.toLowerCase();
				var response2Array:Array = response2String.split(" ");
				var response2Processed:String = "";
				
				var response3String:String = response3.text.toLowerCase();
				var response3Array:Array = response3String.split(" ");
				var response3Processed:String = "";
				
				for each (var processedWord:String in allWords.split(" "))
				{
					//processing response 1
					for each (var resp1Word:String in response1Array)
					{						
						if(processedWord == resp1Word)
						{
							response1Processed = response1Processed + resp1Word + " ";
							break;
						}
					}
					
					//processing response 2
					for each (var resp2Word:String in response2Array)
					{						
						if(processedWord == resp2Word)
						{
							response2Processed = response2Processed + resp2Word + " ";
							break;
						}
					}
					
					//processing response 3
					for each (var resp3Word:String in response3Array)
					{						
						if(processedWord == resp3Word)
						{
							response3Processed = response3Processed + resp3Word + " ";
							break;
						}
					}
					
				}
				
				//Display Finished Lists
				//trace("finished response 1 list: " + response1Processed);
				//trace("finished response 2 list: " + response2Processed);
				//trace("finished response 3 list: " + response3Processed);
			}						
		}
	}
}
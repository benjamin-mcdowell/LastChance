package
{
	import com.bit101.components.Label;
	import flash.display.Sprite;
	
	public class Episode
	{
		public function Episode(x:XML, displayer:Sprite)
		{	
			//Count of the number of segments in the episode XML file.
			var numOfSegments:int = x.SEGMENT.length()
			for (var i:int=0; i<numOfSegments; i++)
			{
				//trace("Proccessing " + i + "th Segment");
				
				if(x.SEGMENT[i].@TYPE == "conversation")
				{	
					//Initalize Lines
					var lineVector:Vector.<Line>;
					lineVector = new Vector.<Line>();
					
					//Count of the number of lines in the segment
					var numOfLines:int = x.SEGMENT[i].LINE.length()
					for (var j:int=0; j<numOfLines; j++)
					{
						//trace("Proccessing " + j + "th Line");
						var lineID:int = x.SEGMENT[i].@LINE[j];
						
						var speaker:String = x.SEGMENT[i].LINE[j].SPEAKER;
						var varLineText:String = x.SEGMENT[i].LINE[j].TEXT;
						var responses:String = x.SEGMENT[i].LINE[j].RESPONSES;
						var passCount:int = x.SEGMENT[i].LINE[j].PASSCOUNT;
						var failCount:int = x.SEGMENT[i].LINE[j].FAILCOUNT;
						var pathToMP3:String = x.SEGMENT[i].LINE[j].PATHTOMP3;
						
						var line:Line;
						line = new Line(lineID, speaker, varLineText, responses, passCount, failCount, pathToMP3);
						lineVector[j] = line;
						
						//trace(characterVector[lineVector[j].speakerID].charName);
						//trace(lineVector[j].lineText + " " + lineVector[j].responses);
					}
					
					//takes the lines of the conversation and the graphic displayer as input
					var conversation:Conversation;
					conversation = new Conversation(lineVector, displayer);
				}
				else if(x.SEGMENT[i].@TYPE == "adventure")
				{
					var adventure:Adventure;
					adventure = new Adventure();
				}
				else if(x.SEGMENT[i].@TYPE == "cutscene")
				{
					var cutscene:Cutscene;
					cutscene = new Cutscene();
				}
			}			
		}
	}
}
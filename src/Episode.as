package
{
	import com.bit101.components.Label;
	import flash.display.Sprite;
	
	public class Episode
	{
		public function Episode(x:XML, displayer:Sprite)
		{	
			var characterVector:Vector.<Character>;
			characterVector = new Vector.<Character>();
			
			var numOfParticipants:int = x.PARTICIPANTS.CHARACTER.length()
			for (var d:int=0; d<numOfParticipants; d++)
			{
				var charName:String = x.PARTICIPANTS.CHARACTER[d].NAME;
				var charPathToAvi:String = x.PARTICIPANTS.CHARACTER[d].IMAGE;
				
				var character:Character;
				character = new Character(charName, charPathToAvi);
				characterVector[d] = character;
				
				//trace(characterVector[d].charName + " " + characterVector[d].pathToAvi);
			}
			
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
						
						var speakerStr:String = x.SEGMENT[i].LINE[j].SPEAKER;
						var speakerID:int = -1;
						
						for (var k:int=0; k < characterVector.length; k++)
						{
							if(speakerStr == characterVector[k].charName)
							{
								speakerID = k;
								break;
							}
						}
						
						if (speakerID == -1)
						{
							trace("Character no haz exist. You figure it out.");
						}
						
						var varLineText:String = x.SEGMENT[i].LINE[j].TEXT;
						var responses:String = x.SEGMENT[i].LINE[j].RESPONSES;
						var passCount:int = x.SEGMENT[i].LINE[j].PASSCOUNT;
						var failCount:int = x.SEGMENT[i].LINE[j].FAILCOUNT;
						var pathToMP3:String = x.SEGMENT[i].LINE[j].PATHTOMP3;
						
						var line:Line;
						line = new Line(lineID, speakerID, varLineText, responses, passCount, failCount, pathToMP3);
						lineVector[j] = line;
						
						//trace(characterVector[lineVector[j].speakerID].charName);
						//trace(lineVector[j].lineText + " " + lineVector[j].responses);
					}
					
					var conversation:Conversation;
					conversation = new Conversation(characterVector, lineVector, displayer);
				}
				else if(x.SEGMENT[i].@TYPE == "adventure")
				{
					
				}
				else if(x.SEGMENT[i].@TYPE == "cutscene")
				{
					
				}
			}			
		}
	}
}
package
{
	public class Line
	{
		public var lineID : int;
		public var speaker : String;
		public var lineText : String;
		public var responses : Array;
		public var passCount : int;
		public var failCount : int;
		public var pathToMP3 : String;
		
		public function Line(lineID:int, speaker:String, lineText:String, responses:String, passCount:int, failCount:int, pathToMP3:String)
		{
			this.lineID = lineID;
			this.speaker = speaker;
			this.lineText = lineText;
			this.responses = responses.split(",");
			this.passCount = passCount;
			this.failCount = failCount;
			this.pathToMP3 = pathToMP3;
		}
		
	}
}
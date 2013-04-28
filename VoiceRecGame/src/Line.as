package
{
	public class Line
	{
		public var lineID : int;
		public var speakerID : int;
		public var lineText : String;
		public var responses : Array;
		public var passCount : int;
		public var failCount : int;
		public var pathToMP3 : String;
		
		public function Line(lineID:int, speakerID:int, lineText:String, responses:String, passCount:int, failCount:int, pathToMP3:String)
		{
			this.lineID = lineID;
			this.speakerID = speakerID;
			this.lineText = lineText;
			this.responses = responses.split(",");
			this.passCount = passCount;
			this.failCount = failCount;
			this.pathToMP3 = pathToMP3;
		}
		
	}
}
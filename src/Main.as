package
{	
	//default imports
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	
	public class Main extends Sprite
	{
		//Load Episode Here
		private var loader:URLLoader = new URLLoader(new URLRequest("../episodes/TestEpisode.xml"));
		
		public function Main()
		{
			loader.addEventListener(Event.COMPLETE, episodeLoaded);
		}
		
		private function episodeLoaded(e:Event):void
		{
			var xml:XML = new XML(loader.data);
			
			var displayer:Sprite = new Sprite();
			stage.addChild(displayer);
			displayer.graphics.beginFill(0x0000FF, 0.5);
			displayer.graphics.drawRect(0,0,700,1000);
			displayer.graphics.endFill();
			displayer.x = -40;
			displayer.y = 0;
			
			var episode:Episode;
			episode = new Episode(xml,displayer);
		}
	}
}
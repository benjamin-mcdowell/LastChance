package
{	
	//default imports
	import flash.display.Sprite;
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
			
			var episode:Episode;
			episode = new Episode(xml);
		}
	}
}
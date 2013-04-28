package com.bmcdo248.FMSConnection 
{
	/**This class extends the standard net connection class to allow more functionality and
	 * reusabilty for multiple aplications **/
	import flash.events.AsyncErrorEvent;
	import flash.events.IOErrorEvent;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.NetConnection;
	import flash.net.Responder;
	
	
	/**Events for main project to listen for **/
	[Event(name="onConnect", type="flash.events.NetStatusEvent")]
	[Event(name="onFail", type="flash.events.NetStatusEvent")]
	public class CustomNetConnection extends NetConnection
	{
	
		
		public function CustomNetConnection()
		{
			super();
			addEventListener(NetStatusEvent.NET_STATUS, onNetStatus);
			addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
			addEventListener(AsyncErrorEvent.ASYNC_ERROR, onAsyncError);
			addEventListener(IOErrorEvent.IO_ERROR, onIOError);
		}
		/**When using this class use initConnection() instead of 
		 * netConnection.connect()**/
		public function initConnection(command:String, ... arguments):void
		{
			arguments.unshift(command);
			super.connect.apply(this, arguments);
			
		}
		/**Net status listener to handle situations returned **/
		private function onNetStatus( e:NetStatusEvent ):void
		{
			var code:String = e.info.code;
			trace("onNetStatus "+code);
			
			switch( code ) {
				case "NetConnection.Connect.Success":
					dispatchEvent(new NetStatusEvent("onConnect",false,false, e.info));
						
					break;
				
				case "NetStream.Play.StreamNotFound":
					
					
					break;
				
				case "NetConnection.Call.Failed":
					dispatchEvent(new NetStatusEvent("onFail",false,false, e.info));
					
					break;
				
				case "NetStream.Play.InsufficientBW":
					
					
					break;
				
				case "NetConnection.Connect.Closed":
					
					break;
				
				case "NetConnection.Connect.Rejected":
					
					
					break;
				
			}
		};
		
		public function onSecurityError(event:SecurityErrorEvent):void
		{
			
		}
		public function onAsyncError(event:AsyncErrorEvent):void
		{
			
		}
		public function onIOError(event:IOErrorEvent):void
		{
			
		}
	}
}
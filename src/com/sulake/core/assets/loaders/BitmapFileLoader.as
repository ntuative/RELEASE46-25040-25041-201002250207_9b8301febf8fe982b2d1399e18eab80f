package com.sulake.core.assets.loaders
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   
   public class BitmapFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_15:Loader;
      
      protected var var_926:String;
      
      protected var _type:String;
      
      protected var var_1096:LoaderContext;
      
      public function BitmapFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         var_926 = param2 == null ? "" : param2.url;
         _type = param1;
         var_15 = new Loader();
         var_1096 = new LoaderContext();
         var_1096.checkPolicyFile = true;
         var_15.contentLoaderInfo.addEventListener(Event.COMPLETE,loadEventHandler);
         var_15.contentLoaderInfo.addEventListener(Event.UNLOAD,loadEventHandler);
         var_15.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         var_15.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         var_15.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_15.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null && param2.url != null)
         {
            var_15.load(param2,var_1096);
         }
      }
      
      public function get bytesTotal() : uint
      {
         return var_15.contentLoaderInfo.bytesTotal;
      }
      
      public function load(param1:URLRequest) : void
      {
         var_926 = param1.url;
         var_15.load(param1,var_1096);
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            var_15.contentLoaderInfo.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_15.contentLoaderInfo.removeEventListener(Event.UNLOAD,loadEventHandler);
            var_15.contentLoaderInfo.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            var_15.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_15.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_15.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            try
            {
               var_15.close();
            }
            catch(e:*)
            {
            }
            var_15.unload();
            var_15 = null;
            _type = null;
            var_926 = null;
         }
      }
      
      public function get mimeType() : String
      {
         return _type;
      }
      
      public function get url() : String
      {
         return var_926;
      }
      
      public function get bytesLoaded() : uint
      {
         return var_15.contentLoaderInfo.bytesLoaded;
      }
      
      public function get content() : Object
      {
         return var_15.content;
      }
      
      public function get loaderContext() : LoaderContext
      {
         return var_1096;
      }
   }
}

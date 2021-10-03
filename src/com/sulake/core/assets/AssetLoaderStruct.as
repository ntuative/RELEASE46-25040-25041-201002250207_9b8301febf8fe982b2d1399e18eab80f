package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_720:IAssetLoader;
      
      private var var_1123:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         var_1123 = param1;
         var_720 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return var_720;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_720 != null)
            {
               if(true)
               {
                  var_720.dispose();
                  var_720 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return var_1123;
      }
   }
}

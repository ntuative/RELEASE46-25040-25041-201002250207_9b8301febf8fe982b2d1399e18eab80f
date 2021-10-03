package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetColoursEvent extends Event
   {
       
      
      private var var_1335:Array;
      
      private var var_2154:String;
      
      private var var_2156:String;
      
      private var var_2155:String;
      
      public function CatalogWidgetColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_COLOUR_ARRAY,param5,param6);
         var_1335 = param1;
         var_2154 = param2;
         var_2156 = param3;
         var_2155 = param4;
      }
      
      public function get colours() : Array
      {
         return var_1335;
      }
      
      public function get backgroundAssetName() : String
      {
         return var_2154;
      }
      
      public function get colourAssetName() : String
      {
         return var_2156;
      }
      
      public function get chosenColourAssetName() : String
      {
         return var_2155;
      }
   }
}

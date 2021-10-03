package com.sulake.habbo.widget.events
{
   public class RoomWidgetDimmerStateUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const DIMMER_STATE:String = "RWDSUE_DIMMER_STATE";
       
      
      private var var_1014:int;
      
      private var _color:uint;
      
      private var var_1013:int;
      
      private var var_1790:int;
      
      private var var_33:int;
      
      public function RoomWidgetDimmerStateUpdateEvent(param1:int, param2:int, param3:int, param4:uint, param5:uint, param6:Boolean = false, param7:Boolean = false)
      {
         super(DIMMER_STATE,param6,param7);
         var_33 = param1;
         var_1790 = param2;
         var_1014 = param3;
         _color = param4;
         var_1013 = param5;
      }
      
      public function get brightness() : uint
      {
         return var_1013;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectId() : int
      {
         return var_1014;
      }
      
      public function get state() : int
      {
         return var_33;
      }
      
      public function get presetId() : int
      {
         return var_1790;
      }
   }
}

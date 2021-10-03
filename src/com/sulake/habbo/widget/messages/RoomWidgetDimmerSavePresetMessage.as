package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_649:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_1655:int;
      
      private var var_1654:int;
      
      private var var_1981:Boolean;
      
      private var var_1013:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_649);
         var_1654 = param1;
         var_1655 = param2;
         _color = param3;
         var_1013 = param4;
         var_1981 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_1655;
      }
      
      public function get presetNumber() : int
      {
         return var_1654;
      }
      
      public function get brightness() : int
      {
         return var_1013;
      }
      
      public function get apply() : Boolean
      {
         return var_1981;
      }
   }
}

package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_977:String = "select_outfit";
       
      
      private var var_2179:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_977);
         var_2179 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_2179;
      }
   }
}

package com.sulake.habbo.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_244:String = "RWFAM_MOVE";
      
      public static const const_718:String = "RWFUAM_ROTATE";
      
      public static const const_731:String = "RWFAM_PICKUP";
       
      
      private var var_1625:int = 0;
      
      private var var_2124:int = 0;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int)
      {
         super(param1);
         var_1625 = param2;
         var_2124 = param3;
      }
      
      public function get furniId() : int
      {
         return var_1625;
      }
      
      public function get furniCategory() : int
      {
         return var_2124;
      }
   }
}

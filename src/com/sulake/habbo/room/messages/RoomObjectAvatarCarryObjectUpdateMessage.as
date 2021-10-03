package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1040:int;
      
      private var var_1247:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_1040 = param1;
         var_1247 = param2;
      }
      
      public function get itemType() : int
      {
         return var_1040;
      }
      
      public function get itemName() : String
      {
         return var_1247;
      }
   }
}

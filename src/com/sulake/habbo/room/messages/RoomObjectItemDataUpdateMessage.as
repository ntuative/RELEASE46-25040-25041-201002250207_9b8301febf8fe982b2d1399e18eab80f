package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class RoomObjectItemDataUpdateMessage extends RoomObjectUpdateMessage
   {
       
      
      private var var_1187:String;
      
      public function RoomObjectItemDataUpdateMessage(param1:String)
      {
         super(null,null);
         var_1187 = param1;
      }
      
      public function get method_3() : String
      {
         return var_1187;
      }
   }
}

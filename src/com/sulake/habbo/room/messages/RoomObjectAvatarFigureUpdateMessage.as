package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1896:String;
      
      private var var_566:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_566 = param1;
         var_1896 = param2;
      }
      
      public function get race() : String
      {
         return var_1896;
      }
      
      public function get figure() : String
      {
         return var_566;
      }
   }
}

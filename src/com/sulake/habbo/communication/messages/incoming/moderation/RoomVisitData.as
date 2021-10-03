package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_625:String;
      
      private var var_2014:int;
      
      private var var_1549:Boolean;
      
      private var _roomId:int;
      
      private var var_2015:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1549 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_625 = param1.readString();
         var_2015 = param1.readInteger();
         var_2014 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1549;
      }
      
      public function get roomName() : String
      {
         return var_625;
      }
      
      public function get enterMinute() : int
      {
         return var_2014;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_2015;
      }
   }
}

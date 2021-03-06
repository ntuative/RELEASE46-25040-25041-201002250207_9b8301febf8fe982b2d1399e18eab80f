package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitsData
   {
       
      
      private var _userName:String;
      
      private var var_102:Array;
      
      private var _userId:int;
      
      public function RoomVisitsData(param1:IMessageDataWrapper)
      {
         var_102 = new Array();
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_102.push(new RoomVisitData(param1));
            _loc3_++;
         }
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get rooms() : Array
      {
         return var_102;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}

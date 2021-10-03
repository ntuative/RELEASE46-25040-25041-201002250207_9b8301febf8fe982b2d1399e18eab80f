package com.sulake.habbo.widget.messages
{
   public class RoomWidgetVoteMessage extends RoomWidgetMessage
   {
      
      public static const const_113:String = "RWVM_VOTE_MESSAGE";
       
      
      private var var_1295:int;
      
      public function RoomWidgetVoteMessage(param1:int)
      {
         super(const_113);
         var_1295 = param1;
      }
      
      public function get vote() : int
      {
         return var_1295;
      }
   }
}

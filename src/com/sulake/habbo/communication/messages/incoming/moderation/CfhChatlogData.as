package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1018:int;
      
      private var var_1719:int;
      
      private var var_1417:int;
      
      private var var_112:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1417 = param1.readInteger();
         var_1719 = param1.readInteger();
         var_1018 = param1.readInteger();
         var_112 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1417);
      }
      
      public function get reportedUserId() : int
      {
         return var_1018;
      }
      
      public function get callerUserId() : int
      {
         return var_1719;
      }
      
      public function get callId() : int
      {
         return var_1417;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_112;
      }
   }
}

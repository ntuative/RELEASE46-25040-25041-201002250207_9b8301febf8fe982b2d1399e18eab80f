package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1526:String;
      
      private var var_1689:int;
      
      private var var_1691:int;
      
      private var var_1688:int;
      
      private var var_1690:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         var_1689 = param1.readInteger();
         var_1688 = param1.readInteger();
         var_1691 = param1.readInteger();
         var_1690 = param1.readString();
         var_1526 = param1.readString();
      }
      
      public function get msg() : String
      {
         return var_1526;
      }
      
      public function get hour() : int
      {
         return var_1689;
      }
      
      public function get minute() : int
      {
         return var_1688;
      }
      
      public function get chatterName() : String
      {
         return var_1690;
      }
      
      public function get chatterId() : int
      {
         return var_1691;
      }
   }
}

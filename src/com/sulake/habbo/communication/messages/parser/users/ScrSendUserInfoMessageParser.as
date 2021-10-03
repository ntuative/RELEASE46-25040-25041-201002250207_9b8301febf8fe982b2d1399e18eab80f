package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1641:int;
      
      private var var_1318:String;
      
      private var var_1639:int;
      
      private var var_1640:int;
      
      private var var_1642:int;
      
      private var var_1643:Boolean;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function get productName() : String
      {
         return var_1318;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_1643;
      }
      
      public function get responseType() : int
      {
         return var_1640;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_1639;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1318 = param1.readString();
         var_1639 = param1.readInteger();
         var_1641 = param1.readInteger();
         var_1642 = param1.readInteger();
         var_1640 = param1.readInteger();
         var_1643 = param1.readBoolean();
         return true;
      }
      
      public function get memberPeriods() : int
      {
         return var_1641;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_1642;
      }
   }
}

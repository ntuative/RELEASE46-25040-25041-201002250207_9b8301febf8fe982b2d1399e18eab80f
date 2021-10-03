package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_566:String;
      
      private var var_2035:int;
      
      private var var_2034:String;
      
      private var var_1027:int;
      
      private var var_1166:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1166;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1166 = param1.readInteger();
         var_2034 = param1.readString();
         var_2035 = param1.readInteger();
         var_566 = param1.readString();
         var_1027 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_2034;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_566;
      }
      
      public function get petType() : int
      {
         return var_1027;
      }
      
      public function get level() : int
      {
         return var_2035;
      }
   }
}

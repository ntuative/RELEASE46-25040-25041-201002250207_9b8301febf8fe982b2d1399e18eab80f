package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_2024:int;
      
      private var var_1255:PetData;
      
      private var var_2025:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_2024;
      }
      
      public function get petData() : PetData
      {
         return var_1255;
      }
      
      public function flush() : Boolean
      {
         var_1255 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_2025;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_2024 = param1.readInteger();
         var_2025 = param1.readInteger();
         var_1255 = new PetData(param1);
         return true;
      }
   }
}

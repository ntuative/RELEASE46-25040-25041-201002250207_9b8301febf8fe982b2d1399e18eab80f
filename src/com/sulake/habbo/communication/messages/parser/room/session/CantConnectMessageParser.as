package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1541:int = 2;
      
      public static const const_294:int = 4;
      
      public static const const_1266:int = 1;
      
      public static const const_1186:int = 3;
       
      
      private var var_975:int = 0;
      
      private var var_781:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_975;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_975 = param1.readInteger();
         if(var_975 == 3)
         {
            var_781 = param1.readString();
         }
         else
         {
            var_781 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_975 = 0;
         var_781 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_781;
      }
   }
}

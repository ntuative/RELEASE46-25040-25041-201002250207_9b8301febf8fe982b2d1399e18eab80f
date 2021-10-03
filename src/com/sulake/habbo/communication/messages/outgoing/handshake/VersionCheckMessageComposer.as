package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_2077:String;
      
      private var var_1292:String;
      
      private var var_2076:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_2076 = param1;
         var_1292 = param2;
         var_2077 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2076,var_1292,var_2077];
      }
      
      public function dispose() : void
      {
      }
   }
}

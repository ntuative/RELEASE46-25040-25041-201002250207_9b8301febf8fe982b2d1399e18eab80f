package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_332:Boolean;
      
      private var var_1221:int;
      
      private var var_1436:String;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         var_1221 = param1.readInteger();
         var_1436 = param1.readString();
         var_332 = param1.readBoolean();
      }
      
      public function get visible() : Boolean
      {
         return var_332;
      }
      
      public function get nodeName() : String
      {
         return var_1436;
      }
      
      public function get nodeId() : int
      {
         return var_1221;
      }
   }
}

package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class NavigationNodeData
   {
       
      
      private var var_1221:int;
      
      private var var_1436:String;
      
      public function NavigationNodeData(param1:int, param2:String)
      {
         super();
         var_1221 = param1;
         var_1436 = param2;
         Logger.log("READ NODE: " + var_1221 + ", " + var_1436);
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

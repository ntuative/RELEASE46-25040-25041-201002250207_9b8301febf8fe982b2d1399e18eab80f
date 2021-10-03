package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1650:String;
      
      private var var_1048:String;
      
      private var var_1649:int;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         var_1649 = param1.readInteger();
         var_1650 = param1.readString();
         var_1048 = param1.readString();
      }
      
      public function get gender() : String
      {
         return var_1048;
      }
      
      public function get figureString() : String
      {
         return var_1650;
      }
      
      public function get slotId() : int
      {
         return var_1649;
      }
   }
}

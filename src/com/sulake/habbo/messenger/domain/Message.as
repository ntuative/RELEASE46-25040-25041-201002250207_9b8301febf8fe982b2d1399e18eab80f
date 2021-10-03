package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_672:int = 2;
      
      public static const const_898:int = 6;
      
      public static const const_674:int = 1;
      
      public static const const_678:int = 3;
      
      public static const const_929:int = 4;
      
      public static const const_684:int = 5;
       
      
      private var var_2117:String;
      
      private var var_985:int;
      
      private var var_1676:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_985 = param2;
         var_1676 = param3;
         var_2117 = param4;
      }
      
      public function get time() : String
      {
         return var_2117;
      }
      
      public function get senderId() : int
      {
         return var_985;
      }
      
      public function get messageText() : String
      {
         return var_1676;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}

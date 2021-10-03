package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1773:int;
      
      private var var_1772:int = 0;
      
      private var var_1774:String;
      
      private var var_1775:int;
      
      private var var_1771:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1773 = param1;
         var_1775 = param2;
         var_1771 = param3;
         var_1774 = param4;
      }
      
      public function get length() : int
      {
         return var_1775;
      }
      
      public function get name() : String
      {
         return var_1771;
      }
      
      public function get creator() : String
      {
         return var_1774;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_1772;
      }
      
      public function get id() : int
      {
         return var_1773;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_1772 = param1;
      }
   }
}

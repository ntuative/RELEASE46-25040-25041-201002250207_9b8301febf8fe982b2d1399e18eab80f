package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1040:String;
      
      private var var_1813:int;
      
      private var var_1998:int;
      
      private var var_1500:int;
      
      private var var_2002:int;
      
      private var _category:int;
      
      private var var_2367:int;
      
      private var var_1999:int;
      
      private var var_2001:int;
      
      private var var_1997:int;
      
      private var var_1996:int;
      
      private var var_2000:Boolean;
      
      private var var_1359:String;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         var_1813 = param1;
         var_1040 = param2;
         var_1998 = param3;
         var_1997 = param4;
         _category = param5;
         var_1359 = param6;
         var_1500 = param7;
         var_2001 = param8;
         var_1999 = param9;
         var_1996 = param10;
         var_2002 = param11;
         var_2000 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_1997;
      }
      
      public function get extra() : int
      {
         return var_1500;
      }
      
      public function get stuffData() : String
      {
         return var_1359;
      }
      
      public function get groupable() : Boolean
      {
         return var_2000;
      }
      
      public function get creationMonth() : int
      {
         return var_1996;
      }
      
      public function get roomItemID() : int
      {
         return var_1998;
      }
      
      public function get itemType() : String
      {
         return var_1040;
      }
      
      public function get itemID() : int
      {
         return var_1813;
      }
      
      public function get songID() : int
      {
         return var_1500;
      }
      
      public function get timeToExpiration() : int
      {
         return var_2001;
      }
      
      public function get creationYear() : int
      {
         return var_2002;
      }
      
      public function get creationDay() : int
      {
         return var_1999;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}

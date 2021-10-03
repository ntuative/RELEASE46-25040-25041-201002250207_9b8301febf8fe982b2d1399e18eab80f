package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_1464:Array;
      
      private var var_1859:int;
      
      private var var_1858:int;
      
      private var var_1856:int;
      
      private var var_1857:int;
      
      private var _dayOffsets:Array;
      
      private var var_1860:int;
      
      private var var_1463:Array;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get dayOffsets() : Array
      {
         return _dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return var_1464;
      }
      
      public function set averagePrices(param1:Array) : void
      {
         var_1464 = param1.slice();
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         _dayOffsets = param1.slice();
      }
      
      public function get furniTypeId() : int
      {
         return var_1858;
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         var_1463 = param1.slice();
      }
      
      public function set method_1(param1:int) : void
      {
         var_1859 = param1;
      }
      
      public function get historyLength() : int
      {
         return var_1856;
      }
      
      public function get furniCategoryId() : int
      {
         return var_1857;
      }
      
      public function get offerCount() : int
      {
         return var_1860;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_1860 = param1;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1463;
      }
      
      public function get method_1() : int
      {
         return var_1859;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         var_1857 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         var_1856 = param1;
      }
      
      public function set furniTypeId(param1:int) : void
      {
         var_1858 = param1;
      }
   }
}

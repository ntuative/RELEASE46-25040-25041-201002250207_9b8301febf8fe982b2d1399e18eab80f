package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_1464:Array;
      
      private var var_1859:int;
      
      private var var_1858:int;
      
      private var var_1857:int;
      
      private var var_1856:int;
      
      private var _dayOffsets:Array;
      
      private var var_1860:int;
      
      private var var_1463:Array;
      
      public function MarketplaceItemStatsParser()
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
      
      public function get furniTypeId() : int
      {
         return var_1858;
      }
      
      public function get historyLength() : int
      {
         return var_1856;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get furniCategoryId() : int
      {
         return var_1857;
      }
      
      public function get offerCount() : int
      {
         return var_1860;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1463;
      }
      
      public function get method_1() : int
      {
         return var_1859;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1859 = param1.readInteger();
         var_1860 = param1.readInteger();
         var_1856 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _dayOffsets = [];
         var_1464 = [];
         var_1463 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _dayOffsets.push(param1.readInteger());
            var_1464.push(param1.readInteger());
            var_1463.push(param1.readInteger());
            _loc3_++;
         }
         var_1857 = param1.readInteger();
         var_1858 = param1.readInteger();
         return true;
      }
   }
}

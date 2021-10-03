package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1805:int;
      
      private var var_1537:int;
      
      private var var_1803:int;
      
      private var var_1802:int;
      
      private var var_1804:int;
      
      private var var_1536:int;
      
      private var var_1735:int;
      
      private var var_1801:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_1805;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1537;
      }
      
      public function get averagePricePeriod() : int
      {
         return var_1735;
      }
      
      public function get offerMinPrice() : int
      {
         return var_1802;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_1804;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1536;
      }
      
      public function get commission() : int
      {
         return var_1803;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1801 = param1.readBoolean();
         var_1803 = param1.readInteger();
         var_1537 = param1.readInteger();
         var_1536 = param1.readInteger();
         var_1802 = param1.readInteger();
         var_1805 = param1.readInteger();
         var_1804 = param1.readInteger();
         var_1735 = param1.readInteger();
         return true;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1801;
      }
   }
}

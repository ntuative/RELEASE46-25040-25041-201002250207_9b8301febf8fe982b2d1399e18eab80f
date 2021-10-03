package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_535:Array;
      
      private var var_1299:int;
      
      private var var_1403:Array;
      
      private var var_536:Array;
      
      private var var_1801:Boolean = false;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var_1801 = _loc2_.isWrappingEnabled;
         var_1299 = _loc2_.wrappingPrice;
         var_1403 = _loc2_.stuffTypes;
         var_536 = _loc2_.boxTypes;
         var_535 = _loc2_.ribbonTypes;
      }
      
      public function get ribbonTypes() : Array
      {
         return var_535;
      }
      
      public function get stuffTypes() : Array
      {
         return var_1403;
      }
      
      public function get price() : int
      {
         return var_1299;
      }
      
      public function get boxTypes() : Array
      {
         return var_536;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1801;
      }
   }
}

package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1299:int;
      
      private var var_2033:int = -1;
      
      private var var_363:int;
      
      private var var_1859:int;
      
      private var var_1624:int;
      
      private var _offerId:int;
      
      private var var_1300:int;
      
      private var var_1625:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         _offerId = param1;
         var_1625 = param2;
         var_1624 = param3;
         var_1299 = param4;
         var_363 = param5;
         var_2033 = param6;
         var_1859 = param7;
         var_1300 = param8;
      }
      
      public function get status() : int
      {
         return var_363;
      }
      
      public function get price() : int
      {
         return var_1299;
      }
      
      public function get timeLeftMinutes() : int
      {
         return var_2033;
      }
      
      public function get offerCount() : int
      {
         return var_1300;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get furniType() : int
      {
         return var_1624;
      }
      
      public function get method_1() : int
      {
         return var_1859;
      }
      
      public function get furniId() : int
      {
         return var_1625;
      }
   }
}

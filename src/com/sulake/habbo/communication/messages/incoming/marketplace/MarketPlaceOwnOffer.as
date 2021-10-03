package com.sulake.habbo.communication.messages.incoming.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOwnOffer
   {
      
      public static const const_1576:int = 2;
      
      public static const const_1599:int = 1;
      
      public static const const_1471:int = 0;
       
      
      private var var_1299:int;
      
      private var var_363:int;
      
      private var var_2348:int;
      
      private var _offerId:int;
      
      private var var_1624:int;
      
      private var var_1625:int;
      
      private var _image:BitmapData;
      
      public function MarketPlaceOwnOffer(param1:int, param2:int, param3:int, param4:int)
      {
         super();
         _offerId = param1;
         var_1625 = param2;
         var_1624 = param3;
         var_1299 = param4;
      }
      
      public function get furniId() : int
      {
         return var_1625;
      }
      
      public function get furniType() : int
      {
         return var_1624;
      }
      
      public function get price() : int
      {
         return var_1299;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
   }
}

package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer
   {
      
      public static const const_840:String = "price_type_none";
      
      public static const const_467:String = "pricing_model_multi";
      
      public static const const_389:String = "price_type_credits";
      
      public static const const_355:String = "price_type_credits_and_pixels";
      
      public static const const_421:String = "pricing_model_bundle";
      
      public static const const_445:String = "pricing_model_single";
      
      public static const const_688:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1286:String = "pricing_model_unknown";
      
      public static const const_448:String = "price_type_pixels";
       
      
      private var var_763:int;
      
      private var _offerId:int;
      
      private var var_762:int;
      
      private var var_375:String;
      
      private var var_534:String;
      
      private var var_1651:int;
      
      private var var_647:ICatalogPage;
      
      private var var_1139:String;
      
      private var var_374:IProductContainer;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1139 = param1.localizationId;
         var_763 = param1.priceInCredits;
         var_762 = param1.priceInPixels;
         var_647 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_375;
      }
      
      public function get page() : ICatalogPage
      {
         return var_647;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_1651 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_374;
      }
      
      public function get localizationId() : String
      {
         return var_1139;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_762;
      }
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1139 = "";
         var_763 = 0;
         var_762 = 0;
         var_647 = null;
         if(var_374 != null)
         {
            var_374.dispose();
            var_374 = null;
         }
      }
      
      public function get priceType() : String
      {
         return var_534;
      }
      
      public function get previewCallbackId() : int
      {
         return var_1651;
      }
      
      public function get priceInCredits() : int
      {
         return var_763;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_375 = const_445;
            }
            else
            {
               var_375 = const_467;
            }
         }
         else if(param1.length > 1)
         {
            var_375 = const_421;
         }
         else
         {
            var_375 = const_1286;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_375)
         {
            case const_445:
               var_374 = new SingleProductContainer(this,param1);
               break;
            case const_467:
               var_374 = new MultiProductContainer(this,param1);
               break;
            case const_421:
               var_374 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_375);
         }
      }
      
      private function analyzePriceType() : void
      {
         if(var_763 > 0 && var_762 > 0)
         {
            var_534 = const_355;
         }
         else if(var_763 > 0)
         {
            var_534 = const_389;
         }
         else if(var_762 > 0)
         {
            var_534 = const_448;
         }
         else
         {
            var_534 = const_840;
         }
      }
   }
}

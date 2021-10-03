package com.sulake.habbo.catalog.recycler
{
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   
   public class PrizeContainer extends PrizeGridItem
   {
       
      
      private var var_1817:String;
      
      private var var_2338:PrizeGridItem;
      
      private var var_2068:int;
      
      private var _furnitureData:IFurnitureData;
      
      private var var_1522:int;
      
      public function PrizeContainer(param1:String, param2:int, param3:IFurnitureData, param4:int)
      {
         super();
         var_1817 = param1;
         var_1522 = param2;
         _furnitureData = param3;
         var_2068 = param4;
      }
      
      public function get oddsLevelId() : int
      {
         return var_2068;
      }
      
      public function get productItemType() : String
      {
         return var_1817;
      }
      
      public function get title() : String
      {
         if(_furnitureData == null)
         {
            return "";
         }
         return _furnitureData.title;
      }
      
      public function get gridItem() : PrizeGridItem
      {
         return var_2338;
      }
      
      public function setIcon(param1:IRoomEngine) : void
      {
         initProductIcon(param1,_furnitureData.type,var_1522);
      }
      
      public function get productItemTypeId() : int
      {
         return var_1522;
      }
   }
}

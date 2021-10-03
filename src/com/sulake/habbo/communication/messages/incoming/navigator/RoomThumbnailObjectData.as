package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1545:int;
      
      private var var_1544:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return var_1545;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1545 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1545 = this.var_1545;
         _loc1_.var_1544 = this.var_1544;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1544 = param1;
      }
      
      public function get imgId() : int
      {
         return var_1544;
      }
   }
}

package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_587:RoomObjectLocationCacheItem = null;
      
      private var var_175:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         var_587 = new RoomObjectLocationCacheItem(param1);
         var_175 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return var_587;
      }
      
      public function dispose() : void
      {
         if(var_587 != null)
         {
            var_587.dispose();
            var_587 = null;
         }
         if(var_175 != null)
         {
            var_175.dispose();
            var_175 = null;
         }
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return var_175;
      }
   }
}

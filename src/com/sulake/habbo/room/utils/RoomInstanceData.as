package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_881:LegacyWallGeometry = null;
      
      private var var_583:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_584:TileHeightMap = null;
      
      private var var_2118:String = null;
      
      private var _roomId:int = 0;
      
      private var var_882:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_881 = new LegacyWallGeometry();
         var_882 = new RoomCamera();
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_584 != null)
         {
            var_584.dispose();
         }
         var_584 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_2118 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_881;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_882;
      }
      
      public function dispose() : void
      {
         if(var_584 != null)
         {
            var_584.dispose();
            var_584 = null;
         }
         if(var_881 != null)
         {
            var_881.dispose();
            var_881 = null;
         }
         if(var_882 != null)
         {
            var_882.dispose();
            var_882 = null;
         }
         if(var_583 != null)
         {
            var_583.dispose();
            var_583 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_584;
      }
      
      public function get worldType() : String
      {
         return var_2118;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_583 != null)
         {
            var_583.dispose();
         }
         var_583 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_583;
      }
   }
}

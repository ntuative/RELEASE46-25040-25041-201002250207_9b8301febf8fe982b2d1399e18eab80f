package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_1807:Number = 0;
      
      private var var_1666:Number = 0;
      
      private var var_1667:Number = 0;
      
      private var var_1806:Number = 0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1666 = param1;
         var_1667 = param2;
         var_1807 = param3;
         var_1806 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1666;
      }
      
      public function get leftSideLength() : Number
      {
         return var_1807;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1667;
      }
      
      public function get rightSideLength() : Number
      {
         return var_1806;
      }
   }
}

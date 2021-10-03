package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1098:int = 1;
      
      private static const const_1039:int = 3;
      
      private static const const_1097:int = 2;
      
      private static const const_1096:int = 15;
       
      
      private var var_863:int;
      
      private var var_237:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_237 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1097)
         {
            var_237 = new Array();
            var_237.push(const_1098);
            var_863 = const_1096;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_863 > 0)
         {
            --var_863;
         }
         if(var_863 == 0)
         {
            if(false)
            {
               super.setAnimation(var_237.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}

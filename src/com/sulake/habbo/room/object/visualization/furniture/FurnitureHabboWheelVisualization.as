package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1055:int = 31;
      
      private static const const_1039:int = 32;
      
      private static const const_750:int = 10;
      
      private static const const_496:int = 20;
       
      
      private var var_604:Boolean = false;
      
      private var var_237:Array;
      
      public function FurnitureHabboWheelVisualization()
      {
         var_237 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            var_604 = true;
            var_237 = new Array();
            var_237.push(const_1055);
            var_237.push(const_1039);
            return;
         }
         if(param1 > 0 && param1 <= const_750)
         {
            if(var_604)
            {
               var_604 = false;
               var_237 = new Array();
               var_237.push(const_750 + param1);
               var_237.push(const_496 + param1);
               var_237.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
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

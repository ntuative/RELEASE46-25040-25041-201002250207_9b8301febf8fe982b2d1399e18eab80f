package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1039:int = -1;
      
      private static const const_750:int = 20;
      
      private static const const_496:int = 9;
       
      
      private var var_604:Boolean = false;
      
      private var var_237:Array;
      
      public function FurnitureBottleVisualization()
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
            var_237.push(const_1039);
            return;
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(var_604)
            {
               var_604 = false;
               var_237 = new Array();
               var_237.push(const_750);
               var_237.push(const_496 + param1);
               var_237.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(0))
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

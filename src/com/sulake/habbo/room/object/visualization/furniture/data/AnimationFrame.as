package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_576:int = -1;
      
      public static const const_1009:int = -1;
       
      
      private var _y:int = 0;
      
      private var var_2143:int = -1;
      
      private var var_85:int = 0;
      
      private var var_1321:int = 1;
      
      private var var_887:int = 1;
      
      private var var_2145:Boolean = false;
      
      private var var_2144:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int = -1, param7:int = 0)
      {
         super();
         _id = param1;
         var_85 = param2;
         _y = param3;
         var_2145 = param5;
         if(param4 < 0)
         {
            param4 = const_576;
         }
         var_887 = param4;
         var_1321 = param4;
         if(param6 >= 0)
         {
            var_2143 = param6;
            var_2144 = param7;
         }
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_887 > 0 && param1 > var_887)
         {
            param1 = var_887;
         }
         var_1321 = param1;
      }
      
      public function get frameRepeats() : int
      {
         return var_887;
      }
      
      public function get activeSequenceOffset() : int
      {
         return var_2144;
      }
      
      public function get id() : int
      {
         if(_id >= 0)
         {
            return _id;
         }
         return -_id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_887 < 0)
         {
            return const_576;
         }
         return var_1321;
      }
      
      public function get activeSequence() : int
      {
         return var_2143;
      }
      
      public function get isLastFrame() : Boolean
      {
         return var_2145;
      }
      
      public function get x() : int
      {
         return var_85;
      }
   }
}

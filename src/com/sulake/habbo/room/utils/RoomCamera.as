package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_342:Number = 0.5;
      
      private static const const_764:int = 3;
      
      private static const const_1087:Number = 1;
       
      
      private var var_1965:Boolean = false;
      
      private var var_1962:Boolean = false;
      
      private var var_1038:int = 0;
      
      private var var_262:Vector3d = null;
      
      private var var_1966:int = 0;
      
      private var var_1971:int = 0;
      
      private var var_1969:Boolean = false;
      
      private var var_1968:int = -2;
      
      private var var_1967:Boolean = false;
      
      private var var_1963:int = 0;
      
      private var var_1964:int = -1;
      
      private var var_406:Vector3d = null;
      
      private var var_1970:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return var_1966;
      }
      
      public function get targetId() : int
      {
         return var_1964;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_1963 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         var_1966 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_1965 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         var_1964 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_1962 = param1;
      }
      
      public function dispose() : void
      {
         var_406 = null;
         var_262 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_406 == null)
         {
            var_406 = new Vector3d();
         }
         var_406.assign(param1);
         var_1038 = 0;
      }
      
      public function get targetCategory() : int
      {
         return var_1968;
      }
      
      public function get screenHt() : int
      {
         return var_1970;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_1971 = param1;
      }
      
      public function get location() : IVector3d
      {
         return var_262;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_1970 = param1;
      }
      
      public function get roomHt() : int
      {
         return var_1963;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_1965;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_1962;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_406 != null && var_262 != null)
         {
            ++var_1038;
            _loc2_ = Vector3d.dif(var_406,var_262);
            if(_loc2_.length <= const_342)
            {
               var_262 = var_406;
               var_406 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_342 * (const_764 + 1))
               {
                  _loc2_.mul(const_342);
               }
               else if(var_1038 <= const_764)
               {
                  _loc2_.mul(const_342);
               }
               else
               {
                  _loc2_.mul(const_1087);
               }
               var_262 = Vector3d.sum(var_262,_loc2_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_1969 = param1;
      }
      
      public function get screenWd() : int
      {
         return var_1971;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_1967 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_1968 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_262 != null)
         {
            return;
         }
         var_262 = new Vector3d();
         var_262.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_1969;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_1967;
      }
   }
}

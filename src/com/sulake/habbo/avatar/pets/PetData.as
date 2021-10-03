package com.sulake.habbo.avatar.pets
{
   public class PetData implements IPetData
   {
       
      
      private var _disableHeadTurn:Boolean = false;
      
      private var _colors:Array;
      
      private var var_198:String;
      
      private var var_1240:Array;
      
      private var _name:String;
      
      private var var_602:int;
      
      public function PetData(param1:XML)
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         super();
         _name = param1.@name;
         var_602 = parseInt(param1.@species);
         _disableHeadTurn = Boolean(parseInt(param1.@disableheadturn));
         var_198 = param1.@scale;
         _colors = new Array();
         var_1240 = new Array();
         trace("Found Pet Pack: " + _name);
         for each(_loc2_ in param1.breeds.breed)
         {
            var_1240.push(new Breed(_loc2_));
         }
         for each(_loc3_ in param1.colors.color)
         {
            _colors.push(new PetColor(_loc3_));
         }
         for each(_loc4_ in param1.joints.joint)
         {
         }
      }
      
      public function get disableHeadTurn() : Boolean
      {
         return _disableHeadTurn;
      }
      
      public function get breeds() : Array
      {
         return var_1240;
      }
      
      public function get scale() : String
      {
         return var_198;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get colors() : Array
      {
         return _colors;
      }
      
      public function findColor(param1:uint) : PetColor
      {
         var _loc2_:* = null;
         for each(var _loc5_ in _colors)
         {
            _loc2_ = _loc5_;
            _loc5_;
            if(_loc2_.rgb == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function findBreed(param1:int) : Breed
      {
         var _loc2_:* = null;
         for each(var _loc5_ in var_1240)
         {
            _loc2_ = _loc5_;
            _loc5_;
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function get species() : int
      {
         return var_602;
      }
   }
}

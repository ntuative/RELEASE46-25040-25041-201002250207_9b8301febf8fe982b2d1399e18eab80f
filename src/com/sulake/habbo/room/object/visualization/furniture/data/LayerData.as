package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_475:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_374:int = 0;
      
      public static const const_905:int = 2;
      
      public static const const_947:int = 1;
      
      public static const const_607:Boolean = false;
      
      public static const const_543:String = "";
      
      public static const const_419:int = 0;
      
      public static const const_372:int = 0;
      
      public static const const_398:int = 0;
       
      
      private var var_1632:int = 0;
      
      private var var_1630:String = "";
      
      private var var_1556:int = 0;
      
      private var var_1629:int = 0;
      
      private var var_1628:Number = 0;
      
      private var var_1631:int = 255;
      
      private var var_1633:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_1632;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1556 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_1628;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_1629 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_1632 = param1;
      }
      
      public function get tag() : String
      {
         return var_1630;
      }
      
      public function get alpha() : int
      {
         return var_1631;
      }
      
      public function get ink() : int
      {
         return var_1556;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_1628 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_1629;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_1633 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_1633;
      }
      
      public function set tag(param1:String) : void
      {
         var_1630 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1631 = param1;
      }
   }
}

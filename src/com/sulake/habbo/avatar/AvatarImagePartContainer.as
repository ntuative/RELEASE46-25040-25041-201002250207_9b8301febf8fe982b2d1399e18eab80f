package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var _frames:Array;
      
      private var var_1841:int;
      
      private var var_1839:String;
      
      private var var_1399:IActionDefinition;
      
      private var var_1844:Boolean;
      
      private var _color:IPartColor;
      
      private var var_1838:String;
      
      private var var_1843:String;
      
      private var var_1686:Boolean;
      
      private var var_1840:ColorTransform;
      
      private var var_1842:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:int, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_1839 = param1;
         var_1838 = param2;
         var_1841 = param3;
         _color = param4;
         _frames = param5;
         var_1399 = param6;
         var_1686 = param7;
         var_1842 = param8;
         var_1843 = param9;
         var_1844 = param10;
         var_1840 = new ColorTransform(1,1,1,param11);
      }
      
      public function get isColorable() : Boolean
      {
         return var_1686;
      }
      
      public function get partType() : String
      {
         return var_1838;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return 0;
      }
      
      public function get paletteMapId() : int
      {
         return var_1842;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_1844;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get partId() : int
      {
         return var_1841;
      }
      
      public function get flippedPartType() : String
      {
         return var_1843;
      }
      
      public function get bodyPartId() : String
      {
         return var_1839;
      }
      
      public function get action() : IActionDefinition
      {
         return var_1399;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_1840;
      }
   }
}

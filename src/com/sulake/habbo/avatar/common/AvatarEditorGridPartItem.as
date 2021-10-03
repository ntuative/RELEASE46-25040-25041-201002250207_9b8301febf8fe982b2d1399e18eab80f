package com.sulake.habbo.avatar.common
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import com.sulake.habbo.avatar.structure.figure.IFigurePart;
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class AvatarEditorGridPartItem
   {
      
      private static var var_62:Array = [];
      
      {
         var_62.push("li");
         var_62.push("lh");
         var_62.push("ls");
         var_62.push("lc");
         var_62.push("bd");
         var_62.push("sh");
         var_62.push("lg");
         var_62.push("ch");
         var_62.push("ca");
         var_62.push("cc");
         var_62.push("wa");
         var_62.push("rh");
         var_62.push("rs");
         var_62.push("rc");
         var_62.push("hd");
         var_62.push("fc");
         var_62.push("ey");
         var_62.push("hr");
         var_62.push("hrb");
         var_62.push("fa");
         var_62.push("ea");
         var_62.push("ha");
         var_62.push("he");
         var_62.push("ri");
      }
      
      private const const_1606:int = 16777215;
      
      private var _isSelected:Boolean = false;
      
      private var var_977:BitmapData;
      
      private const const_1607:int = 13421772;
      
      private var var_844:Rectangle;
      
      private var _colors:Array;
      
      private var _window:IWindowContainer;
      
      private var var_1510:Boolean;
      
      private var var_361:BitmapData;
      
      private var _model:IAvatarEditorCategoryModel;
      
      private var var_570:IFigurePartSet;
      
      private var var_1509:int = 0;
      
      public function AvatarEditorGridPartItem(param1:IWindowContainer, param2:IAvatarEditorCategoryModel, param3:IFigurePartSet, param4:Array, param5:Boolean = true)
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         super();
         _model = param2;
         var_570 = param3;
         _window = param1;
         _colors = param4;
         var_1510 = param5;
         var _loc6_:BitmapDataAsset = param2.controller.assets.getAssetByName("habbo_club_icon") as BitmapDataAsset;
         var_977 = _loc6_.content as BitmapData;
         if(param3 == null)
         {
            var_361 = new BitmapData(1,1,true,16777215);
         }
         if(param3 != null)
         {
            _loc8_ = param3.parts;
            for each(_loc7_ in _loc8_)
            {
               var_1509 = Math.max(var_1509,_loc7_.colorLayerIndex);
            }
         }
         updateThumbVisualization();
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
         updateThumbVisualization();
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_361 = param1;
         updateThumbVisualization();
      }
      
      public function get colorLayerCount() : int
      {
         return var_1509;
      }
      
      private function sortByDrawOrder(param1:IFigurePart, param2:IFigurePart) : Number
      {
         var _loc3_:Number = var_62.indexOf(param1.type);
         var _loc4_:Number = var_62.indexOf(param2.type);
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(param1.index < param2.index)
         {
            return -1;
         }
         if(param1.index > param2.index)
         {
            return 1;
         }
         return 0;
      }
      
      private function updateThumbVisualization() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         if(_window == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         var _loc1_:IBitmapWrapperWindow = _window.findChildByName("bitmap") as IBitmapWrapperWindow;
         if(_loc1_)
         {
            if(var_361 != null && !var_1510)
            {
               _loc2_ = var_361;
            }
            else
            {
               _loc2_ = renderThumb();
               if(!_loc2_)
               {
                  return;
               }
            }
            _loc3_ = !!_loc1_.bitmap ? _loc1_.bitmap : new BitmapData(_loc1_.width,_loc1_.height);
            _loc3_.fillRect(_loc3_.rect,16777215);
            _loc4_ = (_loc3_.width - _loc2_.width) / 2;
            _loc5_ = (_loc3_.height - _loc2_.height) / 2;
            _loc3_.copyPixels(_loc2_,_loc2_.rect,new Point(_loc4_,_loc5_),null,null,true);
            _loc1_.bitmap = _loc3_;
         }
         if(var_570 != null && false)
         {
            _loc6_ = _window.findChildByTag("CLUB_ICON") as IBitmapWrapperWindow;
            if(_loc6_ != null)
            {
               _loc6_.bitmap = new BitmapData(_loc6_.width,_loc6_.height,true,16777215);
               _loc6_.bitmap.copyPixels(var_977,var_977.rect,new Point(0,0),null,null,true);
            }
         }
         if(isSelected)
         {
            _window.color = const_1607;
         }
         else
         {
            _window.color = const_1606;
         }
         _window.invalidate();
      }
      
      public function get id() : int
      {
         if(var_570 == null)
         {
            return -1;
         }
         return var_570.id;
      }
      
      public function dispose() : void
      {
         _model = null;
         var_570 = null;
         if(_window != null)
         {
            if(false)
            {
            }
         }
         _window = null;
      }
      
      public function update() : void
      {
         updateThumbVisualization();
      }
      
      public function set colors(param1:Array) : void
      {
         _colors = param1;
         updateThumbVisualization();
      }
      
      public function get view() : IWindowContainer
      {
         return _window;
      }
      
      private function analyzeLayers() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(partSet == null)
         {
            return false;
         }
         var _loc5_:Rectangle = new Rectangle();
         for each(_loc1_ in partSet.parts)
         {
            _loc2_ = "undefined_undefined_" + _loc1_.type + "_" + _loc1_.id + "_" + FigureData.const_869 + "_" + FigureData.const_236;
            _loc3_ = _model.controller.avatarRenderManager.getAssetByName(_loc2_) as BitmapDataAsset;
            if(_loc3_ != null)
            {
               _loc4_ = (_loc3_.content as BitmapData).clone();
               _loc5_ = _loc5_.union(new Rectangle(-1 * _loc3_.offset.x,-1 * _loc3_.offset.y,_loc4_.width,_loc4_.height));
            }
         }
         var_844 = _loc5_;
         return true;
      }
      
      public function get partSet() : IFigurePartSet
      {
         return var_570;
      }
      
      private function renderThumb() : BitmapData
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         if(var_844 == null)
         {
            if(!analyzeLayers())
            {
               return null;
            }
         }
         _loc1_ = new BitmapData(var_844.width,var_844.height,true,16777215);
         var _loc6_:Array = partSet.parts.concat().sort(sortByDrawOrder);
         for each(_loc2_ in _loc6_)
         {
            _loc3_ = "undefined_undefined_" + _loc2_.type + "_" + _loc2_.id + "_" + FigureData.const_869 + "_" + FigureData.const_236;
            _loc4_ = _model.controller.avatarRenderManager.getAssetByName(_loc3_) as BitmapDataAsset;
            if(_loc4_ != null)
            {
               _loc5_ = (_loc4_.content as BitmapData).clone();
               _loc7_ = -1 * _loc4_.offset.x - 0;
               _loc8_ = -1 * _loc4_.offset.y - 0;
               if(var_1510 && _loc2_.colorLayerIndex > 0)
               {
                  _loc9_ = _colors[_loc2_.colorLayerIndex - 1];
                  if(_loc9_ != null)
                  {
                     _loc5_.colorTransform(_loc5_.rect,_loc9_.colorTransform);
                  }
               }
               _loc1_.copyPixels(_loc5_,_loc5_.rect,new Point(_loc7_,_loc8_),null,null,true);
            }
            else
            {
               Logger.log("Could not find asset: " + _loc3_);
            }
         }
         return _loc1_;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
   }
}

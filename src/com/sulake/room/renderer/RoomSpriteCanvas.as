package com.sulake.room.renderer
{
   import com.sulake.core.utils.Map;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.logic.IRoomObjectMouseHandler;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectSpriteVisualization;
   import com.sulake.room.renderer.cache.BitmapDataCache;
   import com.sulake.room.renderer.cache.RoomObjectCache;
   import com.sulake.room.renderer.cache.RoomObjectCacheItem;
   import com.sulake.room.renderer.cache.RoomObjectLocationCacheItem;
   import com.sulake.room.renderer.cache.RoomObjectSortableSpriteCacheItem;
   import com.sulake.room.renderer.utils.ExtendedBitmap;
   import com.sulake.room.renderer.utils.ExtendedBitmapData;
   import com.sulake.room.renderer.utils.ExtendedSprite;
   import com.sulake.room.renderer.utils.ObjectMouseData;
   import com.sulake.room.renderer.utils.SortableSprite;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.RoomGeometry;
   import com.sulake.room.utils.Vector3d;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.PixelSnapping;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.utils.getTimer;
   
   public class RoomSpriteCanvas implements IRoomRenderingCanvas
   {
      
      private static const const_753:int = 50;
       
      
      private var _master:Sprite;
      
      private var _container:IRoomSpriteCanvasContainer;
      
      private var var_50:Sprite;
      
      private var var_1795:int;
      
      private var var_997:Point;
      
      private var var_1441:int = 0;
      
      private var var_465:Array;
      
      private var var_293:Map = null;
      
      private var var_467:Map;
      
      private var var_665:int;
      
      private var var_998:int = 0;
      
      private var var_664:Array;
      
      private var var_389:Array;
      
      private var var_1794:int = -1;
      
      private var var_1792:int;
      
      private var _id:String = "";
      
      private var var_219:BitmapDataCache;
      
      private var _geometry:RoomGeometry;
      
      private var var_1791:Number = -10000000;
      
      private var var_1793:Number = -10000000;
      
      private var var_2332:int = 0;
      
      private var var_466:RoomObjectCache;
      
      private var var_663:int;
      
      private var var_252:Sprite;
      
      private var var_996:IRoomRenderingCanvasMouseListener = null;
      
      public function RoomSpriteCanvas(param1:IRoomSpriteCanvasContainer, param2:String, param3:int, param4:int, param5:int)
      {
         var_467 = new Map();
         var_997 = new Point();
         var_389 = [];
         var_465 = [];
         var_664 = [];
         super();
         _container = param1;
         _id = param2;
         _master = new Sprite();
         _master.mouseEnabled = false;
         var_50 = new Sprite();
         var_50.name = "canvas";
         var_50.mouseEnabled = false;
         _master.addChild(var_50);
         var_50.mouseEnabled = true;
         var_50.doubleClickEnabled = true;
         var_50.addEventListener(MouseEvent.CLICK,clickHandler);
         var_50.addEventListener(MouseEvent.DOUBLE_CLICK,clickHandler);
         _geometry = new RoomGeometry(param5,new Vector3d(-135,30,0),new Vector3d(11,11,5),new Vector3d(-135,0.5,0));
         var_219 = new BitmapDataCache(1024 * 1024 * 16);
         var _loc6_:* = null;
         if(_container != null)
         {
            _loc6_ = "null";
         }
         var_293 = new Map();
         var_466 = new RoomObjectCache(_loc6_);
         initialize(param3,param4);
      }
      
      public function roomObjectRemoved(param1:String) : void
      {
         var_466.removeObjectCache(param1);
      }
      
      public function update() : void
      {
         if(var_998 == 0)
         {
            checkMouseHits(var_997.x,var_997.y,MouseEvent.MOUSE_MOVE);
         }
         var_998 = 0;
         ++var_1441;
      }
      
      public function initialize(param1:int, param2:int) : void
      {
         if(param1 < 1)
         {
            param1 = 1;
         }
         if(param2 < 1)
         {
            param2 = 1;
         }
         if(var_252 != null)
         {
            var_252.graphics.clear();
         }
         else
         {
            var_252 = new Sprite();
            var_252.name = "mask";
            _master.addChild(var_252);
         }
         var_252.graphics.beginFill(0);
         var_252.graphics.drawRect(0,0,param1,param2);
         var_663 = param1;
         var_665 = param2;
         var_50.graphics.clear();
         var_50.graphics.beginFill(var_2332);
         var_50.graphics.drawRect(0,0,param1,param2);
         var_50.mask = var_252;
      }
      
      private function createMouseEvent(param1:int, param2:int, param3:int, param4:int, param5:String, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean) : RoomSpriteMouseEvent
      {
         var _loc11_:Number = param1 - var_663 / 2;
         var _loc12_:Number = param2 - var_665 / 2;
         var _loc13_:* = null;
         return new RoomSpriteMouseEvent(param5,_id,param6,_loc11_,_loc12_,param3,param4,param8,param7,param9,param10);
      }
      
      public function render(param1:int) : void
      {
         var _loc13_:* = NaN;
         var _loc14_:int = 0;
         var _loc2_:int = getTimer();
         if(_container == null || _geometry == null)
         {
            return;
         }
         if(param1 == var_1794)
         {
            return;
         }
         var_219.compress();
         var _loc4_:int = _container.getRoomObjectCount();
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = "";
         var _loc8_:* = null;
         var _loc10_:Boolean = false;
         if(var_663 != var_1795 || var_665 != var_1792)
         {
            _loc10_ = true;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc8_ = _container.getRoomObjectWithIndex(_loc5_);
            if(_loc8_ != null)
            {
               _loc7_ = _container.getRoomObjectIdWithIndex(_loc5_);
               _loc6_ += renderObject(_loc8_,_loc7_,param1,_loc10_);
            }
            _loc5_++;
         }
         var_389.sortOn("z",0 | 0);
         if(_loc6_ < var_389.length)
         {
            var_389.splice(_loc6_);
         }
         var _loc11_:* = null;
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc11_ = var_389[_loc5_] as SortableSprite;
            if(_loc11_ != null)
            {
               updateSprite(_loc5_,_loc11_);
            }
            _loc5_++;
         }
         cleanSprites(_loc6_);
         var_1794 = param1;
         var_1795 = var_663;
         var_1792 = var_665;
         var _loc12_:int = getTimer();
         var_664.push(_loc12_ - _loc2_);
         if(var_664.length == const_753)
         {
            _loc13_ = 0;
            _loc14_ = 0;
            while(_loc14_ < const_753)
            {
               _loc13_ += var_664[_loc14_];
               _loc14_++;
            }
            Logger.log("Canvas render time: " + _loc13_ / 0);
            var_664 = [];
         }
      }
      
      public function get displayObject() : DisplayObject
      {
         return _master;
      }
      
      public function dispose() : void
      {
         if(_geometry != null)
         {
            _geometry.dispose();
            _geometry = null;
         }
         if(var_252 != null)
         {
            var_252 = null;
         }
         if(var_219 != null)
         {
            var_219.dispose();
            var_219 = null;
         }
         if(var_466 != null)
         {
            var_466.dispose();
            var_466 = null;
         }
         _container = null;
         cleanSprites(0,true);
         if(_master != null)
         {
            while(false)
            {
               _master.removeChildAt(0);
            }
            _master = null;
         }
         var_50 = null;
         var_252 = null;
         var_389 = [];
         if(var_467 != null)
         {
            var_467.dispose();
            var_467 = null;
         }
         var _loc1_:int = 0;
         if(var_465 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_465.length)
            {
               cleanSprite(var_465[_loc1_] as ExtendedSprite,true);
               _loc1_++;
            }
            var_465 = [];
         }
         if(var_293 != null)
         {
            var_293.dispose();
            var_293 = null;
         }
         var_996 = null;
      }
      
      private function clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = false;
         if(param1.type == MouseEvent.CLICK || param1.type == MouseEvent.DOUBLE_CLICK)
         {
            _loc2_ = param1.type == MouseEvent.DOUBLE_CLICK;
            checkMouseClickHits(param1.localX,param1.localY,_loc2_,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
         }
      }
      
      private function processMouseEvents() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(_container == null || var_293 == null)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < var_293.length)
         {
            _loc2_ = var_293.getKey(_loc1_);
            _loc3_ = var_293.getWithIndex(_loc1_);
            if(_loc2_ != null && _loc3_ != null)
            {
               _loc4_ = _container.getRoomObject(_loc2_);
               if(_loc4_ != null)
               {
                  if(var_996 != null)
                  {
                     var_996.processRoomCanvasMouseEvent(_loc3_,_loc4_,_id + var_1441,geometry);
                  }
                  else
                  {
                     _loc5_ = _loc4_.getMouseHandler();
                     if(_loc5_ != null)
                     {
                        _loc5_.mouseEvent(_loc3_,_geometry);
                     }
                  }
               }
            }
            _loc1_++;
         }
         var_293.reset();
      }
      
      private function getColoredBitmapData(param1:BitmapData, param2:String, param3:int, param4:Boolean = false) : ExtendedBitmapData
      {
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:* = null;
         var _loc5_:String = param2 + " " + param3;
         var _loc6_:* = null;
         if(param2.length > 0)
         {
            _loc6_ = var_219.getBitmapData(_loc5_);
            if(!param4)
            {
               return _loc6_;
            }
         }
         if(_loc6_ == null)
         {
            _loc7_ = param3 >> 16 & 255;
            _loc8_ = param3 >> 8 & 255;
            _loc9_ = param3 & 255;
            _loc10_ = _loc7_ / 255;
            _loc11_ = _loc8_ / 255;
            _loc12_ = _loc9_ / 255;
            _loc6_ = new ExtendedBitmapData(param1.width,param1.height,true,16777215);
            _loc6_.copyPixels(param1,param1.rect,new Point(0,0));
            _loc13_ = new ColorTransform(_loc10_,_loc11_,_loc12_);
            _loc6_.colorTransform(_loc6_.rect,_loc13_);
            if(param2.length > 0)
            {
               var_219.addBitmapData(_loc5_,_loc6_);
            }
         }
         return _loc6_;
      }
      
      public function get height() : int
      {
         return var_665;
      }
      
      private function getObjectId(param1:ExtendedSprite) : String
      {
         var _loc2_:* = null;
         if(param1 != null)
         {
            return param1.identifier;
         }
         return "";
      }
      
      public function set mouseListener(param1:IRoomRenderingCanvasMouseListener) : void
      {
         var_996 = param1;
      }
      
      private function getSprite(param1:int) : ExtendedSprite
      {
         if(param1 < 0 || param1 >= var_50.numChildren)
         {
            return null;
         }
         return var_50.getChildAt(param1) as ExtendedSprite;
      }
      
      public function handleMouseEvent(param1:int, param2:int, param3:String, param4:Boolean, param5:Boolean, param6:Boolean, param7:Boolean) : Boolean
      {
         var_997.x = param1;
         var_997.y = param2;
         return Boolean(checkMouseHits(param1,param2,param3,param4,param5,param6,param7));
      }
      
      private function cleanSprites(param1:int, param2:Boolean = false) : void
      {
         var _loc6_:* = null;
         if(var_50 == null)
         {
            return;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = -1;
         while(_loc5_ >= param1)
         {
            _loc3_ = var_50.getChildAt(_loc5_);
            _loc6_ = null;
            _loc4_ = _loc3_ as ExtendedSprite;
            cleanSprite(_loc4_,param2);
            _loc5_--;
         }
      }
      
      public function get width() : int
      {
         return var_663;
      }
      
      private function getSortableSprite(param1:int) : SortableSprite
      {
         if(param1 < 0 || param1 >= var_389.length)
         {
            return null;
         }
         return var_389[param1] as SortableSprite;
      }
      
      private function bufferMouseEvent(param1:RoomSpriteMouseEvent, param2:String) : void
      {
         if(var_293 != null && param1 != null)
         {
            var_293.add(param2,param1);
         }
      }
      
      private function checkMouseHits(param1:Number, param2:Number, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false) : Boolean
      {
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc8_:Boolean = false;
         var _loc9_:String = "";
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = [];
         var _loc13_:* = null;
         var _loc14_:int = 0;
         _loc14_ = -1;
         while(_loc14_ >= 0)
         {
            _loc10_ = var_50.getChildAt(_loc14_) as ExtendedSprite;
            if(_loc10_ != null && _loc10_.hitTestPoint(param1 - _loc10_.x,param2 - _loc10_.y))
            {
               if(param3 != MouseEvent.CLICK && param3 != MouseEvent.DOUBLE_CLICK || !_loc10_.clickHandling)
               {
                  _loc9_ = getObjectId(_loc10_);
                  if(_loc12_.indexOf(_loc9_) < 0)
                  {
                     _loc16_ = _loc10_.tag;
                     _loc13_ = var_467.getValue(_loc9_) as ObjectMouseData;
                     if(_loc13_ != null)
                     {
                        if(_loc13_.spriteTag != _loc16_)
                        {
                           _loc11_ = createMouseEvent(0,0,0,0,MouseEvent.ROLL_OUT,_loc13_.spriteTag,param4,param5,param6,param7);
                           bufferMouseEvent(_loc11_,_loc9_);
                        }
                     }
                     if(param3 == MouseEvent.MOUSE_MOVE && (_loc13_ == null || _loc13_.spriteTag != _loc16_))
                     {
                        _loc11_ = createMouseEvent(param1,param2,param1 - _loc10_.x,param2 - _loc10_.y,MouseEvent.ROLL_OVER,_loc16_,param4,param5,param6,param7);
                     }
                     else
                     {
                        _loc11_ = createMouseEvent(param1,param2,param1 - _loc10_.y,param2 - _loc10_.y,param3,_loc16_,param4,param5,param6,param7);
                     }
                     if(_loc13_ == null)
                     {
                        _loc13_ = new ObjectMouseData();
                        _loc13_.objectId = _loc9_;
                        var_467.add(_loc9_,_loc13_);
                     }
                     _loc13_.spriteTag = _loc16_;
                     if(param3 != MouseEvent.MOUSE_MOVE || param1 != var_1791 || param2 != var_1793)
                     {
                        bufferMouseEvent(_loc11_,_loc9_);
                     }
                     _loc12_.push(_loc9_);
                  }
                  _loc8_ = true;
               }
            }
            _loc14_--;
         }
         var _loc15_:Array = var_467.getKeys();
         _loc14_ = 0;
         while(_loc14_ < _loc15_.length)
         {
            _loc17_ = _loc15_[_loc14_] as String;
            _loc18_ = _loc12_.indexOf(_loc17_);
            if(_loc18_ >= 0)
            {
               _loc15_[_loc14_] = null;
            }
            _loc14_++;
         }
         _loc14_ = 0;
         while(_loc14_ < _loc15_.length)
         {
            _loc9_ = _loc15_[_loc14_] as String;
            if(_loc9_ != null)
            {
               _loc13_ = var_467.remove(_loc9_) as ObjectMouseData;
               if(_loc13_ != null)
               {
                  _loc11_ = createMouseEvent(0,0,0,0,MouseEvent.ROLL_OUT,_loc13_.spriteTag,param4,param5,param6,param7);
                  bufferMouseEvent(_loc11_,_loc9_);
               }
            }
            _loc14_++;
         }
         processMouseEvents();
         var_1791 = param1;
         var_1793 = param2;
         ++var_998;
         return _loc8_;
      }
      
      private function createSprite(param1:SortableSprite, param2:int = -1) : void
      {
         if(param1.sprite == null)
         {
            return;
         }
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:IRoomObjectSprite = param1.sprite;
         if(false)
         {
            _loc3_ = var_465.pop() as ExtendedSprite;
         }
         if(_loc3_ == null)
         {
            _loc3_ = new ExtendedSprite();
         }
         if(_loc3_.numChildren > 0)
         {
            _loc4_ = _loc3_.getChildAt(0) as ExtendedBitmap;
         }
         if(_loc4_ == null)
         {
            _loc4_ = new ExtendedBitmap();
            _loc4_.pixelSnapping = PixelSnapping.ALWAYS;
            _loc3_.addChildAt(_loc4_,0);
         }
         _loc3_.x = param1.x;
         _loc3_.y = param1.y;
         _loc3_.identifier = param1.name;
         _loc3_.alpha = _loc5_.alpha / 255;
         _loc3_.tag = _loc5_.tag;
         _loc3_.blendMode = _loc5_.blendMode;
         _loc3_.varyingDepth = _loc5_.varyingDepth;
         _loc3_.clickHandling = _loc5_.clickHandling;
         _loc4_.bitmapData = getBitmapData(_loc5_.asset,_loc5_.assetName,_loc5_.flipH,_loc5_.color);
         _loc3_.addChildAt(_loc4_,0);
         if(_loc5_.capturesMouse)
         {
            _loc3_.alphaTolerance = 128;
         }
         else
         {
            _loc3_.alphaTolerance = 256;
         }
         if(param2 < 0 || param2 >= var_50.numChildren)
         {
            var_50.addChild(_loc3_);
         }
         else
         {
            var_50.addChildAt(_loc3_,param2);
         }
         _loc3_.mouseEnabled = false;
      }
      
      private function getFlippedBitmapData(param1:BitmapData, param2:String, param3:Boolean = false) : ExtendedBitmapData
      {
         var _loc6_:* = null;
         var _loc4_:* = param2 + " FH";
         var _loc5_:* = null;
         if(param2.length > 0)
         {
            _loc5_ = var_219.getBitmapData(_loc4_);
            if(!param3)
            {
               return _loc5_;
            }
         }
         if(_loc5_ == null)
         {
            _loc5_ = new ExtendedBitmapData(param1.width,param1.height,true,16777215);
            _loc6_ = new Matrix();
            _loc6_.scale(-1,1);
            _loc6_.translate(param1.width,0);
            _loc5_.draw(param1,_loc6_);
            if(param2.length > 0)
            {
               var_219.addBitmapData(_loc4_,_loc5_);
            }
         }
         return _loc5_;
      }
      
      private function checkMouseClickHits(param1:Number, param2:Number, param3:Boolean, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false) : Boolean
      {
         var _loc15_:* = null;
         var _loc8_:Boolean = false;
         var _loc9_:String = "";
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:String = "null";
         if(param3)
         {
            _loc12_ = "null";
         }
         var _loc13_:* = [];
         var _loc14_:int = 0;
         _loc14_ = -1;
         while(_loc14_ >= 0)
         {
            _loc10_ = var_50.getChildAt(_loc14_) as ExtendedSprite;
            if(_loc10_ != null)
            {
               if(_loc10_.hitTestPoint(param1 - _loc10_.x,param2 - _loc10_.y))
               {
                  if(_loc10_.clickHandling)
                  {
                     _loc9_ = getObjectId(_loc10_);
                     if(_loc13_.indexOf(_loc9_) < 0)
                     {
                        _loc15_ = _loc10_.tag;
                        _loc11_ = createMouseEvent(param1,param2,param1 - _loc10_.y,param2 - _loc10_.y,_loc12_,_loc15_,param4,param5,param6,param7);
                        bufferMouseEvent(_loc11_,_loc9_);
                        _loc13_.push(_loc9_);
                     }
                  }
                  _loc8_ = true;
                  break;
               }
            }
            _loc14_--;
         }
         processMouseEvents();
         return _loc8_;
      }
      
      private function updateSprite(param1:int, param2:SortableSprite) : Boolean
      {
         var _loc5_:* = null;
         var _loc6_:Number = NaN;
         var _loc7_:* = null;
         if(param2.sprite == null)
         {
            return false;
         }
         if(param1 >= var_50.numChildren)
         {
            createSprite(param2);
            return true;
         }
         var _loc3_:IRoomObjectSprite = param2.sprite;
         var _loc4_:ExtendedSprite = var_50.getChildAt(param1) as ExtendedSprite;
         if(_loc4_ != null)
         {
            if(_loc4_.varyingDepth != _loc3_.varyingDepth)
            {
               if(_loc4_.varyingDepth && !_loc3_.varyingDepth)
               {
                  var_50.removeChildAt(param1);
                  var_465.push(_loc4_);
                  return updateSprite(param1,param2);
               }
               createSprite(param2,param1);
               return true;
            }
            if(_loc4_.x != param2.x)
            {
               _loc4_.x = param2.x;
            }
            if(_loc4_.y != param2.y)
            {
               _loc4_.y = param2.y;
            }
            if(_loc4_.needsUpdate(_loc3_.instanceId,_loc3_.updateId))
            {
               if(_loc3_.capturesMouse)
               {
                  _loc4_.alphaTolerance = 128;
               }
               else
               {
                  _loc4_.alphaTolerance = 256;
               }
               _loc5_ = null;
               if(_loc4_.numChildren > 0)
               {
                  _loc5_ = _loc4_.getChildAt(0) as ExtendedBitmap;
               }
               if(_loc5_ == null)
               {
                  _loc5_ = new ExtendedBitmap();
                  _loc4_.addChildAt(_loc5_,0);
               }
               _loc6_ = _loc3_.alpha / 255;
               if(_loc4_.alpha != _loc6_)
               {
                  _loc4_.alpha = _loc6_;
               }
               _loc4_.identifier = param2.name;
               _loc4_.tag = _loc3_.tag;
               _loc4_.varyingDepth = _loc3_.varyingDepth;
               _loc4_.blendMode = _loc3_.blendMode;
               _loc4_.clickHandling = _loc3_.clickHandling;
               _loc7_ = getBitmapData(_loc3_.asset,_loc3_.assetName,_loc3_.flipH,_loc3_.color);
               if(_loc5_.bitmapData != _loc7_)
               {
                  _loc5_.bitmapData = _loc7_;
               }
            }
            return true;
         }
         return false;
      }
      
      private function getBitmapData(param1:BitmapData, param2:String, param3:Boolean, param4:int) : BitmapData
      {
         param4 &= 16777215;
         if(!param3 && param4 == 16777215)
         {
            return param1;
         }
         var _loc5_:* = null;
         var _loc6_:* = "";
         if(param3 && param4 != 16777215)
         {
            _loc6_ = param2 + " " + param4 + " FH";
            if(param2.length > 0)
            {
               _loc5_ = var_219.getBitmapData(_loc6_);
            }
            if(_loc5_ == null)
            {
               _loc5_ = getColoredBitmapData(param1,param2,param4);
               if(_loc5_ != null)
               {
                  _loc5_ = getFlippedBitmapData(_loc5_,"",true);
                  if(param2.length > 0)
                  {
                     var_219.addBitmapData(_loc6_,_loc5_);
                  }
                  return _loc5_;
               }
               _loc5_ = getFlippedBitmapData(_loc5_,param2);
               if(_loc5_ != null)
               {
                  _loc5_ = getColoredBitmapData(_loc5_,"",param4,true);
                  if(param2.length > 0)
                  {
                     var_219.addBitmapData(_loc6_,_loc5_);
                  }
                  return _loc5_;
               }
               _loc5_ = getColoredBitmapData(param1,param2,param4,true);
               _loc5_ = getFlippedBitmapData(_loc5_,"",true);
               if(param2.length > 0)
               {
                  var_219.addBitmapData(_loc6_,_loc5_);
               }
            }
         }
         else if(param3)
         {
            _loc5_ = getFlippedBitmapData(param1,param2,true);
         }
         else
         {
            if(param4 == 16777215)
            {
               return param1;
            }
            _loc5_ = getColoredBitmapData(param1,param2,param4,true);
         }
         return _loc5_;
      }
      
      private function renderObject(param1:IRoomObject, param2:String, param3:int, param4:Boolean) : int
      {
         var _loc22_:* = null;
         var _loc5_:IRoomObjectSpriteVisualization = param1.getVisualization() as IRoomObjectSpriteVisualization;
         if(_loc5_ == null)
         {
            var_466.removeObjectCache(param2);
            return 0;
         }
         var _loc6_:RoomObjectCacheItem = var_466.getObjectCache(param2);
         var _loc7_:RoomObjectLocationCacheItem = _loc6_.location;
         var _loc8_:RoomObjectSortableSpriteCacheItem = _loc6_.sprites;
         var _loc9_:Boolean = _loc7_.needsUpdate(_geometry.updateId,param1.getUpdateID());
         if(_loc9_)
         {
            param4 = true;
         }
         var _loc10_:IVector3d = _loc7_.getScreenLocation(param1,_geometry,_loc9_);
         if(_loc10_ == null)
         {
            var_466.removeObjectCache(param2);
            return 0;
         }
         _loc5_.update(_geometry,param3);
         if(!_loc8_.needsUpdate(_loc5_.getInstanceId(),_loc5_.getUpdateID()) && !param4)
         {
            return _loc8_.spriteCount;
         }
         var _loc11_:int = _loc5_.spriteCount;
         var _loc12_:int = _loc10_.x;
         var _loc13_:int = _loc10_.y;
         var _loc14_:Number = _loc10_.z;
         if(_loc12_ > 0)
         {
            _loc14_ += _loc12_ * 1.2e-7;
         }
         else
         {
            _loc14_ += -_loc12_ * 1.2e-7;
         }
         _loc12_ += int(var_663 / 2);
         _loc13_ += int(var_665 / 2);
         var _loc15_:int = 0;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc21_:int = 0;
         while(_loc21_ < _loc11_)
         {
            _loc17_ = _loc5_.getSprite(_loc21_);
            if(_loc17_ != null && _loc17_.visible)
            {
               _loc22_ = _loc17_.asset;
               if(_loc22_ != null)
               {
                  _loc18_ = _loc12_ + _loc17_.offsetX;
                  _loc19_ = _loc13_ + _loc17_.offsetY;
                  if(_loc18_ + _loc22_.width >= 0 && _loc18_ < var_663 && (_loc19_ + _loc22_.height >= 0 && _loc19_ < var_665))
                  {
                     _loc16_ = _loc8_.getSprite(_loc15_);
                     if(_loc16_ == null)
                     {
                        _loc16_ = new SortableSprite();
                        _loc8_.addSprite(_loc16_);
                        var_389.push(_loc16_);
                     }
                     _loc16_.sprite = _loc17_;
                     _loc16_.name = param2;
                     _loc16_.x = _loc18_;
                     _loc16_.y = _loc19_;
                     _loc16_.z = _loc14_ + _loc17_.relativeDepth + 3.7e-11 * _loc15_;
                     _loc15_++;
                  }
               }
            }
            _loc21_++;
         }
         _loc8_.setSpriteCount(_loc15_);
         return _loc15_;
      }
      
      public function get geometry() : IRoomGeometry
      {
         return _geometry;
      }
      
      private function cleanSprite(param1:ExtendedSprite, param2:Boolean) : void
      {
         var _loc3_:* = null;
         if(param1 != null)
         {
            if(!param2)
            {
               _loc3_ = param1.removeChildAt(0) as Bitmap;
               if(_loc3_ != null)
               {
                  _loc3_.bitmapData = null;
               }
            }
            else
            {
               param1.dispose();
            }
         }
      }
   }
}

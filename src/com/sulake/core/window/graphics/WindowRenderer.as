package com.sulake.core.window.graphics
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowDisposeEvent;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class WindowRenderer implements IWindowRenderer
   {
       
      
      private var var_50:DisplayObjectContainer;
      
      private var _disposed:Boolean;
      
      private var var_655:ISkinContainer;
      
      private var var_1396:Rectangle;
      
      private var var_288:Dictionary;
      
      private var _drawBufferAllocator:DrawBufferAllocator;
      
      private var _debug:Boolean = false;
      
      private var var_530:Array;
      
      private var var_287:Rectangle;
      
      private var var_1397:Point;
      
      public function WindowRenderer(param1:ISkinContainer)
      {
         super();
         _disposed = false;
         var_530 = new Array();
         var_1397 = new Point();
         var_1396 = new Rectangle();
         var_287 = new Rectangle();
         var_288 = new Dictionary(true);
         var_655 = param1;
         _drawBufferAllocator = new DrawBufferAllocator();
      }
      
      private static function getDrawLocationAndClipRegion(param1:WindowController, param2:Rectangle, param3:Point, param4:Rectangle) : Boolean
      {
         var _loc7_:int = 0;
         var _loc5_:Rectangle = param1.rectangle.clone();
         var _loc6_:Boolean = true;
         param4.x = 0;
         param4.y = 0;
         param4.width = _loc5_.width;
         param4.height = _loc5_.height;
         if(!param1.testParamFlag(WindowParam.const_29))
         {
            param3.x = 0;
            param3.y = 0;
         }
         else if(param1.parent != null)
         {
            _loc6_ = WindowController(param1.parent).childRectToClippedDrawRegion(_loc5_,param4);
            param3.x = _loc5_.x;
            param3.y = _loc5_.y;
         }
         else
         {
            param3.x = 0;
            param3.y = 0;
         }
         if(param2.x > param4.x)
         {
            _loc7_ = param2.x - param4.x;
            param3.x += _loc7_;
            param4.x += _loc7_;
            param4.width -= _loc7_;
         }
         if(param2.y > param4.y)
         {
            _loc7_ = param2.y - param4.y;
            param3.y += _loc7_;
            param4.y += _loc7_;
            param4.height -= _loc7_;
         }
         if(param2.right < param4.right)
         {
            _loc7_ = param4.right - param2.right;
            param4.width -= _loc7_;
         }
         if(param2.bottom < param4.bottom)
         {
            _loc7_ = param4.bottom - param2.bottom;
            param4.height -= _loc7_;
         }
         return _loc6_ && param4.width > 0 && param4.height > 0;
      }
      
      public function getDrawBufferForRenderable(param1:IWindow) : BitmapData
      {
         var _loc2_:WindowRendererItem = var_288[param1] as WindowRendererItem;
         return _loc2_ != null ? _loc2_.buffer : null;
      }
      
      public function update(param1:uint) : void
      {
         render();
         flushRenderQueue();
      }
      
      public function get debug() : Boolean
      {
         return _debug;
      }
      
      public function render() : void
      {
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc1_ = var_530.pop() as WindowController;
            if(!_loc1_.disposed)
            {
               _loc3_ = getWindowRendererItem(_loc1_);
               var_287.x = _loc3_.dirty.x;
               var_287.y = _loc3_.dirty.y;
               var_287.width = _loc3_.dirty.width;
               var_287.height = _loc3_.dirty.height;
               renderWindowBranch(_loc1_,_loc3_,var_287);
            }
            _loc4_++;
         }
      }
      
      public function removeRenderable(param1:IWindow) : void
      {
         param1.removeEventListener(WindowDisposeEvent.const_529,windowDisposedCallback);
         var _loc2_:WindowRendererItem = var_288[param1] as WindowRendererItem;
         if(_loc2_ != null)
         {
            _loc2_.dispose();
            delete var_288[param1];
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(!_disposed)
         {
            _disposed = true;
            var_530 = null;
            for(_loc1_ in var_288)
            {
               delete var_288[_loc1_];
            }
            var_288 = null;
            _drawBufferAllocator.dispose();
            _drawBufferAllocator = null;
         }
      }
      
      public function get allocatedByteCount() : uint
      {
         return _drawBufferAllocator.allocatedByteCount;
      }
      
      private function windowDisposedCallback(param1:WindowDisposeEvent) : void
      {
         removeRenderable(param1.window);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function set debug(param1:Boolean) : void
      {
         _debug = param1;
      }
      
      private function renderWindowBranch(param1:WindowController, param2:WindowRendererItem, param3:Rectangle) : void
      {
         var _loc4_:* = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         if(param1.visible)
         {
            if(getDrawLocationAndClipRegion(param1,param3,var_1397,var_1396))
            {
               if(param2.render(param1,var_1397,var_1396))
               {
                  _loc4_ = uint(param1.numChildren);
                  _loc7_ = 0;
                  while(_loc7_ < _loc4_)
                  {
                     _loc5_ = param1.getChildAt(_loc7_) as WindowController;
                     _loc6_ = _loc5_.rectangle;
                     if(_loc6_.intersects(param3))
                     {
                        if(_loc5_.testParamFlag(WindowParam.const_29))
                        {
                           param3.offset(-_loc6_.x,-_loc6_.y);
                           renderWindowBranch(_loc5_,getWindowRendererItem(_loc5_),param3);
                           param3.offset(_loc6_.x,_loc6_.y);
                        }
                     }
                     _loc7_++;
                  }
               }
            }
         }
      }
      
      public function registerRenderable(param1:IWindow) : void
      {
         var _loc2_:WindowRendererItem = var_288[param1] as WindowRendererItem;
         if(_loc2_ == null)
         {
            _loc2_ = new WindowRendererItem(this,_drawBufferAllocator,var_655);
            var_288[param1] = _loc2_;
            param1.addEventListener(WindowDisposeEvent.const_529,windowDisposedCallback);
         }
      }
      
      public function invalidate(param1:IWindowContext, param2:Rectangle) : void
      {
         var _loc5_:* = null;
         var _loc3_:IDesktopWindow = param1.getDesktopWindow();
         var _loc4_:uint = _loc3_.numChildren;
         while(_loc4_-- > 0)
         {
            _loc5_ = _loc3_.getChildAt(_loc4_) as WindowController;
            addToRenderQueue(_loc5_,_loc5_.rectangle,WindowRedrawFlag.const_70);
         }
      }
      
      protected function getWindowRendererItem(param1:IWindow) : WindowRendererItem
      {
         var _loc2_:WindowRendererItem = var_288[param1] as WindowRendererItem;
         if(_loc2_ == null)
         {
            registerRenderable(param1);
            _loc2_ = var_288[param1];
         }
         return _loc2_;
      }
      
      public function flushRenderQueue() : void
      {
         while(var_530.pop() != null)
         {
         }
      }
      
      public function addToRenderQueue(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(getWindowRendererItem(param1).invalidate(param1,param2,param3))
         {
            _loc5_ = param1.context.getDesktopWindow();
            var_287.x = param2.x - param1.x;
            var_287.y = param2.y - param1.y;
            var_287.width = param2.width;
            var_287.height = param2.height;
            if(param1.testParamFlag(WindowParam.const_29))
            {
               while(param1.testParamFlag(WindowParam.const_29))
               {
                  _loc4_ = param1.parent as WindowController;
                  if(_loc4_ == null)
                  {
                     return;
                  }
                  if(_loc4_ == _loc5_)
                  {
                     return;
                  }
                  if(_loc4_.visible == false)
                  {
                     return;
                  }
                  var_287.offset(param1.x,param1.y);
                  param1 = _loc4_;
               }
            }
            getWindowRendererItem(param1).invalidate(param1,var_287,WindowRedrawFlag.const_239);
            if(var_530.indexOf(param1) == -1)
            {
               var_530.push(param1);
            }
         }
      }
   }
}

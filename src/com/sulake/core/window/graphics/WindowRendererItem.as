package com.sulake.core.window.graphics
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowStyle;
   import com.sulake.core.window.graphics.renderer.ISkinRenderer;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowRendererItem implements IDisposable
   {
      
      private static const const_488:uint = 0;
      
      private static const const_752:uint = 1;
      
      private static const const_751:uint = 2;
       
      
      private var var_655:ISkinContainer;
      
      private var _drawBufferAllocator:DrawBufferAllocator;
      
      private var _disposed:Boolean;
      
      private var var_217:Rectangle;
      
      private var var_216:Boolean;
      
      private var var_92:BitmapData;
      
      private var var_928:Matrix;
      
      private var var_134:WindowRenderer;
      
      private var var_993:uint;
      
      private var _colorTransform:ColorTransform;
      
      private var var_654:uint;
      
      public function WindowRendererItem(param1:WindowRenderer, param2:DrawBufferAllocator, param3:ISkinContainer)
      {
         super();
         _disposed = false;
         var_134 = param1;
         var_655 = param3;
         _drawBufferAllocator = param2;
         var_993 = 4294967295;
         var_654 = 0;
         _colorTransform = new ColorTransform();
         var_928 = new Matrix();
         var_217 = new Rectangle();
      }
      
      public function get buffer() : BitmapData
      {
         return var_92;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : Boolean
      {
         var _loc4_:Boolean = false;
         switch(param3)
         {
            case WindowRedrawFlag.const_70:
               var_216 = true;
               _loc4_ = true;
               break;
            case WindowRedrawFlag.RESIZE:
               var_216 = true;
               _loc4_ = true;
               break;
            case WindowRedrawFlag.const_377:
               if(param1.testParamFlag(WindowParam.const_29))
               {
                  _loc4_ = true;
               }
               else
               {
                  IGraphicContextHost(param1).getGraphicContext(true).setDrawRegion(param1.rectangle,false);
               }
               break;
            case WindowRedrawFlag.const_889:
               var_654 = var_655.getTheActualState(param1.type,param1.style,param1.state);
               if(var_654 != var_993)
               {
                  var_216 = true;
                  _loc4_ = true;
               }
               break;
            case WindowRedrawFlag.const_966:
               if(param1.testParamFlag(WindowParam.const_29))
               {
                  var_216 = true;
                  _loc4_ = true;
               }
               else
               {
                  IGraphicContextHost(param1).getGraphicContext(true).blend = param1.blend;
               }
               break;
            case WindowRedrawFlag.const_239:
               _loc4_ = true;
         }
         if(_loc4_)
         {
            var_217.left = Math.min(var_217.left,param2.left);
            var_217.top = Math.min(var_217.top,param2.top);
            var_217.right = Math.max(var_217.right,param2.right);
            var_217.bottom = Math.max(var_217.bottom,param2.bottom);
         }
         return _loc4_;
      }
      
      public function testForStateChange(param1:IWindow) : Boolean
      {
         return var_655.getTheActualState(param1.type,param1.style,param1.state) != var_993;
      }
      
      public function get dirty() : Rectangle
      {
         return var_217;
      }
      
      public function render(param1:IWindow, param2:Point, param3:Rectangle) : Boolean
      {
         var _loc4_:* = null;
         var _loc10_:* = 0;
         var _loc5_:uint = !!param1.background ? uint(const_751) : uint(const_488);
         var _loc6_:ISkinRenderer = resolveSkinRenderer(param1);
         if(_loc6_ != null)
         {
            _loc5_ = !!_loc6_.isStateDrawable(var_654) ? uint(const_752) : uint(_loc5_);
         }
         var _loc7_:int = Math.max(param1.width,1);
         var _loc8_:int = Math.max(param1.height,1);
         if(_loc5_ != const_488)
         {
            if(var_92 == null)
            {
               var_92 = _drawBufferAllocator.allocate(_loc7_,_loc8_,true,param1.color);
               var_216 = true;
            }
            else if(var_92.width != _loc7_ || var_92.height != _loc8_)
            {
               _drawBufferAllocator.free(var_92);
               var_92 = _drawBufferAllocator.allocate(_loc7_,_loc8_,true,param1.color);
               var_216 = true;
            }
         }
         var _loc9_:IGraphicContext = IGraphicContextHost(param1).getGraphicContext(false);
         if(_loc9_)
         {
            _loc9_.setDrawRegion(param1.rectangle,!param1.testParamFlag(WindowParam.const_29));
         }
         if(_loc5_ != const_488)
         {
            var_993 = var_654;
            _loc4_ = param1.fetchDrawBuffer() as BitmapData;
            if(_loc4_ != null)
            {
               _loc4_.lock();
               if(_loc5_ == const_752)
               {
                  if(!param1.testParamFlag(WindowParam.const_29))
                  {
                     _loc4_.fillRect(param3,0);
                  }
                  if(var_216)
                  {
                     var_216 = false;
                     var_92.fillRect(var_92.rect,param1.color);
                     _loc6_.draw(param1,var_92,var_92.rect,var_654,false);
                     if(!param1.background)
                     {
                        _loc10_ = uint(param1.color);
                        if((_loc10_ & 16777215) < 16777215)
                        {
                           var_92.colorTransform(_loc4_.rect,new ColorTransform(((_loc10_ & 16711680) >> 16) / 255,((_loc10_ & 65280) >> 8) / 255,(_loc10_ & 255) / 255));
                        }
                     }
                  }
                  if(param1.blend < 1 && param1.testParamFlag(WindowParam.const_29))
                  {
                     var_928.tx = param2.x;
                     var_928.ty = param2.y;
                     _colorTransform.alphaMultiplier = param1.blend;
                     param3.offset(param2.x,param2.y);
                     _loc4_.draw(var_92,var_928,_colorTransform,null,param3,false);
                     param3.offset(-param2.x,-param2.y);
                  }
                  else
                  {
                     _loc4_.copyPixels(var_92,param3,param2,null,null,true);
                  }
               }
               else if(_loc5_ == const_751)
               {
                  if(param1.testParamFlag(WindowParam.const_29))
                  {
                     var_92.fillRect(var_92.rect,param1.color);
                     _loc4_.copyPixels(var_92,param3,param2,null,null,true);
                  }
                  else
                  {
                     _loc4_.fillRect(new Rectangle(param2.x,param2.y,param3.width,param3.height),param1.color);
                     _loc9_.blend = param1.blend;
                  }
               }
               _loc4_.unlock();
            }
            var_217.left = int.MAX_VALUE;
            var_217.top = int.MAX_VALUE;
            var_217.right = int.MIN_VALUE;
            var_217.bottom = int.MIN_VALUE;
         }
         return true;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
            var_134 = null;
            var_655 = null;
            if(var_92 != null)
            {
               _drawBufferAllocator.free(var_92);
               var_92 = null;
            }
         }
      }
      
      private function drawRect(param1:BitmapData, param2:Rectangle, param3:uint) : void
      {
         var _loc4_:int = 0;
         _loc4_ = param2.left;
         while(_loc4_ < param2.right)
         {
            param1.setPixel32(_loc4_,param2.top,param3);
            param1.setPixel32(_loc4_,param2.bottom - 1,param3);
            _loc4_++;
         }
         _loc4_ = param2.top;
         while(_loc4_ < param2.bottom)
         {
            param1.setPixel32(param2.left,_loc4_,param3);
            param1.setPixel32(param2.right - 1,_loc4_,param3);
            _loc4_++;
         }
      }
      
      private function resolveSkinRenderer(param1:IWindow) : ISkinRenderer
      {
         var _loc2_:ISkinRenderer = var_655.getSkinRendererByType(param1.type,param1.style);
         if(_loc2_ == null)
         {
            if(param1.style != WindowStyle.const_834)
            {
               _loc2_ = var_655.getSkinRendererByType(param1.type,WindowStyle.const_834);
            }
         }
         return _loc2_;
      }
   }
}

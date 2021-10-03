package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowType;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IWindowToolTipAgentService
   {
       
      
      protected var var_312:Timer;
      
      protected var var_920:String;
      
      protected var var_921:uint;
      
      protected var var_1095:Point;
      
      protected var var_239:IToolTipWindow;
      
      protected var var_1094:Point;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         var_1095 = new Point();
         var_1094 = new Point(20,20);
         var_921 = 500;
         super(param1);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         if(var_312 != null)
         {
            var_312.stop();
            var_312.removeEventListener(TimerEvent.TIMER,showToolTip);
            var_312 = null;
         }
         hideToolTip();
         return super.end(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
         if(_window && true)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,var_1095);
            if(var_239 != null && true)
            {
               var_239.x = param1 + var_1094.x;
               var_239.y = param2 + var_1094.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         if(var_312 != null)
         {
            var_312.reset();
         }
         if(_window && true)
         {
            if(var_239 == null || false)
            {
               var_239 = _window.context.create("undefined::ToolTip",var_920,WindowType.const_289,_window.style,0 | 0,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            var_239.x = _loc2_.x + var_1095.x + var_1094.x;
            var_239.y = _loc2_.y + var_1095.y + var_1094.y;
         }
      }
      
      override public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               var_920 = IInteractiveWindow(param1).toolTipCaption;
               var_921 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               var_920 = param1.caption;
               var_921 = 500;
            }
            _mouse.x = var_119.mouseX;
            _mouse.y = var_119.mouseY;
            getMousePositionRelativeTo(param1,_mouse,var_1095);
            if(var_920 != null && var_920 != "")
            {
               if(var_312 == null)
               {
                  var_312 = new Timer(var_921,1);
                  var_312.addEventListener(TimerEvent.TIMER,showToolTip);
               }
               var_312.reset();
               var_312.start();
            }
         }
         return super.begin(param1,param2);
      }
      
      protected function hideToolTip() : void
      {
         if(var_239 != null && true)
         {
            var_239.destroy();
            var_239 = null;
         }
      }
   }
}

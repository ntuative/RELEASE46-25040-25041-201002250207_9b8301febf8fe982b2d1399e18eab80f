package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_119:DisplayObject;
      
      private var var_2276:uint;
      
      private var var_760:IWindowToolTipAgentService;
      
      private var var_758:IWindowMouseScalingService;
      
      private var var_227:IWindowContext;
      
      private var var_761:IWindowFocusManagerService;
      
      private var var_757:IWindowMouseListenerService;
      
      private var var_759:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2276 = 0;
         var_119 = param2;
         var_227 = param1;
         var_759 = new WindowMouseDragger(param2);
         var_758 = new WindowMouseScaler(param2);
         var_757 = new WindowMouseListener(param2);
         var_761 = new FocusManager(param2);
         var_760 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_758;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_761;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_760;
      }
      
      public function dispose() : void
      {
         if(var_759 != null)
         {
            var_759.dispose();
            var_759 = null;
         }
         if(var_758 != null)
         {
            var_758.dispose();
            var_758 = null;
         }
         if(var_757 != null)
         {
            var_757.dispose();
            var_757 = null;
         }
         if(var_761 != null)
         {
            var_761.dispose();
            var_761 = null;
         }
         if(var_760 != null)
         {
            var_760.dispose();
            var_760 = null;
         }
         var_227 = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_757;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_759;
      }
   }
}

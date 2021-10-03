package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_291:String = "WE_CHILD_RESIZED";
      
      public static const const_1223:String = "WE_CLOSE";
      
      public static const const_1219:String = "WE_DESTROY";
      
      public static const const_145:String = "WE_CHANGE";
      
      public static const const_1314:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1498:String = "WE_PARENT_RESIZE";
      
      public static const const_90:String = "WE_UPDATE";
      
      public static const const_1183:String = "WE_MAXIMIZE";
      
      public static const const_357:String = "WE_DESTROYED";
      
      public static const const_994:String = "WE_UNSELECT";
      
      public static const const_1220:String = "WE_MAXIMIZED";
      
      public static const const_1531:String = "WE_UNLOCKED";
      
      public static const const_384:String = "WE_CHILD_REMOVED";
      
      public static const const_162:String = "WE_OK";
      
      public static const const_42:String = "WE_RESIZED";
      
      public static const const_1147:String = "WE_ACTIVATE";
      
      public static const const_259:String = "WE_ENABLED";
      
      public static const const_401:String = "WE_CHILD_RELOCATED";
      
      public static const const_1304:String = "WE_CREATE";
      
      public static const const_722:String = "WE_SELECT";
      
      public static const const_173:String = "";
      
      public static const const_1577:String = "WE_LOCKED";
      
      public static const const_1465:String = "WE_PARENT_RELOCATE";
      
      public static const const_1446:String = "WE_CHILD_REMOVE";
      
      public static const const_1543:String = "WE_CHILD_RELOCATE";
      
      public static const const_1522:String = "WE_LOCK";
      
      public static const const_198:String = "WE_FOCUSED";
      
      public static const const_580:String = "WE_UNSELECTED";
      
      public static const const_828:String = "WE_DEACTIVATED";
      
      public static const const_1341:String = "WE_MINIMIZED";
      
      public static const const_1433:String = "WE_ARRANGED";
      
      public static const const_1544:String = "WE_UNLOCK";
      
      public static const const_1570:String = "WE_ATTACH";
      
      public static const const_1327:String = "WE_OPEN";
      
      public static const const_1165:String = "WE_RESTORE";
      
      public static const const_1435:String = "WE_PARENT_RELOCATED";
      
      public static const const_1312:String = "WE_RELOCATE";
      
      public static const const_1443:String = "WE_CHILD_RESIZE";
      
      public static const const_1536:String = "WE_ARRANGE";
      
      public static const const_1320:String = "WE_OPENED";
      
      public static const const_1133:String = "WE_CLOSED";
      
      public static const const_1425:String = "WE_DETACHED";
      
      public static const const_1532:String = "WE_UPDATED";
      
      public static const const_1295:String = "WE_UNFOCUSED";
      
      public static const const_410:String = "WE_RELOCATED";
      
      public static const const_1243:String = "WE_DEACTIVATE";
      
      public static const const_186:String = "WE_DISABLED";
      
      public static const const_552:String = "WE_CANCEL";
      
      public static const const_517:String = "WE_ENABLE";
      
      public static const const_1382:String = "WE_ACTIVATED";
      
      public static const const_1221:String = "WE_FOCUS";
      
      public static const const_1584:String = "WE_DETACH";
      
      public static const const_1325:String = "WE_RESTORED";
      
      public static const const_1178:String = "WE_UNFOCUS";
      
      public static const const_51:String = "WE_SELECTED";
      
      public static const const_1197:String = "WE_PARENT_RESIZED";
      
      public static const const_1372:String = "WE_CREATED";
      
      public static const const_1517:String = "WE_ATTACHED";
      
      public static const const_1248:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1586:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1361:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1586 = param3;
         var_1361 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1361;
      }
      
      public function get related() : IWindow
      {
         return var_1586;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1361 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}

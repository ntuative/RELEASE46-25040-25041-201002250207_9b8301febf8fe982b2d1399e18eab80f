package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1376:String = "WN_CREATED";
      
      public static const const_838:String = "WN_DISABLE";
      
      public static const const_952:String = "WN_DEACTIVATED";
      
      public static const const_925:String = "WN_OPENED";
      
      public static const const_864:String = "WN_CLOSED";
      
      public static const const_913:String = "WN_DESTROY";
      
      public static const const_1581:String = "WN_ARRANGED";
      
      public static const const_452:String = "WN_PARENT_RESIZED";
      
      public static const const_882:String = "WN_ENABLE";
      
      public static const const_990:String = "WN_RELOCATE";
      
      public static const const_861:String = "WN_FOCUS";
      
      public static const const_801:String = "WN_PARENT_RELOCATED";
      
      public static const const_425:String = "WN_PARAM_UPDATED";
      
      public static const const_699:String = "WN_PARENT_ACTIVATED";
      
      public static const const_193:String = "WN_RESIZED";
      
      public static const const_1001:String = "WN_CLOSE";
      
      public static const const_904:String = "WN_PARENT_REMOVED";
      
      public static const const_240:String = "WN_CHILD_RELOCATED";
      
      public static const const_532:String = "WN_ENABLED";
      
      public static const const_251:String = "WN_CHILD_RESIZED";
      
      public static const const_967:String = "WN_MINIMIZED";
      
      public static const const_540:String = "WN_DISABLED";
      
      public static const const_206:String = "WN_CHILD_ACTIVATED";
      
      public static const const_391:String = "WN_STATE_UPDATED";
      
      public static const const_637:String = "WN_UNSELECTED";
      
      public static const const_412:String = "WN_STYLE_UPDATED";
      
      public static const const_1427:String = "WN_UPDATE";
      
      public static const const_437:String = "WN_PARENT_ADDED";
      
      public static const const_554:String = "WN_RESIZE";
      
      public static const const_519:String = "WN_CHILD_REMOVED";
      
      public static const const_1508:String = "";
      
      public static const const_970:String = "WN_RESTORED";
      
      public static const const_329:String = "WN_SELECTED";
      
      public static const const_918:String = "WN_MINIMIZE";
      
      public static const const_917:String = "WN_FOCUSED";
      
      public static const const_1245:String = "WN_LOCK";
      
      public static const const_279:String = "WN_CHILD_ADDED";
      
      public static const const_796:String = "WN_UNFOCUSED";
      
      public static const const_411:String = "WN_RELOCATED";
      
      public static const const_800:String = "WN_DEACTIVATE";
      
      public static const const_1370:String = "WN_CRETAE";
      
      public static const const_964:String = "WN_RESTORE";
      
      public static const const_298:String = "WN_ACTVATED";
      
      public static const const_1332:String = "WN_LOCKED";
      
      public static const const_367:String = "WN_SELECT";
      
      public static const const_914:String = "WN_MAXIMIZE";
      
      public static const const_850:String = "WN_OPEN";
      
      public static const const_658:String = "WN_UNSELECT";
      
      public static const const_1502:String = "WN_ARRANGE";
      
      public static const const_1354:String = "WN_UNLOCKED";
      
      public static const const_1507:String = "WN_UPDATED";
      
      public static const const_949:String = "WN_ACTIVATE";
      
      public static const const_1260:String = "WN_UNLOCK";
      
      public static const const_916:String = "WN_MAXIMIZED";
      
      public static const const_897:String = "WN_DESTROYED";
      
      public static const const_868:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1586,cancelable);
      }
   }
}

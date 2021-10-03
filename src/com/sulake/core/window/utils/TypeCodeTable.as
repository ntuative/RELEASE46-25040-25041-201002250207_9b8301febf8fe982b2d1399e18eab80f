package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_501;
         param1["bitmap"] = const_600;
         param1["border"] = const_736;
         param1["border_notify"] = const_1294;
         param1["button"] = const_481;
         param1["button_thick"] = const_640;
         param1["button_icon"] = const_1226;
         param1["button_group_left"] = const_578;
         param1["button_group_center"] = const_545;
         param1["button_group_right"] = const_660;
         param1["canvas"] = const_686;
         param1["checkbox"] = const_515;
         param1["closebutton"] = const_819;
         param1["container"] = const_335;
         param1["container_button"] = const_682;
         param1["display_object_wrapper"] = const_708;
         param1["dropmenu"] = const_415;
         param1["dropmenu_item"] = const_436;
         param1["frame"] = const_303;
         param1["frame_notify"] = const_1136;
         param1["header"] = const_587;
         param1["icon"] = const_979;
         param1["itemgrid"] = const_892;
         param1["itemgrid_horizontal"] = const_351;
         param1["itemgrid_vertical"] = const_700;
         param1["itemlist"] = const_791;
         param1["itemlist_horizontal"] = const_310;
         param1["itemlist_vertical"] = const_321;
         param1["maximizebox"] = const_1358;
         param1["menu"] = const_1284;
         param1["menu_item"] = WINDOW_TYPE_MENU_ITEM;
         param1["submenu"] = const_815;
         param1["minimizebox"] = const_1334;
         param1["notify"] = const_1214;
         param1["PollContentDialog"] = const_685;
         param1["password"] = const_703;
         param1["radiobutton"] = const_669;
         param1["region"] = const_408;
         param1["restorebox"] = const_1333;
         param1["scaler"] = const_935;
         param1["scaler_horizontal"] = const_1173;
         param1["scaler_vertical"] = const_1185;
         param1["scrollbar_horizontal"] = const_423;
         param1["scrollbar_vertical"] = const_525;
         param1["scrollbar_slider_button_up"] = const_821;
         param1["scrollbar_slider_button_down"] = const_863;
         param1["scrollbar_slider_button_left"] = const_877;
         param1["scrollbar_slider_button_right"] = const_890;
         param1["scrollbar_slider_bar_horizontal"] = const_941;
         param1["scrollbar_slider_bar_vertical"] = const_944;
         param1["scrollbar_slider_track_horizontal"] = const_856;
         param1["scrollbar_slider_track_vertical"] = const_847;
         param1["scrollable_itemlist"] = const_1253;
         param1["scrollable_itemlist_vertical"] = const_440;
         param1["scrollable_itemlist_horizontal"] = const_931;
         param1["selector"] = const_584;
         param1["selector_list"] = const_621;
         param1["submenu"] = const_815;
         param1["tab_button"] = const_563;
         param1["tab_container_button"] = const_881;
         param1["tab_context"] = const_406;
         param1["tab_content"] = const_896;
         param1["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
         param1["text"] = const_555;
         param1["input"] = const_673;
         param1["toolbar"] = const_1149;
         param1["tooltip"] = const_289;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}

package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["PollContentDialog"] = const_110;
         param1["bound_to_parent_rect"] = const_83;
         param1["child_window"] = const_901;
         param1["embedded_controller"] = const_312;
         param1["resize_to_accommodate_children"] = const_61;
         param1["input_event_processor"] = const_47;
         param1["internal_event_handling"] = const_671;
         param1["mouse_dragging_target"] = const_194;
         param1["mouse_dragging_trigger"] = const_319;
         param1["mouse_scaling_target"] = const_264;
         param1["mouse_scaling_trigger"] = const_430;
         param1["horizontal_mouse_scaling_trigger"] = const_208;
         param1["vertical_mouse_scaling_trigger"] = const_226;
         param1["observe_parent_input_events"] = const_920;
         param1["optimize_region_to_layout_size"] = const_393;
         param1["parent_window"] = const_788;
         param1["relative_horizontal_scale_center"] = const_171;
         param1["relative_horizontal_scale_fixed"] = const_112;
         param1["relative_horizontal_scale_move"] = const_307;
         param1["relative_horizontal_scale_strech"] = const_250;
         param1["relative_scale_center"] = const_799;
         param1["relative_scale_fixed"] = const_652;
         param1["relative_scale_move"] = const_831;
         param1["relative_scale_strech"] = const_1007;
         param1["relative_vertical_scale_center"] = const_168;
         param1["relative_vertical_scale_fixed"] = const_123;
         param1["relative_vertical_scale_move"] = const_284;
         param1["relative_vertical_scale_strech"] = const_255;
         param1["on_resize_align_left"] = const_666;
         param1["on_resize_align_right"] = const_404;
         param1["on_resize_align_center"] = const_359;
         param1["on_resize_align_top"] = const_696;
         param1["on_resize_align_bottom"] = const_363;
         param1["on_resize_align_middle"] = const_463;
         param1["on_accommodate_align_left"] = const_879;
         param1["on_accommodate_align_right"] = const_453;
         param1["on_accommodate_align_center"] = const_526;
         param1["on_accommodate_align_top"] = const_789;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_737;
         param1["route_input_events_to_parent"] = const_392;
         param1["use_parent_graphic_context"] = const_29;
         param1["draggable_with_mouse"] = const_1010;
         param1["scalable_with_mouse"] = const_1013;
         param1["reflect_horizontal_resize_to_parent"] = const_417;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_238;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}

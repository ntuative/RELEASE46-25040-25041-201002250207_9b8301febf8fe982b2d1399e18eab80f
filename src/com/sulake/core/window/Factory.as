package com.sulake.core.window
{
   import com.sulake.core.window.components.ActivatorController;
   import com.sulake.core.window.components.BackgroundController;
   import com.sulake.core.window.components.BitmapWrapperController;
   import com.sulake.core.window.components.BorderController;
   import com.sulake.core.window.components.ButtonController;
   import com.sulake.core.window.components.CanvasController;
   import com.sulake.core.window.components.CheckBoxController;
   import com.sulake.core.window.components.ContainerButtonController;
   import com.sulake.core.window.components.ContainerController;
   import com.sulake.core.window.components.DisplayObjectWrapperController;
   import com.sulake.core.window.components.DropMenuController;
   import com.sulake.core.window.components.DropMenuItemController;
   import com.sulake.core.window.components.FrameController;
   import com.sulake.core.window.components.HeaderController;
   import com.sulake.core.window.components.IconController;
   import com.sulake.core.window.components.InteractiveController;
   import com.sulake.core.window.components.ItemGridController;
   import com.sulake.core.window.components.ItemListController;
   import com.sulake.core.window.components.PasswordFieldController;
   import com.sulake.core.window.components.RadioButtonController;
   import com.sulake.core.window.components.RegionController;
   import com.sulake.core.window.components.ScalerController;
   import com.sulake.core.window.components.ScrollableItemListWindow;
   import com.sulake.core.window.components.ScrollbarController;
   import com.sulake.core.window.components.ScrollbarLiftController;
   import com.sulake.core.window.components.SelectableButtonController;
   import com.sulake.core.window.components.SelectorController;
   import com.sulake.core.window.components.TabButtonController;
   import com.sulake.core.window.components.TabContainerButtonController;
   import com.sulake.core.window.components.TabContextController;
   import com.sulake.core.window.components.TabSelectorController;
   import com.sulake.core.window.components.TextController;
   import com.sulake.core.window.components.TextFieldController;
   import com.sulake.core.window.components.ToolTipController;
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class Factory
   {
       
      
      protected var var_11:Dictionary;
      
      public function Factory()
      {
         super();
         var_11 = new Dictionary();
         var_11["null"] = WindowController;
         var_11["null"] = ActivatorController;
         var_11["null"] = BackgroundController;
         var_11["null"] = BorderController;
         var_11["null"] = ButtonController;
         var_11["null"] = ButtonController;
         var_11["null"] = SelectableButtonController;
         var_11["null"] = SelectableButtonController;
         var_11["null"] = SelectableButtonController;
         var_11["null"] = BitmapWrapperController;
         var_11["null"] = CanvasController;
         var_11["null"] = CheckBoxController;
         var_11["null"] = ContainerController;
         var_11["null"] = ContainerButtonController;
         var_11["null"] = InteractiveController;
         var_11["null"] = DisplayObjectWrapperController;
         var_11["null"] = ScrollbarLiftController;
         var_11["null"] = DropMenuController;
         var_11["null"] = DropMenuItemController;
         var_11["null"] = FrameController;
         var_11["null"] = HeaderController;
         var_11["null"] = IconController;
         var_11["null"] = ItemListController;
         var_11["null"] = ItemListController;
         var_11["null"] = ItemListController;
         var_11["null"] = ItemGridController;
         var_11["null"] = ItemGridController;
         var_11["null"] = ItemGridController;
         var_11["null"] = PasswordFieldController;
         var_11["null"] = RadioButtonController;
         var_11["null"] = RegionController;
         var_11["null"] = ScalerController;
         var_11["null"] = ScrollbarController;
         var_11["null"] = ScrollbarController;
         var_11["null"] = ButtonController;
         var_11["null"] = ButtonController;
         var_11["null"] = ButtonController;
         var_11["null"] = ButtonController;
         var_11["null"] = ScrollbarLiftController;
         var_11["null"] = ScrollbarLiftController;
         var_11["null"] = WindowController;
         var_11["null"] = WindowController;
         var_11["null"] = ScrollableItemListWindow;
         var_11["null"] = SelectorController;
         var_11["null"] = TabSelectorController;
         var_11["null"] = TabButtonController;
         var_11["null"] = TabContainerButtonController;
         var_11["null"] = ContainerController;
         var_11["null"] = TabContextController;
         var_11["null"] = TabSelectorController;
         var_11["null"] = TextController;
         var_11["null"] = TextFieldController;
         var_11["null"] = ToolTipController;
      }
      
      public function getWindowClassByType(param1:uint) : Class
      {
         return var_11[param1];
      }
   }
}

package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_601:int = 6;
      
      public static const const_191:int = 5;
      
      public static const const_571:int = 2;
      
      public static const const_334:int = 9;
      
      public static const const_327:int = 4;
      
      public static const const_242:int = 2;
      
      public static const const_642:int = 4;
      
      public static const const_207:int = 8;
      
      public static const const_535:int = 7;
      
      public static const const_271:int = 3;
      
      public static const const_330:int = 1;
      
      public static const const_214:int = 5;
      
      public static const const_353:int = 12;
      
      public static const const_318:int = 1;
      
      public static const const_536:int = 11;
      
      public static const const_657:int = 3;
      
      public static const const_1580:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_424:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_424 = new Array();
         var_424.push(new Tab(_navigator,const_330,const_353,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_386));
         var_424.push(new Tab(_navigator,const_242,const_318,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_386));
         var_424.push(new Tab(_navigator,const_327,const_536,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_833));
         var_424.push(new Tab(_navigator,const_271,const_191,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_386));
         var_424.push(new Tab(_navigator,const_214,const_207,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_709));
         setSelectedTab(const_330);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_424)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_424)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_424)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_327;
      }
      
      public function get tabs() : Array
      {
         return var_424;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}

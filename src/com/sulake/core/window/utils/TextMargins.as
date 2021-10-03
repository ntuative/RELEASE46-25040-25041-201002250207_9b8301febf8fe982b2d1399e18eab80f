package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.IDisposable;
   
   public class TextMargins implements IMargins, IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_869:int;
      
      private var _right:int;
      
      private var var_871:int;
      
      private var var_870:int;
      
      private var var_180:Function;
      
      public function TextMargins(param1:int, param2:int, param3:int, param4:int, param5:Function)
      {
         super();
         var_871 = param1;
         var_870 = param2;
         _right = param3;
         var_869 = param4;
         var_180 = param5 != null ? param5 : nullCallback;
      }
      
      public function set bottom(param1:int) : void
      {
         var_869 = param1;
         var_180(this);
      }
      
      public function get left() : int
      {
         return var_871;
      }
      
      public function get isZeroes() : Boolean
      {
         return var_871 == 0 && _right == 0 && var_870 == 0 && var_869 == 0;
      }
      
      public function get right() : int
      {
         return _right;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function set top(param1:int) : void
      {
         var_870 = param1;
         var_180(this);
      }
      
      public function get top() : int
      {
         return var_870;
      }
      
      public function set left(param1:int) : void
      {
         var_871 = param1;
         var_180(this);
      }
      
      public function get bottom() : int
      {
         return var_869;
      }
      
      public function clone(param1:Function) : TextMargins
      {
         return new TextMargins(var_871,var_870,_right,var_869,param1);
      }
      
      public function dispose() : void
      {
         var_180 = null;
         _disposed = true;
      }
      
      public function set right(param1:int) : void
      {
         _right = param1;
         var_180(this);
      }
      
      private function nullCallback(param1:IMargins) : void
      {
      }
   }
}

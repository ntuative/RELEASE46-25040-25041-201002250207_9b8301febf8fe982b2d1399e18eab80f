package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1263:IID;
      
      private var _isDisposed:Boolean;
      
      private var var_847:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         var_1263 = param1;
         var_847 = new Array();
         _isDisposed = false;
      }
      
      public function get receivers() : Array
      {
         return var_847;
      }
      
      public function get identifier() : IID
      {
         return var_1263;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function dispose() : void
      {
         if(!_isDisposed)
         {
            _isDisposed = true;
            var_1263 = null;
            while(false)
            {
               var_847.pop();
            }
            var_847 = null;
         }
      }
   }
}

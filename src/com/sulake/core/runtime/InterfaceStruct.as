package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_405:uint;
      
      private var var_1033:IUnknown;
      
      private var var_1241:String;
      
      private var var_1034:IID;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_1034 = param1;
         var_1241 = getQualifiedClassName(var_1034);
         var_1033 = param2;
         var_405 = 0;
      }
      
      public function get iid() : IID
      {
         return var_1034;
      }
      
      public function get disposed() : Boolean
      {
         return var_1033 == null;
      }
      
      public function get references() : uint
      {
         return var_405;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_405) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_1033;
      }
      
      public function get iis() : String
      {
         return var_1241;
      }
      
      public function reserve() : uint
      {
         return ++var_405;
      }
      
      public function dispose() : void
      {
         var_1034 = null;
         var_1241 = null;
         var_1033 = null;
         var_405 = 0;
      }
   }
}

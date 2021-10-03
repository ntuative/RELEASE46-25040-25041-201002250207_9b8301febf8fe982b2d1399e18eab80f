package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1385:BigInteger;
      
      private var var_968:BigInteger;
      
      private var var_1621:BigInteger;
      
      private var var_1386:BigInteger;
      
      private var var_1622:BigInteger;
      
      private var var_1623:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1385 = param1;
         var_1621 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_1622.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1386 = new BigInteger();
         var_1386.fromRadix(param1,param2);
         var_1622 = var_1386.modPow(var_968,var_1385);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1623.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         var_968 = new BigInteger();
         var_968.fromRadix(param1,param2);
         var_1623 = var_1621.modPow(var_968,var_1385);
         return true;
      }
   }
}

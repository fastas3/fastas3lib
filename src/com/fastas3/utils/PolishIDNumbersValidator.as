package com.fastas3.utils
{
	/**
	 * @author Adrian Wiecek | fastas3.com
	 * 
	 * Class useful for Polish 
	 * identification numbers validation.
	 */	
	public class PolishIDNumbersValidator
	{
		public function PolishIDNumbersValidator()
		{
		}
		
		/**
		 * Validates polish NIP number.
		 * 
		 * @param number NIP (tax identification number) to validate.
		 * @return True if number is valid, false otherwise.
		 * 
		 */			
		public static function isValidNIP(number:String):Boolean
		{
			var tenDigitPattern:RegExp = getRequiredDigitsRegexp(10);
			
			if(tenDigitPattern.test(number))
			{
				var weights:Vector.<int> = new <int> [6, 5, 7, 2, 3, 4, 5, 6, 7];
				var checkSum:int = getGenericChecksum(number, weights, 11);
				return getLastDigit(number) == checkSum;
			}
			return false;
		}
		
		/**
		 * Validates polish REGON number.
		 * Supports two types: 9-digit and 14-digit REGON.
		 * 
		 * @param number REGON (national business registry number) to validate.
		 * @return True if number is valid, false otherwise.
		 * 
		 */			
		public static function isValidREGON(number:String):Boolean
		{
			var nineDigitPattern:RegExp = getRequiredDigitsRegexp(9);
			var fourteenDigitPattern:RegExp = getRequiredDigitsRegexp(14);
			var weights:Vector.<int>;
			
			if(nineDigitPattern.test(number))
			{
				weights = new <int> [8, 9, 2, 3, 4, 5, 6, 7];
			}
			else if(fourteenDigitPattern.test(number))
			{
				weights = new <int> [2, 4, 8, 5, 0, 9, 7, 3, 6, 1, 2, 4, 8];
			}
			else
			{
				return false;
			}
			
			var checkSum:int = getGenericChecksum(number, weights, 11);
			return getLastDigit(number) == checkSum;
		}
		
		/**
		 * Validates polish PESEL number.
		 * 
		 * @param number PESEL (national identification number) to validate.
		 * @return True if number is valid, false otherwise.
		 * 
		 */				
		public static function isValidPESEL(number:String):Boolean
		{
			var elevenDigitPattern:RegExp = getRequiredDigitsRegexp(11);
			
			if(elevenDigitPattern.test(number))
			{
				var weights:Vector.<int> = new <int> [1, 3, 7, 9, 1, 3, 7, 9, 1, 3];
				var checkSum:int = getGenericChecksum(number, weights, 10);
				checkSum = checkSum == 0 ? 0 : 10 - checkSum;
				return getLastDigit(number) == checkSum;
			}
			return false;
		}
		
		private static function getGenericChecksum(number:String, weights:Vector.<int>, moduloValue:int):int
		{
			var numberArray:Array = number.split("");
			var len:int = weights.length;
			var sum:int = 0;
			
			for(var i:int = 0 ; i < len ; i++)
			{
				sum += int(numberArray[i]) * weights[i];
			}
			
			var checkSum:int = (sum % moduloValue) % 10;
			
			return checkSum;
		}
		
		private static function getLastDigit(number:String):int
		{
			return int(number.charAt(number.length - 1));
		}
		
		private static function getRequiredDigitsRegexp(digits:int):RegExp
		{
			return new RegExp("^\\d{" + digits + "}$");
		}
	}
}
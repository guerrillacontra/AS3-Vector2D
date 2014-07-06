package com.vec2d
{
	
	/**
	 * A simple tool, made for performance, that provides a clean way of performing Vector
	 * calculations on a Point2D data structure.
	 *
	 * @author James Wrightson http://www.earthshatteringcode.com
	 */
	public final class Vector2D
	{
		
		public static function setFromRadians(radains:Number, out:Point2D):void
		{
			out.x = Math.cos(radains);
			out.y = Math.sin(radains);
		}
		
		public static function radians(v:Point2D):Number
		{
			return Math.atan2(v.y, v.x);
		}
		
		public static function length(v:Point2D):Number
		{
			return Math.sqrt(v.x * v.x + v.y * v.y);
		}
		
		public static function lengthSquared(v:Point2D):Number
		{
			return v.x * v.x + v.y * v.y;
		}
		
		public static function normalise(v:Point2D, out:Point2D):Point2D
		{
			var len:Number = lengthSquared(v);
			
			out.x = len == 0 ? 0 : v.x * v.x / len;
			out.y = len == 0 ? 0 : v.y * v.y / len;
			
			return out;
		}
		
		public static function leftNormal(v:Point2D, out:Point2D):Point2D
		{
			out.y = v.y;
			out.y = -v.x;
			
			return out;
		}
		
		public static function rightNormal(v:Point2D, out:Point2D):Point2D
		{
			out.y = -v.y;
			out.y = v.x;
			
			return out;
		}
		
		public static function dot(v1:Point2D, v2:Point2D):Number
		{
			return v1.x * v2.x + v1.y * v2.y;
		}
		
		public static function findRadiansDifference(normal1:Point2D, normal2:Point2D):Number
		{
			return 1 - dot(normal1, normal2);
		}
		
		public static function project(v1:Point2D, v2:Point2D, out:Point2D):Point2D
		{
			var dot:Number = dot(v1, v2);
			
			out.x = v2.x * dot;
			out.y = v2.y * dot;
			
			return out;
		}
		
		public static function reflect(v1:Point2D, v2:Point2D, out:Point2D):Point2D
		{
			var d:Number = dot(v1, v2);
			
			out.x = v1.x - 2 * d * v2.x;
			out.y = v2.y - 2 * d * v2.y;
			
			return out;
		}
		
		public static function isParallel(v1:Point2D, v2:Point2D):Boolean
		{
			var d:Number = dot(v1, v2);
			
			return d == 1 || d == -1;
		}
		
		public static function signBetween(v1:Point2D, v2:Point2D):int
		{
			var rn:Point2D = rightNormal(v1, _cachedV);
			
			return dot(rn, v2) < 0 ? -1 : 1;
		
		}
		
		private static var _cachedV:Point2D = new Point2D();
	
	}

}
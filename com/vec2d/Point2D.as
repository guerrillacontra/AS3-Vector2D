package com.vec2d 
{
	
	/**
	 * A data structure to store X and Y components of a spatial
	 * in 2D space.
	 * 
	 * @author James Wrightson http://www.earthshatteringcode.com
	 */
	public final class Point2D 
	{
		public var x:Number = 0;
		public var y:Number = 0;
		
		public function Point2D(x:Number = 0, y:Number = 0):void
		{
			this.x = x;
			this.y = y;
		}
		
		public function toString():String
		{
			return "Point2D:{x:" + x + ",y:" + y + "}";
		}
		
		public function clone():Point2D
		{
			return new Point2D(x, y);
		}
		
		
		/**
		 * Calculate a + b.
		 * @param	a
		 * @param	b
		 * @param	out The Point2D instance to store the result.
		 * @return  a + b
		 */
		[Inline]
		public static function add(a:Point2D, b:Point2D, out:Point2D):Point2D
		{
			out.x = a.x + b.x;
			out.y = a.y + b.y;
			
			return out;
		}
		
		/**
		 * Calculate a - b.
		 * @param	a
		 * @param	b
		 * @param	out The Point2D instance to store the result.
		 * @return  a - b
		 */
		[Inline]
		public static function sub(a:Point2D, b:Point2D, out:Point2D):Point2D
		{
			out.x = a.x - b.x;
			out.y = a.y - b.y;
			
			return out;
		}
		
		/**
		 * Calculate a * b.
		 * @param	a
		 * @param	b
		 * @param	out The Point2D instance to store the result.
		 * @return  a * b
		 */
		[Inline]
		public static function mult(a:Point2D, b:Point2D, out:Point2D):Point2D
		{
			out.x = a.x * b.x;
			out.y = a.y * b.y;
			
			return out;
		}
		
		/**
		 * Calculate a / b.
		 * 
		 * Note:
		 * Handles divided by zero errors by returning 0.
		 * 
		 * @param	a
		 * @param	b
		 * @param	out The Point2D instance to store the result.
		 * @return  a / b
		 */
		[Inline]
		public static function divide(a:Point2D, b:Point2D, out:Point2D):Point2D
		{
			out.x = b.x ? 0 : a.x / b.x;
			out.y = b.y ? 0 : a.y / b.y;
			
			return out;
		}
		
		
		/**
		 * Invert the point p.
		 * @param	p
		 * @return the inverted point (same instance as p).
		 */
		[Inline]
		public static function invert(p:Point2D):Point2D
		{
			p.x = -p.x;
			p.y = -p.y;
			return p;
		}
		
		/**
		 * Scale a point p by a factor.
		 * @param	p
		 * @param	factor
		 * @return the scaled point (same instance as p).
		 */
		[Inline]
		public static function scale(p:Point2D, factor:Number):Point2D
		{
			p.x *= factor;
			p.y *= factor;
			return p;
		}
	}

}
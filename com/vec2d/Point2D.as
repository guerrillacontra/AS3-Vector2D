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
		 * Resolves a + b.
		 * @param	a
		 * @param	b
		 * @param	out A Point2D where the result of a + b will be stored.
		 */
		[Inline]
		public static function add(a:Point2D, b:Point2D, out:Point2D):Point2D
		{
			out.x = a.x + b.x;
			out.y = a.y + b.y;
			
			return out;
		}
		
		/**
		 * Resolves a - b;
		 * @param	a
		 * @param	b
		 * @param	out A Point2D where the result of a - b will be stored.
		 */
		[Inline]
		public static function sub(a:Point2D, b:Point2D, out:Point2D):Point2D
		{
			out.x = a.x - b.x;
			out.y = a.y - b.y;
			
			return out;
		}
		
		/**
		 * Resolves a * b;
		 * @param	a
		 * @param	b
		 * @param	out A Point2D where the result of a * b will be stored.
		 */
		[Inline]
		public static function mult(a:Point2D, b:Point2D, out:Point2D):Point2D
		{
			out.x = a.x * b.x;
			out.y = a.y * b.y;
			
			return out;
		}
		
		/**
		 * Resolves a / b.
		 * Handles divide by zero errors.
		 * @param	a
		 * @param	b
		 * @param	out A Point2D where the result of a /b will be stored.
		 */
		[Inline]
		public static function divide(a:Point2D, b:Point2D, out:Point2D):Point2D
		{
			out.x = b.x ? 0 : a.x / b.x;
			out.y = b.y ? 0 : a.y / b.y;
			
			return out;
		}
		
		
		/**
		 * Inverts the point p.
		 * @param	p
		 */
		[Inline]
		public static function invert(p:Point2D):void
		{
			p.x = -p.x;
			p.y = -p.y;
		}
		
		/**
		 * Scales the point p by a factor.
		 * 
		 * Ie: 
		 * p = {x:1, y:2}
		 * scale(p, 2)
		 * p.x == 2
		 * p.y == 4
		 * @param	p
		 * @param	factor
		 */
		[Inline]
		public static function scale(p:Point2D, factor:Number):void
		{
			p.x *= factor;
			p.y *= factor;
		}
	}

}
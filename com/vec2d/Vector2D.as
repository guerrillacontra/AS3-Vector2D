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
		
		/**
		 * Create a normalised vector based on provided radians.
		 * @param	radains
		 * @param	out The Point2D instance to store the result.
		 * @return A normalised vector point based on the radians.
		 */
		[Inline]
		public static function radiansToVector(radains:Number, out:Point2D):Point2D
		{
			out.x = Math.cos(radains);
			out.y = Math.sin(radains);
			return out;
		}
		
		/**
		 * Create the radians from a vector.
		 * @param	v
		 * @return The radians.
		 */
		[Inline]
		public static function vectorToRadians(v:Point2D):Number
		{
			return Math.atan2(v.y, v.x);
		}
		
		/**
		 * Find the length (also known as the magnitude) of a vector.
		 * @param	v
		 * @return The length
		 */
		[Inline]
		public static function findLength(v:Point2D):Number
		{
			return Math.sqrt(v.x * v.x + v.y * v.y);
		}
		
		/**
		 * Find the length^2 (also known as the magnitude^2) of a vector.
		 * @param	v
		 * @return the length squared
		 */
		[Inline]
		public static function findLengthSquared(v:Point2D):Number
		{
			return v.x * v.x + v.y * v.y;
		}
		
		/**
		 * Normalise a vector so that it becomes a unit vector.
		 * @param	v
		 * @param	out The Point2D instance to store the result
		 * @return A unit vector
		 */
		[Inline]
		public static function normalise(v:Point2D, out:Point2D):Point2D
		{
			var len:Number = findLength(v);
			
			out.x = len == 0 ? 0 : v.x / len;
			out.y = len == 0 ? 0 : v.y  / len;
			
			return out;
		}
		
		/**
		 * Create a vector facing left of the vector v.
		 * @param	v
		 * @param	out The Point2D instance to store the result
		 * @return a vector facing left of the vector v.
		 */
		[Inline]
		public static function createLeftVector(v:Point2D, out:Point2D):Point2D
		{
			out.y = v.y;
			out.y = -v.x;
			
			return out;
		}
		
		/**
		 * Create a vector facing right of the vector v.
		 * @param	v
		 * @param	out The Point2D instance to store the result
		 * @return a vector facing right of the vector v.
		 */
		[Inline]
		public static function createRightVector(v:Point2D, out:Point2D):Point2D
		{
			out.y = -v.y;
			out.y = v.x;
			
			return out;
		}
		
		/**
		 * Find the dot product of two vectors.
		 * @param	v1
		 * @param	v2
		 * @return v1 . v2
		 */
		[Inline]
		public static function dot(v1:Point2D, v2:Point2D):Number
		{
			return v1.x * v2.x + v1.y * v2.y;
		}
		
		/**
		 * Find the radians between two vectors.
		 * 
		 * @param	normal1 A normalised vector
		 * @param	normal2  A normalised vector
		 * @return The delta radians
		 */
		[Inline]
		public static function findRadiansBetween(normal1:Point2D, normal2:Point2D):Number
		{
			return 1 - dot(normal1, normal2);
		}
		
		/**
		 * Project the vector v1 onto a normal plane and return
		 * a new vector representing the projection.
		 * 
		 * @param	v1 A vector (can be unit or non unit)
		 * @param	normal A unit vector representing a plane to be projected onto
		 * @param	out The Point2D instance to store the result
		 * @return The projection of v1 onto the normal
		 */
		[Inline]
		public static function project(v1:Point2D, normal:Point2D, out:Point2D):Point2D
		{
			var d:Number = dot(v1, normal);
			
			out.x = normal.x * d;
			out.y = normal.y * d;
			
			return out;
		}
		
		/**
		 * Create a vector representing the reflection of v1 onto the normal plane.
		 * @param	v1 A vector (can be unit and non-unit)
		 * @param	normal A unit vector representing the plane of relfection
		 * @param	out The Point2D instance to store the result
		 * @return A vector representing the reflection of v1 onto the normal plane
		 */
		[Inline]
		public static function reflect(v1:Point2D, normal:Point2D, out:Point2D):Point2D
		{
			var d:Number = dot(v1, normal);
			
			out.x = v1.x - 2 * d * normal.x;
			out.y = normal.y - 2 * d * normal.y;
			
			return out;
		}
		
		/**
		 * Find out if two vectors are parallel.
		 * @param	v1
		 * @param	v2
		 * @return True if the vectors are parallel to each other
		 */
		[Inline]
		public static function isParallel(v1:Point2D, v2:Point2D):Boolean
		{
			var dSquared:Number = Math.pow(dot(v1, v2), 2);
			
			var l1Squared:Number = findLengthSquared(v1);
			var l2Squared:Number = findLengthSquared(v2);
			
			if (l1Squared == 0 && l2Squared == 0) return true;
			
			var ratio:Number = dSquared / (l1Squared* l1Squared);
			
			const EPSILON:Number = 0.000000001;

			return ratio > 1 - EPSILON;
		}
		
		/**
		 * Find out if two vectors are othogonal.
		 * @param	v1
		 * @param	v2
		 * @return True if the vectors are othogonal to each other
		 */
		[Inline]
		public static function isOthogonal(v1:Point2D, v2:Point2D):Boolean
		{
			var dSquared:Number = Math.pow(dot(v1, v2), 2);
			
			var l1Squared:Number = findLengthSquared(v1);
			var l2Squared:Number = findLengthSquared(v2);
			
			if (l1Squared == 0 && l2Squared == 0) return true;
			
			var ratio:Number = dSquared / (l1Squared* l1Squared);
			
			const EPSILON:Number = 0.000000001;

			return ratio <= EPSILON;
		}
		
		/**
		 * Find the sign between two vectors based on where they are facing.
		 * 
		 * @param	v1
		 * @param	v2
		 * @return The sign between v1 and v2.
		 * Could be:
			 * 0
			 * -1
			 * 1
		*   Depending on the angle.
		 */
		[Inline]
		public static function signBetween(v1:Point2D, v2:Point2D):int
		{
			var rn:Point2D = createRightVector(v1, _cachedV);
			var d:Number = dot(rn, v2);
			
			return d == 0 ? 0 : d < 0 ? -1 : 1;
		
		}
		
		private static var _cachedV:Point2D = new Point2D();
	
	}

}
AS3-Vector2D
============

A fast simple Vector2D tool for AS3 projects that supports inlining.

Unlike other Vector tools in AS3, this one seperates the data that stores the x,y
values from the vector operations.

This allows for faster operations with more practical use and less bloat while still
being easy to use.

The design also allows developers to pool and cache instances in the way they like too,
which can be hard to achieve in other implementations around.


How to use
==========

A general work flow would be to:

a - Create Point2D instances to store the x & y components
b - Use the Vector2D tool too perform operations on the Point2D instances

Example
=======

A scenario where you want the player to move towards an enemy at a fixed speed
until the player touches the enemy...

#1 Without caching (the normal way unless you want to pool/cache points)
========================================================================

			//Mock objects representing the player and enemy data...
			var p:Object = { x:100, y:200, vx:0, vy:0, speed:60, radius:32 };
			var e:Object = { x:200, y:200, vx:0, vy:0, radius:32 };
			
			var playerPos:Point2D = new Point2D(p.x, p.y);
			var enemyPos:Point2D = new Point2D(e.x, e.y);
			
			var delta:Point2D = Point2D.sub(enemyPos, playerPos, new Point2D());
			
			var distance:Number = Vector2D.findLength(delta);
			
			if (distance > p.radius + e.radius)
			{
				var impluse:Point2D = Point2D.scale(Vector2D.normalise(delta, new Point2D()), p.speed);
				p.vx = impluse.x;
				p.vy = impluse.y;
			}
			
#2 With caching
===============

			//Mock objects representing the player and enemy data...
			var p:Object = { x:100, y:200, vx:0, vy:0, speed:60, radius:32 };
			var e:Object = { x:200, y:200, vx:0, vy:0, radius:32 };
			
			
			var cachedPoint:Point2D = new Point2D();
				
			var playerPos:Point2D = new Point2D(p.x, p.y);
			var enemyPos:Point2D = new Point2D(e.x, e.y);
			
			var delta:Point2D = Point2D.sub(enemyPos, playerPos, cachedPoint);
			
			var distance:Number = Vector2D.findLength(delta);
			
			if (distance > p.radius + e.radius)
			{
				var impluse:Point2D = Point2D.scale(Vector2D.normalise(delta, cachedPoint), p.speed);
				p.vx = impluse.x;
				p.vy = impluse.y;
			}
			
This version saves 50% of Point2D instantiation by using and writing/reading to a cached point.

The Vector2D and Point2D objects are made to be fast and cache/pool friendly :)




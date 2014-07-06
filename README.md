# AS3-Vector2D


A lean Vector2D tool for AS3 projects that supports inlining.

The following operations can be applied (and more):
* to/from radians
* normalising
* projection
* length/magnitude
* left/right vectors
* dot/scalar
* reflection
* parallel testing
* orthogonal testing
* sign between two vectors


## Design Choices
To make AS3-Vector2D fast and efficient, the vector operations are applied as static
inline'd functions against a Point2D data structure.

This will allow you to use Point2D very efficiently while keeping the vector operations
clean and simple.

You will notice some of the operations have an "out" function argument...

> function project(v1:Point2D, normal:Point2D, **out:Point2D**)

...This is because AS3-Vector2D is cache friendly and allows developers to re-use
Point2D instances to speed up performance as shown in the examples below!


## How to use

A general work flow would be to:

1. Create Point2D instances to store the x and y components
2. Use the Vector2D tool to perform operations on the Point2D instances

## Scenario

A scenario where you want the player to move towards an enemy at a fixed speed
until the player touches the enemy...

The output from both examples will be:

>Point2D:{x:100, y:200}

>Point2D:{x:150, y:200}

>Point2D:{x:200, y:200}

### Example 1 - without caching


			//Mock objects representing the player and enemy data...
			var p:Object = {x: 100, y: 200, vx: 0, vy: 0, speed: 50, radius: 10};
			var e:Object = {x: 200, y: 200, vx: 0, vy: 0, radius: 10};
			
			var playerPos:Point2D = new Point2D(p.x, p.y);
			var enemyPos:Point2D = new Point2D(e.x, e.y);
			
			var distance:Number = Number.MAX_VALUE;
			
			
			while (true)
			{
				trace(playerPos); 
				
				var delta:Point2D = Point2D.sub(enemyPos, playerPos, new Point2D());
				
				distance = Vector2D.findLength(delta);
				
				if (distance > p.radius + e.radius)
				{
					var impluse:Point2D = Point2D.scale(Vector2D.normalise(delta, new Point2D()), p.speed);
					playerPos.x += impluse.x;
					playerPos.y += impluse.y;
					
				}else
				{
					break;
				}
			}
			
			p.x = playerPos.x;
			p.y = playerPos.y;
			
### Example 2 - with caching


			//Mock objects representing the player and enemy data...
			var p:Object = {x: 100, y: 200, vx: 0, vy: 0, speed: 50, radius: 10};
			var e:Object = {x: 200, y: 200, vx: 0, vy: 0, radius: 10};
			
			var playerPos:Point2D = new Point2D(p.x, p.y);
			var enemyPos:Point2D = new Point2D(e.x, e.y);
			
			var distance:Number = Number.MAX_VALUE;
			var cache:Point2D = new Point2D();
			
			
			while (true)
			{
				trace(playerPos);
				
				var delta:Point2D = Point2D.sub(enemyPos, playerPos, cache);
				
				distance = Vector2D.findLength(delta);
				
				if (distance > p.radius + e.radius)
				{
					var impluse:Point2D = Point2D.scale(Vector2D.normalise(delta, cache), p.speed);
					playerPos.x += impluse.x;
					playerPos.y += impluse.y;
					
				}else
				{
					break;
				}
			}
			
			p.x = playerPos.x;
			p.y = playerPos.y;
			
This version saves many creations of Point2D instantiation by using and writing/reading to a cached point.

The Vector2D and Point2D objects are made to be fast and cache/pool friendly :)




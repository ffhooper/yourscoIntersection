# yourscoIntersection #
Coding challenge.

## Riley Hoopers Traffic Intersection ##
Run app in simulator to see the intersection in action. Intersection follows a 33 second cycle.

Cycle steps are as follows:
* Northbound
  * Left turn for 4 seconds
  * Left turn yellow 3 seconds
  * Straight for 6 seconds
  * Straight yellow 3 seconds
* Eastbound
  * Left turn for 4 seconds
  * Left turn yellow 3 seconds
  * Straight for 6 seconds
  * Straight yellow 3 seconds
  
In the first cycle there will be a bad pattern, a southbound straight crossing a northbound left turn. In this case all signals should go orange and after 3 seconds restart the cycle from the beginning. After this first time it won't happen again.


On the screen there is northbound traffic heading straight. A new car will arrive every 6 seconds of the cycle. These cars will travel through a green light at the speed of one car per second.
  
  

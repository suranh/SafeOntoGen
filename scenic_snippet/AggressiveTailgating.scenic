behavior AggressiveTailgating(speed, safety_dist):
    try:
        do FollowLaneBehavior(target_speed=speed, laneToFollow=ego.lane)
    interrupt when (distance to ego) < safety_dist:
        take SetThrottleAction(1.0)
        take SetBrakeAction(0.0)
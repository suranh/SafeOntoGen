behavior RearEndThenBrake(speed, safety_dist, post_collision_wait):
    try:
        do FollowLaneBehavior(target_speed=speed, laneToFollow=ego.lane)
    interrupt when (distance to ego) < safety_dist:
        take SetThrottleAction(1.0)
        take SetBrakeAction(0.0)
    for _ in range(int(post_collision_wait / 0.1)):
        wait
    take SetThrottleAction(0.0)
    take SetBrakeAction(1.0)
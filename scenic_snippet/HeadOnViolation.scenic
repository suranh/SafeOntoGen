behavior HeadOnViolation(speed):
    try:
        do FollowLaneBehavior(target_speed=speed, is_oppositeTraffic=True)
    interrupt when (distance to ego) < 20:
        take SetThrottleAction(1.0)
        take SetBrakeAction(0.0)
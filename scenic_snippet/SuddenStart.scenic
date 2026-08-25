behavior SuddenStart(speed, trigger_dist):
    try:
        take SetBrakeAction(1.0)
        take SetThrottleAction(0.0)
    interrupt when (distance to ego) < trigger_dist:
        take SetBrakeAction(0.0)
        take SetThrottleAction(1.0)
        take SetSteeringAction(-0.3)
        do LaneChangeBehavior(laneSectionToSwitch=ego.laneSection, is_oppositeTraffic=False, target_speed=speed)
        try:
            do FollowLaneBehavior(target_speed=speed)
        interrupt when (distance to ego) < 3:
            take SetThrottleAction(1.0)
            take SetBrakeAction(0.0)
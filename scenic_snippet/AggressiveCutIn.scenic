behavior AggressiveCutIn(speed, lane_offset):
    do FollowLaneBehavior(target_speed=speed) for 3 seconds
    do LaneChangeBehavior(laneSectionToSwitch=ego.laneSection, is_oppositeTraffic=False, target_speed=speed)
    try:
        do FollowLaneBehavior(target_speed=speed)
    interrupt when (distance to ego) < 3:
        take SetThrottleAction(0.0)
        take SetBrakeAction(1.0)
behavior IntersectionViolation(speed):
    try:
        do FollowLaneBehavior(target_speed=speed)
    interrupt when withinDistanceToIntersection(self, 15):
        do LaneChangeBehavior(laneSectionToSwitch=ego.laneSection, is_oppositeTraffic=True, target_speed=speed)
        try:
            do FollowLaneBehavior(target_speed=speed, is_oppositeTraffic=True)
        interrupt when (distance to ego) < 3:
            take SetThrottleAction(1.0)
            take SetBrakeAction(0.0)
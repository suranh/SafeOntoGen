behavior SwerveBackIn(speed):
    outLane = self.laneSection.laneToLeft if self.laneSection.laneToLeft else self.laneSection.laneToRight
    do LaneChangeBehavior(laneSectionToSwitch=outLane, is_oppositeTraffic=False, target_speed=speed)
    do FollowLaneBehavior(target_speed=speed) for 2 seconds
    do LaneChangeBehavior(laneSectionToSwitch=ego.laneSection, is_oppositeTraffic=False, target_speed=speed)
    try:
        do FollowLaneBehavior(target_speed=speed)
    interrupt when (distance to ego) < 3:
        take SetThrottleAction(0.0)
        take SetBrakeAction(1.0)
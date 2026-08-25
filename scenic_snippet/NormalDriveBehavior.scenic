behavior NormalDriveBehavior(speed, safety_distance):
    try:
        do FollowLaneBehavior(target_speed=speed)
    interrupt when withinDistanceToAnyObjs(self, safety_distance):
        # Defensive Driving: Brake if threat detected
        take SetBrakeAction(0.5)

behavior EgoRun():
    do NormalDriveBehavior(globalParameters.EGO_SPEED, globalParameters.SAFETY_DISTANCE)
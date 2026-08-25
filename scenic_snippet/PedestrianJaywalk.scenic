behavior PedestrianJaywalk(speed):
    take SetWalkingDirectionAction(self.heading - 90 deg)
    take SetWalkingSpeedAction(speed)
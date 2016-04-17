def ways_up_stairs(number_of_stairs):
    if number_of_stairs == 0:
        return 1
    if number_of_stairs < 0:
        return 0
    return ways_up_stairs(number_of_stairs-1) + ways_up_stairs(number_of_stairs-2) + ways_up_stairs(number_of_stairs-3)

ways_up = {}
def ways_up_stairs_dyn(number_of_stairs, ways_up):
    if number_of_stairs in ways_up: 
        return ways_up[number_of_stairs]
    if number_of_stairs == 0:
        return 1
    if number_of_stairs < 0:
        return 0
    else:
        ways_up[number_of_stairs] =  ways_up_stairs_dyn(number_of_stairs-1, ways_up) + ways_up_stairs_dyn(number_of_stairs-2, ways_up) + ways_up_stairs_dyn(number_of_stairs-3, ways_up)
        return ways_up[number_of_stairs]


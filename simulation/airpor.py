import simpy
import random
import statistics
from numpy import random
wait_times = []
class Airport(object):
    def __init__(self, env, num_securities, num_servers):
        self.env = env
        self.security = simpy.Resource(env, num_securities)
        self.server = simpy.Resource(env, num_servers)
        
    def check_in(self, passenger):
        yield self.env.timeout(random.poisson())
    def check_ticket(self, passenger):
        yield self.env.timeout(random.poisson()) 
def go_to_airport(env, passenger, airport):
    # Passenger arrives at the airport
    arrival_time = env.now
    with airport.security.request() as request:
        yield request
        yield env.process(airport.check_in(passenger))  
    if random.choice([True, False]):
        with airport.server.request() as request:
            yield request
    # passenger go to the airport
    wait_times.append(env.now - arrival_time)
def run_airport(env, num_securities, num_servers):
    airport = Airport(env, num_securities, num_servers)
    for passenger in range(3):
        env.process(go_to_airport(env, passenger, airport))
    while True:
        yield env.timeout(0.20)  # Wait before generating a new person, using mean interarival rate
        passenger += 1
        env.process(go_to_airport(env, passenger, airport))
def get_average_wait_time(wait_times):
    average_wait = statistics.mean(wait_times)
    # Print the results
    minutes, frac_minutes = divmod(average_wait, 1)
    seconds = frac_minutes * 60
    return round(minutes), round(seconds)
def get_user_input():
    num_securities = input("Input # of security personnel working: ")
    num_servers = input("Input # of servers working: ")   
    params = [num_securities, num_servers]
    if all(str(i).isdigit() for i in params):  # Validate the input
        params = [int(x) for x in params]
    else:
        print(
            "Could not read input.",
        )
        params = [1, 1, 1]
    return params
def main():   
    random.seed(42)
    num_securities, num_servers = get_user_input()   
    env = simpy.Environment()
    env.process(run_airport(env, num_securities, num_servers))
    env.run(until=5)    
    mins, secs = get_average_wait_time(wait_times)
    print(
        "Running simulation...",
        f"\nThe average wait time is {mins} minutes and {secs} seconds.",
    )
if __name__ == "__main__":
    main()
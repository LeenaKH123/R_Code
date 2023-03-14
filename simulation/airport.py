import simpy
import random
import statistics
from numpy import random
wait_times = []
class Airport(object):
    def __init__(self, env, num_cashiers, num_servers):
        self.env = env
        self.cashier = simpy.Resource(env, num_cashiers)
        self.server = simpy.Resource(env, num_servers)
        

    def purchase_ticket(self, moviegoer):
        yield self.env.timeout(random.poisson())

    def check_ticket(self, moviegoer):
        yield self.env.timeout(random.poisson())

 
def go_to_movies(env, moviegoer, airport):
    # Passenger arrives at the airport
    arrival_time = env.now

    with airport.cashier.request() as request:
        yield request
        yield env.process(airport.purchase_ticket(moviegoer))

  
    if random.choice([True, False]):
        with airport.server.request() as request:
            yield request
           

    # Moviegoer heads into the airport
    wait_times.append(env.now - arrival_time)


def run_airport(env, num_cashiers, num_servers):
    airport = Airport(env, num_cashiers, num_servers)

    for moviegoer in range(3):
        env.process(go_to_movies(env, moviegoer, airport))

    while True:
        yield env.timeout(0.20)  # Wait a bit before generating a new person

        moviegoer += 1
        env.process(go_to_movies(env, moviegoer, airport))


def get_average_wait_time(wait_times):
    average_wait = statistics.mean(wait_times)
    # Pretty print the results
    minutes, frac_minutes = divmod(average_wait, 1)
    seconds = frac_minutes * 60
    return round(minutes), round(seconds)


def get_user_input():
    num_cashiers = input("Input # of cashiers working: ")
    num_servers = input("Input # of servers working: ")   
    params = [num_cashiers, num_servers]
    if all(str(i).isdigit() for i in params):  # Check input is valid
        params = [int(x) for x in params]
    else:
        print(
            "Could not parse input. Simulation will use default values:",
            "\n1 cashier, 1 server, 1 usher.",
        )
        params = [1, 1, 1]
    return params


def main():
    # Setup
    random.seed(42)
    num_cashiers, num_servers = get_user_input()

    # Run the simulation
    env = simpy.Environment()
    env.process(run_airport(env, num_cashiers, num_servers))
    env.run(until=5)

    # View the results
    mins, secs = get_average_wait_time(wait_times)
    print(
        "Running simulation...",
        f"\nThe average wait time is {mins} minutes and {secs} seconds.",
    )


if __name__ == "__main__":
    main()
# Import PuLP modeler functions
from pulp import *
import pandas as pd
# crimeDate = read.table("/home/lilo/rcode/uscrime/uscrime.txt", header= TRUE, stringsAsFactors = F)
data = pd.read_csv("/home/lilo/rcode/optimization/diet.csv")
# print(data.head())
data_c = data[0:66]
# print(data_c)
data_c = data_c.values.tolist()
print(data_c)


# Create the 'prob' variable to contain the problem data
prob = LpProblem("ThedietProblem", LpMinimize)

# The variables are created 
foods = [x[0] for x in data_c]
calories = dict([(x[0], float(x[3])) for x in data_c])
cholesterol = dict([(x[0], float(x[4])) for x in data_c])
totalFat = dict([(x[0], float(x[5])) for x in data_c])
sodium = dict([(x[0], float(x[6])) for x in data_c])
carbs = dict([(x[0], float(x[7])) for x in data_c])
fiber = dict([(x[0], float(x[8])) for x in data])
protien = dict([(x[0], float(x[9])) for x in data])
vitaminA = dict([(x[0], float(x[10])) for x in data])
vitaminC = dict([(x[0], float(x[11])) for x in data])
calcium = dict([(x[0], float(x[12])) for x in data])
iron = dict([(x[0], float(x[13])) for x in data])

# # The objective function is added to 'prob' first
problem99 += lpSum([cost[f] * foodVars[f] for f in foods])

# # The constraints are entered
for f in foods:
    problem99 += foodVars[f] <= 10000 * vars[f]
    problem99 += foodVars[f] >= .1 * vars[f]


# # The problem data is written to an .lp file
prob.writeLP("diet.lp")

# # The problem is solved using PuLP's choice of Solver
prob.solve()

# # The status of the solution is printed to the screen
print("Status:", LpStatus[prob.status])

# # Each of the variables is printed with it's resolved optimum value
for v in prob.variables():
     print(v.name, "=", v.varValue)

# # The optimised objective function value is printed to the screen
print("Total Cost of Ingredients per can = ", value(prob.objective))

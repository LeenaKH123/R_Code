# install.packages("FrF2")
library(FrF2)
set.seed(40)
# 16 houses and 10 features
houses_algo <- FrF2(16, 10, factor.names = c(
    'Large Yard', 'Pool', 'Solar Roof', 'Long Driveway', 'Multi Car Garage',
    'Walk-In Closet', 'Man Cave', 'Full Bar', 'Gazebo', 'Elevator'
    ), default.levels = c("1", "-1"))
print(houses_algo)
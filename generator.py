import random, math

def generator(
    name="problem-n",
    cities = 2,
    
    smallAirplanes = 1,
    mediumAirplanes = 0,
    largeAirplanes = 0,
    
    trains = 1,
    railwayFactor = 0.5,

    smallTrucksPerCity = 1,
    mediumTrucksPerCity = 0,
    largeTrucksPerCity = 0,
    
    officesPerCity=1,
    
    smallPackages=10,
    mediumPackages=5,
    largePackages=10,

    goalFactor = 0.5
  ):

  # ==================
  # Check input values 
  # ==================

  if goalFactor < 0:
    raise InputError("Factor must be larger or equal than zero")
  elif goalFactor > 1:
    raise InputError("Factor must be less or equal than one")

  # ================
  # Generate objects
  # ================

  Cities = []
  Trainstations = []
  Airports = []
  Trucks = { "small": [], "medium": [], "large": [] }
  Offices = []
  Airplanes = { "small": [], "medium": [], "large": [] }
  Trains = []
  Railways = {}
  Packages = { "small": [], "medium": [], "large": [] }


  # Cities
  for i in xrange(0,cities):
    Cities.append("city-{}".format(i))
    Trainstations.append("trainstation-{}".format(i))
    Airports.append("airport-{}".format(i))
    
    # Trcuks
    a = []
    for j in xrange(0,smallTrucksPerCity):
      a.append("small-truck-{}-{}".format(i,j))
    Trucks['small'].append(a)

    a = []
    for j in xrange(0,mediumTrucksPerCity):
      a.append("medium-truck-{}-{}".format(i,j))
    Trucks['medium'].append(a)

    a = []
    for j in xrange(0,largeTrucksPerCity):
      a.append("large-truck-{}-{}".format(i,j))
    Trucks['large'].append(a)
    
    # Offices
    a = []
    for j in xrange(0,officesPerCity):
      a.append("office-{}-{}".format(i,j))
    Offices.append(a)
  
  # Airplanes
  for i in xrange(0,smallAirplanes):
    Airplanes["small"].append("small-airplane-{}".format(i))

  for i in xrange(0,mediumAirplanes):
    Airplanes["medium"].append("medium-airplane-{}".format(i))

  for i in xrange(0,largeAirplanes):
    Airplanes["large"].append("large-airplane-{}".format(i))

  # Trains
  for i in xrange(0,trains):
    Trains.append("train-{}".format(i))

  # Packages
  for i in xrange(0,smallPackages):
    Packages["small"].append("small-package-{}".format(i))
  
  for i in xrange(0,mediumPackages):
    Packages["medium"].append("medium-package-{}".format(i))

  for i in xrange(0,largePackages):
    Packages["large"].append("large-package-{}".format(i))

  # Railways
  size = int(math.ceil(cities*railwayFactor))
  for i in xrange(0,size):
    for j in xrange(0,size):
      Railways["Railway-{}-{}".format(i,size-j)] = [i,size-j]

  output  = "(define (problem {})\n".format(name)
  output += "  (:domain logistics)\n"
  output += "  (:objects\n"
  output += "    "
  
  # =======================
  # Creates all the objects
  # =======================
  
  row = 1
  newRow = 5

  # Cities
  for i in xrange(0,cities):
    output += "{} ".format(Cities[i])
    
    row = row + 1
    if row%newRow == 0:
      output += "\n    "

    # Trucks
    for j in xrange(0,smallTrucksPerCity):
      output += "{} ".format(Trucks["small"][i][j])

      row = row + 1
      if row%newRow == 0:
        output += "\n    "
    for j in xrange(0,mediumTrucksPerCity):
      output += "{} ".format(Trucks["medium"][i][j])

      row = row + 1
      if row%newRow == 0:
        output += "\n    "
    for j in xrange(0,largeTrucksPerCity):
      output += "{} ".format(Trucks["large"][i][j])

      row = row + 1
      if row%newRow == 0:
        output += "\n    "
    
    # Offices
    for j in xrange(0,officesPerCity):
      output += "{} ".format(Offices[i][j])
  
      row = row + 1
      if row%newRow == 0:
        output += "\n    "
  
  # Airplanes
  for i in xrange(0,smallAirplanes):
    output += "{} ".format(Airplanes["small"][i])

    row = row + 1
    if row%newRow == 0:
      output += "\n    "
  for i in xrange(0,mediumAirplanes):
    output += "{} ".format(Airplanes["medium"][i])

    row = row + 1
    if row%newRow == 0:
      output += "\n    "
  for i in xrange(0,largeAirplanes):
    output += "{} ".format(Airplanes["large"][i])

    row = row + 1
    if row%newRow == 0:
      output += "\n    "
  
  # Trains
  for i in xrange(0,trains):
    output += "{} ".format(Trains[i])

    row = row + 1
    if row%newRow == 0:
      output += "\n    "
  
  # Airports
  for i in xrange(0,cities):
    output += "{} ".format(Airports[i])
    row = row + 1
    if row%newRow == 0:
      output += "\n    "

  # Train stations
  for i in xrange(0,cities):
    output += "{} ".format(Trainstations[i])
    row = row + 1
    if row%newRow == 0:
      output += "\n    "

  # Packages
  for i in xrange(0,smallPackages):
    output += "{} ".format(Packages["small"][i])
    row = row + 1
    if row%newRow == 0:
      output += "\n    "
  
  for i in xrange(0,mediumPackages):
    output += "{} ".format(Packages["medium"][i])
    row = row + 1
    if row%newRow == 0:
      output += "\n    "
  
  for i in xrange(0,largePackages):
    if i == largePackages:
      output += "{}".format(Packages["large"][i])
    else:
      output += "{} ".format(Packages["large"][i])
      row = row + 1
      if row%newRow == 0:
        output += "\n    "

  

  output += "\n"
  output += "  )\n"

  output += "  (:init\n"

  # ======================
  # Initialize all objects
  # ======================

  row = 0
  
  # Cities
  for i in xrange(0,cities):
    output += "    (city {}) ".format(Cities[i])
    output += "\n"
    # Trucks
    for j in xrange(0,smallTrucksPerCity):
      output += "      (truck {0}) (small-vehicle {0}) (at {0} {1})\n".format(Trucks["small"][i][j], Offices[i][random.randint(0,len(Offices[i])-1)])
    for j in xrange(0,mediumTrucksPerCity):
      output += "      (truck {0}) (medium-vehicle {0}) (at {0} {1})\n".format(Trucks["medium"][i][j], Offices[i][random.randint(0,len(Offices[i])-1)])
    for j in xrange(0,largeTrucksPerCity):
      output += "      (truck {0}) (large-vehicle {0}) (at {0} {1})\n".format(Trucks["large"][i][j], Offices[i][random.randint(0,len(Offices[i])-1)])
    # Offices
    for j in xrange(0,officesPerCity):
      output += "      (location {0}) (loc {0} {1})\n".format(Offices[i][j],Cities[i])
    output += "\n"
    row = 0

  # Airports
  for i in xrange(0,cities):
    output += "      (airport {0}) (location {0}) (loc {0} {1})\n".format(Airports[i],Cities[i])

  # Airports
  for i in xrange(0,cities):
    output += "      (trainstation {0}) (location {0}) (loc {0} {1})\n".format(Trainstations[i],Cities[i])

  # Airplanes
  for i in xrange(0,smallAirplanes):
    output += "    (airplane {0}) (small-vehicle {0}) (at {0} {1})\n".format(Airplanes["small"][i],random.choice(Airports))
  if smallAirplanes != 0:
    output += "\n"  

  for i in xrange(0,mediumAirplanes):
    output += "    (airplane {0}) (medium-vehicle {0}) (at {0} {1})\n".format(Airplanes["medium"][i],random.choice(Airports))
  if mediumAirplanes != 0:
    output += "\n"  

  for i in xrange(0,largeAirplanes):
    output += "    (airplane {0}) (large-vehicle {0}) (at {0} {1})\n".format(Airplanes["large"][i],random.choice(Airports))
  if largeAirplanes != 0:
    output += "\n"  

  # Trains
  for i in xrange(0,trains):
    output += "    (train {0}) (large-vehicle {0}) (at {0} trainstation-{1})\n".format(Trains[i],i)
  if trains != 0:
    output += "\n"

  # Railways
  for key in Railways:
    output += "    (railway {0} {1}) (railway {0} {1})\n".format(Trainstations[Railways[key][0]],Trainstations[Railways[key][1]])
  if len(Railways) != 0:
    output += "\n"

  # Packages
  for i in xrange(0,smallPackages):
    output += "    (small-object {0}) (at {0} {1})\n".format(Packages["small"][i],random.choice(random.choice(Offices)))
  if smallPackages != 0:
    output += "\n"  

  for i in xrange(0,mediumPackages):
    output += "    (medium-object {0}) (at {0} {1})\n".format(Packages["medium"][i],random.choice(random.choice(Offices)))
  if mediumPackages != 0:  
    output += "\n"
  
  for i in xrange(0,largePackages):
    output += "    (large-object {0}) (at {0} {1})\n".format(Packages["large"][i],random.choice(random.choice(Offices)))
  if largePackages != 0:
    output += "\n"

  output += "  )\n"

  # ===========
  # Create goal
  # ===========

  output += "  (:goal\n"
  output += "    (and\n"

  shuffledSmallPackages = random.sample(Packages["small"],int(math.ceil(smallPackages*goalFactor)))

  for i in xrange(0,len(shuffledSmallPackages)):
    output += "      (at {} {})\n".format(shuffledSmallPackages[i],random.choice(random.choice(Offices)))
    
  shuffledMediumPackages = random.sample(Packages["medium"],int(math.ceil(mediumPackages*goalFactor)))
  for i in xrange(0,len(shuffledMediumPackages)):
    output += "      (at {} {})\n".format(shuffledMediumPackages[i],random.choice(random.choice(Offices)))

  shuffledLargePackages = random.sample(Packages["large"],int(math.ceil(largePackages*goalFactor)))
  for i in xrange(0,len(shuffledLargePackages)):
    output += "      (at {} {})\n".format(shuffledLargePackages[i],random.choice(random.choice(Offices)))

  output += "    )\n"
  output += "  )\n"
  output += ")"

  return output

def main():

    # name="problem-n",
    
    # cities = 2,
    
    # smallAirplanes = 1,
    # mediumAirplanes = 0,
    # largeAirplanes = 0,
    
    # trains = 1,
    # railwayFactor = 0.5,

    # smallTrucksPerCity = 1,
    # mediumTrucksPerCity = 0,
    # largeTrucksPerCity = 0,
    
    # officesPerCity=1,
    
    # smallPackages=10,
    # mediumPackages=5,
    # largePackages=10,

    # goalFactor = 0.5

  for c in [2,3,4,5,6,7,8,9,10,12,14,16,18,20,25,30,35]:
    name = "city-problem-1-office-{}".format(c)
    prob = generator(
      name=name,
      cities=c,
      smallAirplanes=int(c*0.2),
      mediumAirplanes=int(c*0.5),
      largeAirplanes=int(c*0.3),
      trains=int(c*0.3),
      largeTrucksPerCity=1,
      officesPerCity=1,
      smallPackages=int(c*0.5),
      mediumPackages=int(c*0.4),
      largePackages=int(c*0.1),
      railwayFactor = 0.5
      )
    with open("generated-problems/cities/{}.pddl".format(name), 'w') as f:
      f.write(prob)

if __name__ == "__main__":
    main()

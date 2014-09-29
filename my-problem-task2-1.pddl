(define (problem C4_4)
  (:domain logistics)
  (:objects 
    package1 package2 truck1 truck2 airplane1 office1 office2 city1 city2 airport1 
    airport2
  )
  (:init
    (city city1) (city city2)
    (location office1) (loc office1 city1) 
    (location office2) (loc office2 city2)
    (airport airport1) (location airport1) (loc airport1 city1)
    (airport airport2) (location airport2) (loc airport2 city2)

    (small-object package1) (at package1 office1)
    (small-object package2) (at package2 office2)
    (airplane airplane1) (small-vehicle airplane1) (at airplane1 airport1)
    (truck truck1) (small-vehicle truck1) (at truck1 office1)
    (truck truck2) (small-vehicle truck2) (at truck2 office2)	
	 
          	
	
  )
  (:goal 
    (and
      (at package1 office2)
      (at package2 office1)
    )
  )
)

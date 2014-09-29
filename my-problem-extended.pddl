(define (problem C4_4)
  (:domain logistics)
  (:objects package1 truck1 office1 office2 city1)
  (:init (city city1)
	 (location office1) (loc office1 city1) (location office2) (loc office2 city1)
	 (small-object package1) (at package1 office1)
         (truck truck1) (small-vehicle truck1) (at truck1 office2)
	
	 
          	
	
)
  (:goal (at package1 office2))
)

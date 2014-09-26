(define (problem C4_4)
  (:domain logistics)
  (:objects packet1 packet2 packet3 packet4 packet5 truck1 truck2 truck3 truck4
            truck5 airplane1 train2 train3 trainstation1 trainstation2 trainstation3
            trainstation4 office1 office2 office3 office4 office5 airport1 airport3
            airport5 city1 city2 city3 city4 city5)
  (:init (object packet1) (object packet2) (object packet3) (object packet4)
         (object packet5) 

         (truck truck1) (truck truck2) (truck truck3) (truck truck4)
         (truck truck5)
         (vehicle truck1) (vehicle truck2) (vehicle truck3) (vehicle truck4)
         (vehicle truck5)
         
         (airplane airplane1)
	 (vehicle airplane1)

	 (train train2) (train train3)
         (vehicle train2) (vehicle train3)

	 (city city1) (city city2) (city city3) (city city4) (city city5)

	 (trainstation trainstation1) (trainstation trainstation2) 
         (trainstation trainstation3) (trainstation trainstation4)
         (location trainstation1) (location trainstation2)
	 (location trainstation3) (location trainstation4)
	 (loc trainstation1 city1) (loc trainstation2 city2)
	 (loc trainstation3 city3) (loc trainstation4 city4)
	 (railway trainstation1 trainstation4) (railway trainstation4 trainstation1)
         (railway trainstation3 trainstation4) (railway trainstation4 trainstation3)
	 (railway trainstation2 trainstation3) (railway trainstation3 trainstation2)

	 (airport airport1) (airport airport3) (airport airport5)
	 (location airport1) (location airport3) (location airport5)
	 (loc airport1 city1) (loc airport3 city3) (loc airport5 city5)

	 (location office1) (location office2) (location office3) (location office4)
         (location office5)
	 (loc office1 city1) (loc office2 city2) (loc office3 city3) 
         (loc office4 city4) (loc office5 city5)
		
	 (at packet1 office1) (at packet2 office2) (at packet3 trainstation3) 
         (at packet4 office4) (at packet5 office5)

	 (at truck1 trainstation1) (at truck2 office2) (at truck3 office3)
         (at truck4 trainstation4) (at truck5 airport5)

	 (at airplane1 airport5)

	 (at train2 trainstation2) (at train3 trainstation3) 	
	
)
  (:goal (and (at packet1 office4) (at packet2 office1)
	      (at packet3 office1) (at packet4 office5)
	      (at packet5 office2)))
)


;; This is a plain STRIPS formulation of our modified Logistics domain.

;; In this domain, there are different types of objects: "small-object",
;; "medium-object" or  "large-object" (the packages to be transported), 
;; "truck", "airplane", "train" and their common supertypes 
;; "small-vehicle", "medium-vehicle" and "large-vehicle", 
;; "location" and the subtypes "airport" and "trainstation",
;; and finally "city" as well as "railway". "railway" is used to connect 
;; trainstations. Types are defined by static (in the sense that
;; there are no operators that change their truth value) unary predicates.
;; The types of objects in a problem instance must be defined by including
;; the appropriate typing predicates in the initial state.

;; A binary static predicate called "loc" describes the topology of the
;; problem instance: "(loc ?l ?c)" is true iff the location ?l is in city
;; ?c.

(define (domain logistics)
  (:requirements :strips)
  (:predicates

   ;; Static predicates:
   (small-object ?so) (medium-object ?mo) (large-object ?lo) 
   (truck ?t) 
   (airplane ?p)
   (train ?tr)
   (small-vehicle ?sv) (medium-vehicle ?mv) (large-vehicle ?lv)
   (location ?l) (airport ?a) (city ?c) (loc ?l ?c)
   (trainstation ?ts) (railway ?ts1 ?ts2)

   ;; Non-static predicates:
   (at ?x ?l) ;; ?x (package or vehicle) is at location ?l
   (in ?p ?v) ;; package ?p is in vehicle ?v
   )

  ;; Actions for loading and unloading packages.
  ;; By declaring all trucks airplanes and trains to be also 
  ;; "small-vehicle", "medium-vehicle" or "large-vehicle", we
  ;; can use the same load/unload operator for all (otherwise we
  ;; would need one for each subtype of vehicle).
  ;; The load action makes sure so that the packadge and vehicle 
  ;; are compatible.
  (:action load
    :parameters (?o ?v ?l)
    :precondition (and
		    (or 
	  	      (and
	    		(small-vehicle ?v)
	    		(small-object ?o)
	  	      ) 
	  	      (and
	    		(medium-vehicle ?v)
	    		(or
	      		  (small-object ?o)
	      		  (medium-object ?o)
	    		)
	  	      )
	  	      (and
	    		(large-vehicle ?v)
	    		(or
	      		  (small-object ?o)
	      		  (medium-object ?o)
	      		  (large-object ?o)
	    		)
	  	      )
		    )
		    (location ?l)
		    (at ?v ?l)
		    (at ?o ?l)
		  )
    :effect (and (in ?o ?v) (not (at ?o ?l))))


	

  (:action unload
    :parameters (?o ?v ?l)
    :precondition (and 
		    (or (small-object ?o) (medium-object ?o) (large-object ?o))
		    (or (small-vehicle ?v) (medium-vehicle ?v) (large-vehicle ?v))
		    (location ?l)
		    (at ?v ?l)
		    (in ?o ?v))
    :effect (and (at ?o ?l) (not (in ?o ?v))))

  ;; Drive a truck between two locations in the same city.
  ;; By declaring all locations, including airports, to be of type
  ;; "location", we can use only one driving operator (otherwise,
  ;; we would again need one for each case, i.e. one for from-location-
  ;; to-airport, one for from-location-to-location, etc. Very
  ;; unnecessay).
  (:action drive
    :parameters (?t ?l1 ?l2 ?c)
    :precondition (and (truck ?t) (location ?l1) (location ?l2) (city ?c)
		       (at ?t ?l1) (loc ?l1 ?c) (loc ?l2 ?c))
    :effect (and (at ?t ?l2) (not (at ?t ?l1))))

  ;; Fly an airplane between two airports.
  (:action fly
    :parameters (?p ?a1 ?a2)
    :precondition (and (airplane ?p) (airport ?a1) (airport ?a2)
		       (at ?p ?a1))
    :effect (and (at ?p ?a2) (not (at ?p ?a1))))

  ;; Train goes between two train stations that have a connected railway
  (:action ride
    :parameters (?tr ?ts1 ?ts2)
    :precondition (and (train ?tr) (trainstation ?ts1) (trainstation ?ts2)
		       (railway ?ts1 ?ts2) (at ?tr ?ts1))
    :effect (and (at ?tr ?ts2) (not (at ?tr ?ts1))))
  )

(set-logic LIA)

( declare-const D Int )
( declare-const D! Int )
( declare-const N Int )
( declare-const N! Int )
( declare-const ds Int )
( declare-const ds! Int )
( declare-const p Int )
( declare-const p! Int )
( declare-const q Int )
( declare-const q! Int )
( declare-const r Int )
( declare-const r! Int )

( declare-const D_0 Int )
( declare-const D_1 Int )
( declare-const D_2 Int )
( declare-const D_3 Int )
( declare-const D_4 Int )
( declare-const N_0 Int )
( declare-const N_1 Int )
( declare-const N_2 Int )
( declare-const N_3 Int )
( declare-const N_4 Int )
( declare-const ds_0 Int )
( declare-const ds_1 Int )
( declare-const ds_2 Int )
( declare-const ds_3 Int )
( declare-const ds_4 Int )
( declare-const p_0 Int )
( declare-const p_1 Int )
( declare-const p_2 Int )
( declare-const p_3 Int )
( declare-const p_4 Int )
( declare-const q_0 Int )
( declare-const q_1 Int )
( declare-const q_2 Int )
( declare-const q_3 Int )
( declare-const q_4 Int )
( declare-const r_0 Int )
( declare-const r_1 Int )
( declare-const r_2 Int )
( declare-const r_3 Int )
( declare-const r_4 Int )

( define-fun inv-f( ( D Int )( N Int )( ds Int )( p Int )( q Int )( r Int ) ) Bool
SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
)

( define-fun pre-f ( ( D Int )( N Int )( ds Int )( p Int )( q Int )( r Int )( D_0 Int )( D_1 Int )( D_2 Int )( D_3 Int )( D_4 Int )( N_0 Int )( N_1 Int )( N_2 Int )( N_3 Int )( N_4 Int )( ds_0 Int )( ds_1 Int )( ds_2 Int )( ds_3 Int )( ds_4 Int )( p_0 Int )( p_1 Int )( p_2 Int )( p_3 Int )( p_4 Int )( q_0 Int )( q_1 Int )( q_2 Int )( q_3 Int )( q_4 Int )( r_0 Int )( r_1 Int )( r_2 Int )( r_3 Int )( r_4 Int ) ) Bool
	( and
		( = D D_0 )
		( = N N_0 )
		( = ds ds_0 )
		( = p p_0 )
		( = q q_0 )
		( = r r_0 )
		( >= N_0 0 )
		( >= D_0 1 )
		( = r_0 N_0 )
		( = D_0 ds_0 )
		( = p_0 1 )
		( = q_0 0 )
		( <= r_0 ( - ds_0 1 ) )
	)
)

( define-fun trans-f ( ( D Int )( N Int )( ds Int )( p Int )( q Int )( r Int )( D! Int )( N! Int )( ds! Int )( p! Int )( q! Int )( r! Int )( D_0 Int )( D_1 Int )( D_2 Int )( D_3 Int )( D_4 Int )( N_0 Int )( N_1 Int )( N_2 Int )( N_3 Int )( N_4 Int )( ds_0 Int )( ds_1 Int )( ds_2 Int )( ds_3 Int )( ds_4 Int )( p_0 Int )( p_1 Int )( p_2 Int )( p_3 Int )( p_4 Int )( q_0 Int )( q_1 Int )( q_2 Int )( q_3 Int )( q_4 Int )( r_0 Int )( r_1 Int )( r_2 Int )( r_3 Int )( r_4 Int ) ) Bool
	( or
		( and
			( = D_1 D )
			( = N_1 N )
			( = ds_1 ds )
			( = p_1 p )
			( = q_1 q )
			( = r_1 r )
			( = D_1 D! )
			( = N_1 N! )
			( = ds_1 ds! )
			( = p_1 p! )
			( = q_1 q! )
			( = r_1 r! )
			( = D D! )
			( = N N! )
			( = ds ds! )
			( = q q! )
			( = r r! )
		)
		( and
			( not ( <= ( - 2 p_1 ) 0 ) )
			( not ( >= r_1 0 ) )
			(= D D_0 )
			(= D! D_0 )
			(= N N_0 )
			(= N! N_0 )
			(= ds ds_0 )
			(= ds! ds_0 )
			(= p p_0 )
			(= p! p_0 )
			(= q q_0 )
			(= q! q_0 )
			(= r r_0 )
			(= r! r_0 )
		)
	)
)

( define-fun post-f ( ( D Int )( N Int )( ds Int )( p Int )( q Int )( r Int )( D_0 Int )( D_1 Int )( D_2 Int )( D_3 Int )( D_4 Int )( N_0 Int )( N_1 Int )( N_2 Int )( N_3 Int )( N_4 Int )( ds_0 Int )( ds_1 Int )( ds_2 Int )( ds_3 Int )( ds_4 Int )( p_0 Int )( p_1 Int )( p_2 Int )( p_3 Int )( p_4 Int )( q_0 Int )( q_1 Int )( q_2 Int )( q_3 Int )( q_4 Int )( r_0 Int )( r_1 Int )( r_2 Int )( r_3 Int )( r_4 Int ) ) Bool
	( and
		( or
			( not
				( and
					( = D D_1)
					( = N N_1)
					( = ds ds_1)
					( = p p_1)
					( = q q_1)
					( = r r_1)
				)
			)
			( not
				( and
					( not ( <= ( - 2 p_1 ) 0 ) )
					( >= r_1 ds_1 )
					( = N_2 N_1 )
					( = D_2 D_1 )
					( = r_2 ( - r_1 ( / ds_1 2 ) ) )
					( = ds_2 ( / ds_1 2 ) )
					( = p_2 ( / p_1 2 ) )
					( = q_2 ( + q_1 ( / p_2 2 ) ) )
					( = D_3 D_2 )
					( = N_3 N_2 )
					( = ds_3 ds_2 )
					( = p_3 p_2 )
					( = q_3 q_2 )
					( = r_3 r_2 )
					( = D_1 D_3 )
					( = N_1 N_3 )
					( = ds_1 ds_3 )
					( = p_1 p_3 )
					( = q_1 q_3 )
					( = r_1 r_3 )
					( not ( <= ( - 2 p_1 ) 0 ) )
					( not ( >= r_1 0 ) )
				)
			)
		)
		( or
			( not
				( and
					( = D D_1)
					( = N N_1)
					( = ds ds_1)
					( = p p_1)
					( = q q_1)
					( = r r_1)
				)
			)
			( not
				( and
					( not ( <= ( - 2 p_1 ) 0 ) )
					( not ( >= r_1 ds_1 ) )
					( <= r_1 ( - ds_1 1 ) )
					( = N_4 N_1 )
					( = D_4 D_1 )
					( = r_4 r_1 )
					( = ds_4 ( / ds_1 2 ) )
					( = p_4 ( / p_1 2 ) )
					( = q_4 q_1 )
					( = D_3 D_4 )
					( = N_3 N_4 )
					( = ds_3 ds_4 )
					( = p_3 p_4 )
					( = q_3 q_4 )
					( = r_3 r_4 )
					( = D_1 D_3 )
					( = N_1 N_3 )
					( = ds_1 ds_3 )
					( = p_1 p_3 )
					( = q_1 q_3 )
					( = r_1 r_3 )
					( not ( <= ( - 2 p_1 ) 0 ) )
					( not ( >= r_1 0 ) )
				)
			)
		)
		( or
			( not
				( and
					( = D D_1)
					( = N N_1)
					( = ds ds_1)
					( = p p_1)
					( = q q_1)
					( = r r_1)
				)
			)
			( not
				( and
					( not ( <= ( - 2 p_1 ) 0 ) )
					( not ( >= r_1 ds_1 ) )
					( not ( <= r_1 ( - ds_1 1 ) ) )
					( = D_3 D_1 )
					( = N_3 N_1 )
					( = ds_3 ds_1 )
					( = p_3 p_1 )
					( = q_3 q_1 )
					( = r_3 r_1 )
					( = D_1 D_3 )
					( = N_1 N_3 )
					( = ds_1 ds_3 )
					( = p_1 p_3 )
					( = q_1 q_3 )
					( = r_1 r_3 )
					( not ( <= ( - 2 p_1 ) 0 ) )
					( not ( >= r_1 0 ) )
				)
			)
		)
	)
)
SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( pre-f D N ds p q r D_0 D_1 D_2 D_3 D_4 N_0 N_1 N_2 N_3 N_4 ds_0 ds_1 ds_2 ds_3 ds_4 p_0 p_1 p_2 p_3 p_4 q_0 q_1 q_2 q_3 q_4 r_0 r_1 r_2 r_3 r_4  )
		( inv-f D N ds p q r )
	)
))

SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( and
			( inv-f D N ds p q r )
			( trans-f D N ds p q r D! N! ds! p! q! r! D_0 D_1 D_2 D_3 D_4 N_0 N_1 N_2 N_3 N_4 ds_0 ds_1 ds_2 ds_3 ds_4 p_0 p_1 p_2 p_3 p_4 q_0 q_1 q_2 q_3 q_4 r_0 r_1 r_2 r_3 r_4 )
		)
		( inv-f D! N! ds! p! q! r! )
	)
))

SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( inv-f D N ds p q r  )
		( post-f D N ds p q r D_0 D_1 D_2 D_3 D_4 N_0 N_1 N_2 N_3 N_4 ds_0 ds_1 ds_2 ds_3 ds_4 p_0 p_1 p_2 p_3 p_4 q_0 q_1 q_2 q_3 q_4 r_0 r_1 r_2 r_3 r_4 )
	)
))


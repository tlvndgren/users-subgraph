publish:
	rover subgraph publish Tyler-Fed-Demo@current --schema ./users.graphql \
		--name users --routing-url https://users-subgraph-waaq4qt37q-uc.a.run.app

check:
	rover subgraph check Tyler-Fed-Demo \
	--schema=users.graphql \
	--name=users --validation-period=2w
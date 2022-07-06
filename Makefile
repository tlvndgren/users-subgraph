publish:
	rover subgraph publish Tyler-Fed-Demo@prod --schema ./users.graphql \
		--name users --routing-url https://prod-users-subgraph-bhl6lhslfa-uc.a.run.app

publish-staging:
	rover subgraph publish Tyler-Fed-Demo@staging --schema ./users.graphql \
		--name users --routing-url https://staging-users-bhl6lhslfa-uc.a.run.app

check:
	rover subgraph check Tyler-Fed-Demo@prod \
	--schema=users.graphql \
	--name=users --validation-period=2w
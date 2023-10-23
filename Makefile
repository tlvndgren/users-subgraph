check:
	APOLLO_KEY=service:Ecom-Demo:AYUDFug7in-tSgJOCAQK6w \
	rover subgraph check Ecom-Demo@prod \
	--schema=users.graphql \
	--name=users --validation-period=2w

publish:
	APOLLO_KEY=service:Ecom-Demo:AYUDFug7in-tSgJOCAQK6w \
  	rover subgraph publish Ecom-Demo@prod \
  	--schema ./users.graphql \
  	--name users \
  	--routing-url https://prod-users-subgraph-bhl6lhslfa-uc.a.run.app

force-publish:
	APOLLO_KEY=service:Ecom-Demo:50QFQdEhoV60d5qZObXwTQ \
  	rover subgraph publish Ecom-Demo@prod \
  	--schema ./users.graphql \
  	--name users \
  	--routing-url https://prod-users-subgraph-bhl6lhslfa-uc.a.run.app

old-publish:
	rover subgraph publish Tyler-Fed-Demo@prod --schema ./users.graphql \
		--name users --routing-url https://prod-users-subgraph-bhl6lhslfa-uc.a.run.app

publish-staging:
	rover subgraph publish Tyler-Fed-Demo@staging --schema ./users.graphql \
		--name users --routing-url https://staging-users-bhl6lhslfa-uc.a.run.app

old-check:
	rover subgraph check Tyler-Fed-Demo@prod \
	--schema=users.graphql \
	--name=users --validation-period=2w

dev-publish:
	rover subgraph publish Tyler-Fed-Demo@prod --profile dev --schema ./users.graphql \
		--name users --routing-url https://prod-users-subgraph-bhl6lhslfa-uc.a.run.app

dev-publish-manual:
	APOLLO_KEY=service:Tyler-Fed-Demo:H7N-S3pQ2o403uT2K_I8FQ \
  		rover subgraph publish Tyler-Fed-Demo@prod \
  		--name users --schema ./users.graphql \
  		--routing-url https://prod-users-subgraph-bhl6lhslfa-uc.a.run.app
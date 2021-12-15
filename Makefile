publish:
	APOLLO_KEY=service:Ty-Ecom-Fed-Demo:qRB-IERyEKfL5VoignIbDw \
  		rover subgraph publish Ty-Ecom-Fed-Demo@current \
  		--name users --schema ./users.graphql \
  		--routing-url https://users-subgraph-waaq4qt37q-uc.a.run.app

check:
	apollo service:check \
	--localSchemaFile=users.graphql \
	--graph=Ty-Ecom-Fed-Demo \
	--variant=current \
	--serviceName=books 
#	--validationPeriod=20736000 

rcheck:
	rover subgraph check Ty-Ecom-Fed-Demo \
	--schema=users.graphql \
	--name=users --validation-period=2w
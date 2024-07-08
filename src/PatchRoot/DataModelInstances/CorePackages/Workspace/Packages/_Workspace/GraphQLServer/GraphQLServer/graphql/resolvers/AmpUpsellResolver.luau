local v0 = require(script:FindFirstAncestor("GraphQLServer").graphql.connectors.AmpUpsellConnector);
return {
    default = {
        UpsellFeatureAccessResponse = {
            featureAccess = function(v1)
                return {
                    featureName = v1.featureName, 
                    access = v1.access, 
                    recourse = v1.recourse
                };
            end
        }, 
        Query = {
            getFeatureAccess = function(_, v3, v4)
                return v0.getFeatureAccessFromFeatureNamesList(v3.featureNames, v4.fetchImpl);
            end, 
            getUpsellFeatureAccess = function(_, v6, v7)
                return v0.getUpsellFeatureAccessFromFeatureName(v6.featureName, v6.successfulActions, v7.fetchImpl);
            end
        }
    }
};

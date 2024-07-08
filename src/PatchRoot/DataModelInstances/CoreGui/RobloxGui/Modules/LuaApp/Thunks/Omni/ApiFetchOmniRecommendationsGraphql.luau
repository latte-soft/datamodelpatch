local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.ApolloClient);
local _ = v1.gql;
local _ = v1.NULL;
local v4 = require(l_CorePackages_0.Packages.Promise);
local v5 = require(l_CorePackages_0.Workspace.Packages.ApolloLocalState);
local l_reactiveVars_0 = v5.reactiveVars;
local l_omniFeedWithMetadata_0 = v5.queries.omniFeed.omniFeedWithMetadata;
local l_omniSessionId_0 = l_reactiveVars_0.omniSessionId;
local l_nextPageToken_0 = l_reactiveVars_0.nextPageToken;
local l_supportedTreatmentTypes_0 = l_reactiveVars_0.supportedTreatmentTypes;
local v11 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Flags.GetFFlagUseHomeOmniFeedDataLoader);
return function(v12, v13, v14, v15, v16)
    local l_l_omniFeedWithMetadata_0_0 = l_omniFeedWithMetadata_0;
    local v18 = nil;
    local v20 = v12:query({
        query = l_l_omniFeedWithMetadata_0_0, 
        variables = {
            pageType = v13, 
            sessionId = v14, 
            nextPageToken = v15, 
            supportedTreatmentTypes = v16
        }, 
        fetchPolicy = "network-only"
    }):catch(function(v19)
        v18 = v19;
        return nil;
    end):expect();
    if v11() then
        l_omniSessionId_0(v14);
        l_nextPageToken_0(v15);
        l_supportedTreatmentTypes_0(v16);
    end;
    if not v18 then
        return v4.resolve(v20);
    else
        return v4.reject(v18);
    end;
end;

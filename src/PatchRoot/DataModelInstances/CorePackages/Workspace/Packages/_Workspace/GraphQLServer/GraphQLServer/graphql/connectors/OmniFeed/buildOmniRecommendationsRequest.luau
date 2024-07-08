local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local l_MakeOmniRecommendationsRequest_0 = require(l_Parent_0.GraphQlShared).MakeOmniRecommendationsRequest;
local _ = require(l_Parent_0.LuauPolyfill);
local _ = require(l_Parent_0.Fetch);
local _ = function(v4)
    return function(v5, _, v7)
        return v4(v5, {
            body = v7.postBody, 
            method = "POST", 
            headers = {
                ["Content-Type"] = "application/json", 
                Accept = "application/json"
            }
        });
    end;
end;
return function(v9)
    local function v13(v10, _, v12)
        return v9(v10, {
            body = v12.postBody, 
            method = "POST", 
            headers = {
                ["Content-Type"] = "application/json", 
                Accept = "application/json"
            }
        });
    end;
    return function(v14, v15, v16, v17)
        return l_MakeOmniRecommendationsRequest_0(v13, v14, v15, v16, v17);
    end;
end;

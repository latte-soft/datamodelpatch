local v0 = require(script:FindFirstAncestor("GraphQlShared").Parent.Promise);
return {
    SuccessfulRequest = function(v1)
        return function(_, _, _, _, _)
            return v0.resolve({
                responseCode = 200, 
                responseTimeMs = 480, 
                isJSONValid = true, 
                v1, 
                responseBody = v1
            });
        end;
    end
};

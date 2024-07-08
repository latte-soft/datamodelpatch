local v0 = require(script.Parent.Action);
return function(v1)
    return {
        Succeeded = v0(v1.Name .. "_Succeeded", function(v2, v3, v4, v5, v6)
            return {
                ids = v2, 
                responseBody = v3, 
                namedIds = v4, 
                postBody = not not v5 and v5.postBody or nil, 
                queryArgs = v5 and v5.queryArgs, 
                additionalData = v6
            };
        end), 
        Failed = v0(v1.Name .. "_Failed", function(v7, v8, v9, v10, v11)
            return {
                ids = v7, 
                error = v8, 
                namedIds = v9, 
                postBody = not not v10 and v10.postBody or nil, 
                queryArgs = not not v10 and v10.queryArgs or nil, 
                additionalData = v11
            };
        end)
    };
end;

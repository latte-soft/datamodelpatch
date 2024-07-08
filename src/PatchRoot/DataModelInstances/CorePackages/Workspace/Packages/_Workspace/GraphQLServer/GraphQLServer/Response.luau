local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local v1 = require(l_Parent_0.Promise);
local l_Error_0 = require(l_Parent_0.LuauPolyfill).Error;
local l_stringify_0 = require(l_Parent_0.GraphQL).stringify;
local v4 = {};
v4.__index = v4;
v4.new = function(v5)
    local v6 = {
        body = v5
    };
    setmetatable(v6, v4);
    return v6;
end;
v4.text = function(v7)
    return v1.new(function(v8, v9)
        local l_status_0, l_result_0 = pcall(function()
            if v7.body.errors then
                for v10, v11 in v7.body.errors, nil, nil do
                    if type(v11) == "table" and v11.name == "GraphQLError" then
                        v7.body.errors[v10] = {
                            message = v11.message, 
                            locations = v11.locations, 
                            extensions = v11.extensions, 
                            path = v11.path
                        };
                    end;
                end;
            end;
            return l_stringify_0(v7.body);
        end);
        if not l_status_0 then
            v9(l_Error_0.new(l_result_0));
            return ;
        else
            v8(l_result_0);
            return ;
        end;
    end);
end;
return v4;

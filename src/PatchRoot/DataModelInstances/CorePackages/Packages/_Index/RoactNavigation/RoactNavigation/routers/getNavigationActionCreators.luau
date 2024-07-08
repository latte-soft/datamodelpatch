local v0 = require(script.Parent.Parent.NavigationActions);
local v1 = require(script.Parent.Parent.utils.invariant);
return function(v2)
    return {
        goBack = function(v3)
            if not (not (v3 == nil) or not v2.key) then
                v1(type(v2.key) == "string", ".goBack(): key should be a string");
                v3 = v2.key;
            end;
            return v0.back({
                key = v3
            });
        end, 
        navigate = function(v4, v5, v6)
            if type(v4) == "string" then
                return v0.navigate({
                    routeName = v4, 
                    params = v5, 
                    action = v6
                });
            else
                v1(type(v4) == "table", ".navigate(): navigateTo must be a string or table");
                v1(v5 == nil, ".navigate(): params can only be provided with a string navigateTo value");
                v1(v6 == nil, ".navigate(): child action can only be provided with a string navigateTo value");
                return v0.navigate(v4);
            end;
        end, 
        setParams = function(v7)
            v1(type(v2.key) == "string", ".setParams(): cannot be called by the root navigator");
            return v0.setParams({
                params = v7, 
                key = v2.key
            });
        end
    };
end;

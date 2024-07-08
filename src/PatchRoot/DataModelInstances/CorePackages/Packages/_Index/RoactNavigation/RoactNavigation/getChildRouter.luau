local v0 = require(script.Parent.utils.invariant);
return function(v1, v2)
    if not v1.childRouters or not v1.childRouters[v2] then
        v0(type(v1.getComponentForRouteName) == "function", "router.getComponentForRouteName must be a function if no child routers are specified");
        local v3 = v1.getComponentForRouteName(v2);
        if type(v3) == "table" then
            return v3.router;
        else
            return nil;
        end;
    else
        return v1.childRouters[v2];
    end;
end;

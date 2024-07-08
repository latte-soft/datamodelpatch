local l_Parent_0 = script.Parent.Parent;
local l_Object_0 = require(l_Parent_0.Parent.LuauPolyfill).Object;
local v2 = require(l_Parent_0.NavigationSymbol);
local v3 = v2("POP");
local v4 = v2("POP_TO_TOP");
local v5 = v2("PUSH");
local v6 = v2("RESET");
local v7 = v2("REPLACE");
local v8 = v2("COMPLETE_TRANSITION");
local v9 = {
    Pop = v3, 
    PopToTop = v4, 
    Push = v5, 
    Reset = v6, 
    Replace = v7, 
    CompleteTransition = v8
};
setmetatable(v9, {
    __index = function(_, v11)
        error(("%q is not a valid member of StackActions"):format((tostring(v11))), 2);
    end
});
v9.pop = function(v12)
    local v13 = {
        type = v3
    };
    if not v12 then
        return v13;
    else
        return (l_Object_0.assign(v13, v12));
    end;
end;
v9.popToTop = function(v14)
    local v15 = {
        type = v4
    };
    if not v14 then
        return v15;
    else
        return (l_Object_0.assign(v15, v14));
    end;
end;
v9.push = function(v16)
    local v17 = {
        type = v5
    };
    if not v16 then
        return v17;
    else
        return (l_Object_0.assign(v17, v16));
    end;
end;
v9.reset = function(v18)
    local v19 = {
        type = v6
    };
    if not v18 then
        return v19;
    else
        return (l_Object_0.assign(v19, v18));
    end;
end;
v9.replace = function(v20)
    local v21 = {
        type = v7, 
        preserveFocus = true
    };
    if not v20 then
        return v21;
    else
        return (l_Object_0.assign(v21, v20));
    end;
end;
v9.completeTransition = function(v22)
    local v23 = {
        type = v8, 
        preserveFocus = true
    };
    if not v22 then
        return v23;
    else
        return (l_Object_0.assign(v23, v22));
    end;
end;
return v9;

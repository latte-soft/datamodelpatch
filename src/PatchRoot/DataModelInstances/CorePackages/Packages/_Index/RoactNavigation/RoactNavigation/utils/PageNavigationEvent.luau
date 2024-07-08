local v0 = require(script.Parent.invariant);
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3)
    v0(type(v2) == "string", "pageName should be string");
    v0(typeof(v3) == "userdata", "event should be RoactNavigation.Event");
    local v4 = {
        event = v3, 
        pageName = v2
    };
    setmetatable(v4, v1);
    return v4;
end;
v1.isPageNavigationEvent = function(v5)
    return getmetatable(v5).__index == v1;
end;
v1.__tostring = function(v6)
    return string.format("%-15s - %s", tostring(v6.event), v6.pageName);
end;
v1.equalTo = function(v7, v8)
    v0(v1.isPageNavigationEvent(v8), "should be PageNavigationEvent");
    local v9 = false;
    if v7.pageName == v8.pageName then
        v9 = v7.event == v8.event;
    end;
    return v9;
end;
return v1;

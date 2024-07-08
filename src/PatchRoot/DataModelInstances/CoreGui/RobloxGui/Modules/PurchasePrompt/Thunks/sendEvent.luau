local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Services.Analytics);
local v2 = require(l_Parent_0.Thunk);
local v3 = {
    v1
};
return function(v4, v5)
    return v2.new(script.Name, v3, function(_, v7)
        v7[v1].signalEvent(v4, v5);
    end);
end;

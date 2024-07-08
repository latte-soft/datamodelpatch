local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Thunk);
local v2 = require(l_Parent_0.Services.Analytics);
local v3 = {
    v2
};
return function(v4)
    return v1.new(script.Name, v3, function(_, v6)
        v6[v2].sendCounter(v4);
    end);
end;

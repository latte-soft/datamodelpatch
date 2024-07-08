local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.Dev.React);
return function(v3, v4)
    return v1.List.foldRight(v4, function(v5, v6)
        return v2.createElement(v6, nil, {
            ProviderChildren = v5
        });
    end, v3);
end;

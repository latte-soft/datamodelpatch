local _ = require(script.Parent.NavigationTypes);
local function v1(v2)
    if not v2.routes or not v2.index then
        return v2;
    else
        return v1(v2.routes[v2.index]);
    end;
end;
return v1;

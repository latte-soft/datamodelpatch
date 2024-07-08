local _ = require(script.Parent.NavigationTypes);
local function v1(v2)
    local v3 = v2._dangerouslyGetParent();
    if not v3 then
        return v2;
    else
        return (v1(v3));
    end;
end;
return v1;

local _ = require(script.Parent.NavigationTypes);
local function v1(v2, v3)
    if v3.key == v2 then
        return true;
    else
        if v3.routes then
            for _, v5 in pairs(v3.routes) do
                if v1(v2, v5) then
                    return true;
                end;
            end;
        end;
        return false;
    end;
end;
return v1;

local v0 = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck);
local v1 = {
    50, 
    128, 
    150, 
    256, 
    512
};
return function(v2)
    v0.isNonNegativeNumber(v2, "Game Icon Size");
    local v3 = #v1;
    for _, v5 in ipairs(v1) do
        if v2 <= v5 then
            return v5;
        end;
    end;
    return v1[v3];
end;

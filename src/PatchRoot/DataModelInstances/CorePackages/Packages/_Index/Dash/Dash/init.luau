local v0 = {};
local _ = require(script.Types);
for _, v3 in pairs(script:GetChildren()) do
    if v3.ClassName == "ModuleScript" then
        v0[v3.Name] = require(v3);
    end;
end;
return v0.freeze("Dash", v0, true);

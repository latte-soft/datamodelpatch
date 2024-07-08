local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v4 = game:DefineFastString("IxpNewLayersForRegistration", "");
local function v9(v5, v6)
    if v5[v6] then
        for v7 = 2, 100 do
            local v8 = v6 .. "_" .. v7;
            if not v5[v8] then
                v5[v8] = true;
                return v8;
            end;
        end;
        error("Exceeded max index for next key search: " .. v6);
        return ;
    else
        v5[v6] = true;
        return v6;
    end;
end;
return function(v10)
    local v11 = v10 or v4;
    if #v11 == 0 then
        return v3;
    else
        local v12 = v2.copy(v3);
        local v13 = {};
        local v14 = {};
        for v15, v16 in v12, nil, nil do
            v13[v15] = true;
            v14[v16] = true;
        end;
        for _, v18 in (v2.map(string.split(v11, ","), v2.trim)), nil, nil do
            if not v14[v18] then
                v14[v18] = true;
                v12[v9(v13, v18)] = v18;
            end;
        end;
        return v12;
    end;
end;

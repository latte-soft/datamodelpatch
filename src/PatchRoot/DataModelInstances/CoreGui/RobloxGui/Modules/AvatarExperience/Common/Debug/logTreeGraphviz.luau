local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Debug.LogTree);
local l_Levels_0 = require(l_CorePackages_0.Lumberyak).Logger.Levels;
local v3 = {
    [l_Levels_0.Error] = "pink", 
    [l_Levels_0.Warning] = "orange", 
    [l_Levels_0.Info] = "yellow", 
    [l_Levels_0.Debug] = "cyan", 
    [l_Levels_0.Trace] = "green"
};
local v4 = {
    [l_Levels_0.Error] = 1, 
    [l_Levels_0.Warning] = 2, 
    [l_Levels_0.Info] = 3, 
    [l_Levels_0.Debug] = 4, 
    [l_Levels_0.Trace] = 5
};
local function _(v5)
    local v6 = v3[v5];
    return not not v6 and string.format(" fillcolor=%s style=filled", v6) or "";
end;
local function _(v8)
    return v4[v8] or 0;
end;
local function _(v10, v11)
    return (v4[v11] or 0) < (v4[v10] or 0) and v10 or v11;
end;
local function v13(v14, v15)
    local v16 = "";
    local v17 = tostring(v14.name);
    for _, v19 in v14.sinks, nil, nil do
        v17 = v17 .. "\\n(sink: " .. tostring(v19.maxLevel) .. ")";
        local l_v15_0 = v15;
        local l_maxLevel_0 = v19.maxLevel;
        if (v4[l_maxLevel_0] or 0) < (v4[l_v15_0] or 0) then
            v15 = l_v15_0;
            if v15 then
                continue;
            end;
        end;
        v15 = l_maxLevel_0;
    end;
    local l_v16_0 = v16;
    local l_format_0 = string.format;
    local v24 = "\"%s\" [label=\"%s\"%s];\n";
    local l_name_0 = v14.name;
    local l_v17_0 = v17;
    local v27 = v3[v15];
    v16 = l_v16_0 .. l_format_0(v24, l_name_0, l_v17_0, not not v27 and string.format(" fillcolor=%s style=filled", v27) or "");
    for v28, _ in v14.children, nil, nil do
        v16 = v16 .. string.format("\"%s\" -> \"%s\"\n", tostring(v28.name), v14.name) .. v13(v28, v15);
    end;
    return v16;
end;
return function()
    return "digraph {\n" .. v13((v1.logger("*"))) .. "}\n";
end;

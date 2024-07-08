local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Lumberyak);
local l_Levels_0 = v3.Logger.Levels;
local v5 = require(l_Modules_0.LuaApp.LuaAppBacktraceLogger);
local v6 = require(l_Modules_0.AvatarExperience.Common.Debug.SharedSink);
local v7 = game:DefineFastInt("LogTreeMaxLogsToBacktrace", 1000);
local v8 = game:DefineFastString("DebugLogTags", "");
local v9 = game:DefineFastString("BacktraceLogTags", "");
local v10 = v3.Logger.new(nil, "root");
local v11 = tick();
local v12 = 0;
local v13 = {
    ["*"] = v10
};
v10:setContext({
    tostring = function(v14)
        if typeof(v14) == "string" then
            return v14;
        else
            local v15 = getmetatable(v14);
            if not v15 or not v15.__tostring then
                return v2.pretty(v14);
            else
                return (tostring(v14));
            end;
        end;
    end
});
local function _(v16, v17)
    local v18 = v3.Logger.new(v16, v17);
    v13[v17] = v18;
    return v18;
end;
local function v30(v20)
    local v21 = v20:split(".");
    local v22 = "";
    local l_v10_0 = v10;
    for v24, v25 in v21, nil, nil do
        if v25 == "" then
            error("Invalid log tag: " .. v20);
        end;
        v22 = if v24 == 1 then v25 else v22 .. "." .. v25;
        local v26 = v13[v22];
        if not v26 then
            local l_l_v10_0_0 = l_v10_0;
            local l_v22_0 = v22;
            local v29 = v3.Logger.new(l_l_v10_0_0, l_v22_0);
            v13[l_v22_0] = v29;
            v26 = v29;
        end;
        l_v10_0 = v26;
    end;
    return l_v10_0;
end;
local function v32(v31)
    return v13[v31] or v30(v31);
end;
local function _(v33)
    local v34 = v33:split(":");
    if #v34 ~= 2 then
        warn("Invalid LogTree value: " .. v33);
        return nil, nil;
    else
        local v35, v36 = table.unpack(v34);
        return v2.trim(v35), l_Levels_0.fromString(v36);
    end;
end;
local function v42(v38, v39, v40)
    local v41 = string.format("%s [%s] %s", v39.level:sub(1, 1), v39.loggerName, v38);
    if v40 then
        v41 = string.format("[%0.3f] %s", tick() - v11, v41);
    end;
    return v41;
end;
local function v48(_, v44, v45)
    local l_level_0 = v45.level;
    local v47 = v42(v44, v45, false);
    if not (l_level_0 ~= l_Levels_0.Error) or l_level_0 == l_Levels_0.Warning then
        warn(v47);
        return ;
    else
        print(v47);
        return ;
    end;
end;
local function v52(_, v50, v51)
    v12 = v12 + 1;
    if v7 < v12 then
        if v7 > 0 and v12 == v7 + 1 then
            v5:addLumberyakLog(string.format("[Log limit reached: %d]", v7));
        end;
        return ;
    else
        v5:addLumberyakLog((v42(v50, v51, true)));
        return ;
    end;
end;
local function _(v53)
    return v2.filter(v2.splitOn(v53, "%s+"), function(v54)
        return #v54 > 0;
    end);
end;
local function v68(v56, v57)
    local v58 = v6.new(v57);
    for _, v61 in (v2.filter(v2.splitOn(v56, "%s+"), function(v59)
        return #v59 > 0;
    end)), nil, nil do
        local v62 = v61:split(":");
        local v63, v64;
        if #v62 ~= 2 then
            warn("Invalid LogTree value: " .. v61);
            v63 = nil;
            v64 = nil;
        else
            local v65, v66 = table.unpack(v62);
            v63 = v2.trim(v65);
            v64 = l_Levels_0.fromString(v66);
        end;
        if v63 ~= nil then
            local v67 = tostring(v63);
            (v13[v67] or v30(v67)):addSink((v58:newSink(v64)));
        end;
    end;
end;
v68(v8, v48);
v68(v9, v52);
return {
    logger = v32
};

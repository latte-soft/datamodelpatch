local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local v2 = {};
local v3 = nil;
local _ = require(script.Parent.ReactFiberLane);
local l_enableDebugTracing_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableDebugTracing;
local v6 = nil;
local v7 = {};
local v8 = 0;
decimalToBinaryString = function(v9)
    local v10 = "";
    while true do
        local v11, v12 = math.modf(v9 / 2);
        v9 = v11;
        v10 = math.ceil(v12) .. v10;
        if not (v9 ~= 0) then
            break;
        end;
    end;
    return string.rep("0", 31 - string.len(v10)) .. v10;
end;
local function _(v13)
    return "0b" .. decimalToBinaryString(v13);
end;
local function v17(...)
    for _, v16 in {
        ...
    }, nil, nil do
        table.insert(v7, v16);
    end;
    if v6 == nil then
        v6 = l_console_0.log;
        l_console_0.log = v3;
    end;
end;
local function v18()
    table.remove(v7, 1);
    while #v7 < v8 do
        l_console_0.groupEnd();
        v8 = v8 - 1;
    end;
    if #v7 == 0 then
        l_console_0.log = v6;
        v6 = nil;
    end;
end;
v3 = function(...)
    if v8 < #v7 then
        for v19 = v8 + 1, #v7 do
            l_console_0.group(v7[v19]);
        end;
        v8 = #v7;
    end;
    if typeof(v6) == "function" then
        v6(...);
        return ;
    else
        l_console_0.log(...);
        return ;
    end;
end;
v2.logCommitStarted = function(v20)
    if not (not _G.__DEV__ or not l_enableDebugTracing_0) then
        v17(string.format("* commit (%s)", "0b" .. decimalToBinaryString(v20)), "", "", "");
    end;
end;
v2.logCommitStopped = function()
    if not (not _G.__DEV__ or not l_enableDebugTracing_0) then
        v18();
    end;
end;
v2.logComponentSuspended = function(v21, v22)
    if not (not _G.__DEV__ or not l_enableDebugTracing_0) then
        v3(string.format("* %s suspended", v21));
        v22:andThen(function()
            v3(string.format("* %s resolved", v21));
        end, function()
            v3(string.format("* %s rejected", v21));
        end);
    end;
end;
v2.logLayoutEffectsStarted = function(v23)
    if not (not _G.__DEV__ or not l_enableDebugTracing_0) then
        v17(string.format("* layout effects (%s)", "0b" .. decimalToBinaryString(v23)));
    end;
end;
v2.logLayoutEffectsStopped = function()
    if not (not _G.__DEV__ or not l_enableDebugTracing_0) then
        v18();
    end;
end;
v2.logPassiveEffectsStarted = function(v24)
    if not (not _G.__DEV__ or not l_enableDebugTracing_0) then
        v17(string.format("* passive effects (%s)", "0b" .. decimalToBinaryString(v24)));
    end;
end;
v2.logPassiveEffectsStopped = function()
    if not (not _G.__DEV__ or not l_enableDebugTracing_0) then
        v18();
    end;
end;
v2.logRenderStarted = function(v25)
    if not (not _G.__DEV__ or not l_enableDebugTracing_0) then
        v17(string.format("* render (%s)", "0b" .. decimalToBinaryString(v25)));
    end;
end;
v2.logRenderStopped = function()
    if not (not _G.__DEV__ or not l_enableDebugTracing_0) then
        v18();
    end;
end;
v2.logForceUpdateScheduled = function(v26, v27)
    if not (not _G.__DEV__ or not l_enableDebugTracing_0) then
        v3(string.format("* %s forced update (%s)", v26, "0b" .. decimalToBinaryString(v27)));
    end;
end;
v2.logStateUpdateScheduled = function(v28, v29, _)
    if not (not _G.__DEV__ or not l_enableDebugTracing_0) then
        v3(string.format("* %s updated state (%s)", v28, "0b" .. decimalToBinaryString(v29)));
    end;
end;
return v2;

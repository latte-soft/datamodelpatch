local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Boolean_0 = require(l_Parent_1.LuauPolyfill).Boolean;
local v3 = {};
local v4 = require(l_Parent_1.ChalkLua);
local _ = require(l_Parent_1.JestTestResult);
local _ = require(l_Parent_1.JestTypes);
local l_formatTime_0 = require(l_Parent_1.JestUtil).formatTime;
local v8 = require(l_Parent_0.utils);
local l_formatTestPath_0 = v8.formatTestPath;
local l_printDisplayName_0 = v8.printDisplayName;
local function v11(...)
    return v4.reset(v4.bold(v4.bgRed(...)));
end;
local v12 = if not (v4.supportsColor ~= nil) or v4.supportsColor == true then v4.reset(v4.inverse(v4.bold(v4.red(string.format(" %s ", "FAIL"))))) else "FAIL";
local v13 = if not (v4.supportsColor ~= nil) or v4.supportsColor == true then v4.reset(v4.inverse(v4.bold(v4.green(string.format(" %s ", "PASS"))))) else "PASS";
v3.default = function(v14, v15, v16)
    local v17 = l_formatTestPath_0(v16 or v15, v14.testFilePath);
    if v14.numFailingTests == nil then
        v14.numFailingTests = 0;
    end;
    local v18 = if not (v14.numFailingTests <= 0) or v14.testExecError ~= nil then v12 else v13;
    local v19 = {};
    if not (not (v14.perfStats ~= nil) or not l_Boolean_0.toJSBoolean(v14.perfStats.slow)) then
        table.insert(v19, v11(l_formatTime_0(v14.perfStats.runtime / 1000, 0)));
    end;
    if v14.memoryUsage ~= nil then
        local function _(v20)
            return (math.floor((v20 / 1024) / 1024));
        end;
        table.insert(v19, (" %sMB heap size"):format((tostring((math.floor((v14.memoryUsage / 1024) / 1024))))));
    end;
    return string.format("%s %s%s %s", v18, if v16 ~= nil and l_Boolean_0.toJSBoolean(v16.displayName) then l_printDisplayName_0(v16) .. " " else "", v17, table.concat(v19, " "));
end;
return v3;

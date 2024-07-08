local v0 = require(script.Parent.console);
local v1 = 0;
local v2 = nil;
local v3 = nil;
local v4 = nil;
local v5 = nil;
local v6 = nil;
local v7 = nil;
local v8 = nil;
local function v9()
end;
return {
    disabledLog = v9, 
    disableLogs = function()
        if _G.__DEV__ then
            if v1 == 0 then
                v2 = v0.log;
                v3 = v0.info;
                v4 = v0.warn;
                v5 = v0.error;
                v6 = v0.group;
                v7 = v0.groupCollapsed;
                v8 = v0.groupEnd;
                v0.info = v9;
                v0.log = v9;
                v0.warn = v9;
                v0.error = v9;
                v0.group = v9;
                v0.groupCollapsed = v9;
                v0.groupEnd = v9;
            end;
            v1 = v1 + 1;
        end;
    end, 
    reenableLogs = function()
        if _G.__DEV__ then
            v1 = v1 - 1;
            if v1 == 0 then
                v0.log = v2;
                v0.info = v3;
                v0.warn = v4;
                v0.error = v5;
                v0.group = v6;
                v0.groupCollapsed = v7;
                v0.groupEnd = v8;
            end;
            if v1 < 0 then
                v0.error("disabledDepth fell below zero. " .. "This is a bug in React. Please file an issue.");
            end;
        end;
    end
};

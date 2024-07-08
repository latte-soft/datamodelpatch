local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Object_0 = v1.Object;
local v3 = require(l_Parent_0.Shared);
local l_console_0 = v3.console;
local l_errorToString_0 = v3.errorToString;
local l_describeError_0 = v3.describeError;
local function v7()
    return os.clock() * 1000;
end;
local l_setTimeout_0 = v1.setTimeout;
local l_clearTimeout_0 = v1.clearTimeout;
local v10 = false;
local v11 = nil;
local l_None_0 = l_Object_0.None;
local v13 = 15;
local v14 = 0;
local function v15()
    return v14 <= os.clock() * 1000;
end;
local function v16()
end;
local function v18(v17)
    if not (v17 >= 0) or v17 > 125 then
        l_console_0.warn("forceFrameRate takes a positive int between 0 and 125, " .. "forcing frame rates higher than 125 fps is not supported");
        return ;
    elseif v17 > 0 then
        v13 = math.floor(1000 / v17);
        return ;
    else
        v13 = 5;
        return ;
    end;
end;
local function v19()
    if v11 ~= nil then
        local v20 = os.clock() * 1000;
        v14 = v20 + v13;
        local v21 = nil;
        local v22 = nil;
        local function v23()
            if v11(true, v20) then
                task.delay(0, v19);
            else
                v10 = false;
                v11 = nil;
            end;
            return nil;
        end;
        if _G.__YOLO__ then
            if v11(true, v20) then
                task.delay(0, v19);
            else
                v10 = false;
                v11 = nil;
            end;
            v22 = nil;
            v21 = true;
        else
            local v24, v25 = xpcall(v23, l_describeError_0);
            v21 = v24;
            v22 = v25;
        end;
        if not v21 then
            task.delay(0, v19);
            error(l_errorToString_0(v22));
            return ;
        end;
    else
        v10 = false;
    end;
end;
return {
    requestHostCallback = function(v26)
        v11 = v26;
        if not v10 then
            v10 = true;
            task.delay(0, v19);
        end;
    end, 
    cancelHostCallback = function()
        v11 = nil;
    end, 
    requestHostTimeout = function(v27, v28)
        l_None_0 = l_setTimeout_0(function()
            v27(os.clock() * 1000);
        end, v28);
    end, 
    cancelHostTimeout = function()
        l_clearTimeout_0(l_None_0);
        l_None_0 = l_Object_0.None;
    end, 
    shouldYieldToHost = v15, 
    requestPaint = v16, 
    getCurrentTime = v7, 
    forceFrameRate = v18
};

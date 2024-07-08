local l_describeError_0 = require(script.Parent["ErrorHandling.roblox"]).describeError;
local function v11(v1, _, v3, v4, ...)
    local v5 = nil;
    local v6 = nil;
    if _G.__YOLO__ then
        v5 = true;
        if v4 == nil then
            v3(...);
        else
            v3(v4, ...);
        end;
    elseif v4 == nil then
        local v7, v8 = xpcall(v3, l_describeError_0, ...);
        v5 = v7;
        v6 = v8;
    else
        local v9, v10 = xpcall(v3, l_describeError_0, v4, ...);
        v5 = v9;
        v6 = v10;
    end;
    if not v5 then
        v1.onError(v6);
    end;
end;
if _G.__DEV__ then
end;
return v11;

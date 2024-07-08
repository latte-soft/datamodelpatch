local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.ArgCheck);
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_Modules_0.LuaApp.Flags.GetFStringLuaAppUnloadEventEnabledPageNames);
local _ = function(v6)
    local v7 = v5();
    if v7 and #v7 > 0 then
        for _, v9 in string.split(v7, ",") do
            if v9 == v6 then
                return true;
            end;
        end;
    end;
    return false;
end;
return function(v11, v12, v13, v14, v15)
    v3.isType(v12, "string", "eventContext");
    v3.isType(v13, "string", "name");
    local v16 = v5();
    local v17;
    if v16 and #v16 > 0 then
        for _, v19 in string.split(v16, ",") do
            if v19 == v13 then
                v17 = true;
                goto label0 --[[  true, false  ]];
            end;
        end;
    end;
    v17 = false;
    ::label0::;
    if v17 then
        if v14 ~= nil then
            if type(v14) == "number" then
                v14 = tostring(v14);
            end;
            if type(v14) ~= "string" then
                v14 = nil;
            end;
        end;
        v16 = {
            page = v13, 
            detail = v14, 
            locale = l_LocalizationService_0.RobloxLocaleId
        };
        if v15 then
            v16 = v4.Dictionary.join(v16, v15);
        end;
        v11:setRBXEventStream(v12, "luaPageUnload", v16);
    end;
end;

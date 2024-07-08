local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(script.Parent.Parent.Parent.Flags.GetFFlagAddPreviousPageToLuaPageLoad);
return function(v5, v6, v7, v8, v9)
    v3.isType(v6, "string", "eventContext");
    v3.isType(v7, "string", "name");
    if v8 ~= nil then
        if type(v8) == "number" then
            v8 = tostring(v8);
        end;
        if type(v8) ~= "string" then
            v8 = nil;
        end;
    end;
    local v10 = {
        page = v7, 
        detail = v8, 
        locale = l_LocalizationService_0.RobloxLocaleId
    };
    if v4() and v9 ~= nil then
        v10 = v2.Dictionary.join(v10, v9);
    end;
    v5:setRBXEventStream(v6, "luaPageLoad", v10);
end;

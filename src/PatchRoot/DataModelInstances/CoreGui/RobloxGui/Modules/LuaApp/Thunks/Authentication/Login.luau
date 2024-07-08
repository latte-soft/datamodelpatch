local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local v3 = require(l_Modules_0.LuaApp.Thunks.Authentication.LoginByEmail);
local v4 = require(l_Modules_0.LuaApp.Thunks.Authentication.LoginByPhone);
local v5 = require(l_Modules_0.LuaApp.Thunks.Authentication.LoginByUsername);
local v6 = require(l_Modules_0.LuaApp.Util.isStringEmail);
local l_isStringPhone_0 = v2.Utils.isStringPhone;
local v8 = game:GetService("GuiService"):IsTenFootInterface();
return function(v9, v10, v11, v12, v13, v14, v15, v16, v17)
    return function(v18)
        if (not v6(v10) or v17) or v8 then
            if (not l_isStringPhone_0(v10) or v17) or v8 then
                return v18:dispatch(v5(v9, v10, v11, v12, v13, v14, v15));
            else
                return v18:dispatch(v4(v9, v10, v11, v12, v13, v14, v15, v16));
            end;
        else
            return v18:dispatch(v3(v9, v10, v11, v12, v13, v14, v15, v16));
        end;
    end;
end;

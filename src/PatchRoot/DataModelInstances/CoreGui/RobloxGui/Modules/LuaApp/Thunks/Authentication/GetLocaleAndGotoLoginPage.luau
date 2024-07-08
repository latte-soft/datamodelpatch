local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_SetAuthenticationStatus_0 = require(l_CorePackages_0.Workspace.Packages.AuthenticationStatus).Actions.SetAuthenticationStatus;
local v4 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v5 = require(script.Parent.AppStorageUtilities);
local v6 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local v7 = require(l_Modules_0.LuaApp.Thunks.FetchLocale);
local v8 = require(l_Modules_0.LuaApp.AppPage);
local v9 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v10 = require(l_Modules_0.LuaApp.FlagSettings);
return function(v11)
    return function(v12)
        return v7(v11):andThen(function(v13)
            v5.setRobloxLocaleId(v13.signupAndLoginLocale);
            v12:dispatch(l_SetAuthenticationStatus_0(v6.LOGGED_OUT));
            if not v10.WeChatLoginEnabled() then
                if not v10.LuaAppLoginUIEnabled() then
                    v12:dispatch(v9({
                        name = v8.LoginNative
                    }));
                    return ;
                else
                    v12:dispatch(v4({
                        {
                            name = v8.Landing
                        }
                    }));
                    return ;
                end;
            else
                v12:dispatch(v4({
                    {
                        name = v8.WeChatLoginWrapper
                    }
                }));
                return ;
            end;
        end);
    end;
end;

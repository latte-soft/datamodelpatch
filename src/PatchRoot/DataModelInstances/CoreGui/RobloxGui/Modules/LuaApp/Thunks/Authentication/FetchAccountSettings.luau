local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Promise);
local v5 = require(l_Modules_0.LuaApp.AppPage);
local v6 = require(l_Modules_0.LuaApp.Http.Requests.GetAccountInfo);
local l_SetAuthenticationStatus_0 = require(l_CorePackages_0.Workspace.Packages.AuthenticationStatus).Actions.SetAuthenticationStatus;
local v8 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local v9 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v10 = require(l_Modules_0.LuaApp.Thunks.PreloadApplicationData);
return function(v11, v12, v13)
    return function(v14)
        return v6(v11):andThen(function(v15)
            l_Players_0:SetLocalPlayerInfo(v15.responseBody.UserId, v15.responseBody.Username, v15.responseBody.DisplayName, tonumber(v15.responseBody.MembershipType), v15.responseBody.AgeBracket == 1);
            v14:dispatch(l_SetAuthenticationStatus_0(v8.LOGGED_IN));
            v14:dispatch(v9({
                {
                    name = v5.Home
                }
            }));
            v14:dispatch(v10(v11, v12, v13));
            return v4.resolve();
        end, function(v16)
            v14:dispatch(l_SetAuthenticationStatus_0(v8.LOGGED_OUT));
            v14:dispatch(v9({
                {
                    name = v5.WeChatLoginWrapper
                }
            }));
            return v4.reject(v16);
        end);
    end;
end;

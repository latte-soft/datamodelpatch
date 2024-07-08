local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Promise);
local l_AuthenticationProtocol_0 = require(l_CorePackages_0.Workspace.Packages.AuthenticationProtocol).AuthenticationProtocol;
local v4 = require(l_Modules_0.Luobu.Actions.SetMSDKLoginErrMessageKey);
local v5 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v6 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v7 = require(l_Modules_0.LuaApp.AppPage);
local v8 = require(l_Modules_0.Luobu.Thunks.RequestAuthMetaData);
local v9 = require(l_Modules_0.Luobu.Actions.SetMSDKLoginInProgress);
return function(v10, v11, v12, v13)
    return function(v14)
        local l_default_0 = l_AuthenticationProtocol_0.default;
        local v16 = nil;
        local v17 = nil;
        if not v13.useMSDKWebAuthentication() then
            local v18, v19 = l_default_0:requestAuth(l_AuthenticationProtocol_0.AuthProviders.MSDK, v11):await();
            v16 = v18;
            v17 = v19;
        else
            local v20, v21 = v14:dispatch(v8(v12, v10, v11)):await();
            if v20 then
                v14:dispatch(v5({
                    name = v7.GenericWebPage, 
                    detail = v21.loginPage, 
                    extraProps = {
                        titleKey = "Authentication.Login.QrCodeLoginTitle", 
                        onClose = function()
                            v14:dispatch(v9(false));
                        end
                    }
                }));
                local v22, v23 = l_default_0:listenWebAuthResponset(l_AuthenticationProtocol_0.AuthProviders.MSDK):await();
                v16 = v22;
                v17 = v23;
            else
                v14:dispatch(v9(false));
                return ;
            end;
        end;
        if v16 then
            if v17.statusCode == 0 then
                return v2.resolve(v17.tokenAuthBody);
            else
                v10.Diag:reportCounter("RequestMSDKLoginReturnErrorCode_" .. v17.statusCode, 1);
            end;
        end;
        if v13.useMSDKWebAuthentication() then
            v14:dispatch(v6());
        end;
        v14:dispatch(v4(v17.errMessageKey));
        v10.Diag:reportCounter("RequestMSDKLoginAuthenticationProtocolFailure", 1);
        return v2.reject();
    end;
end;

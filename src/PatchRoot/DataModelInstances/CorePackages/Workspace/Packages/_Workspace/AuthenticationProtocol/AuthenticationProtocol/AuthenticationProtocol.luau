local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Promise);
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v3 = require(l_Parent_0.t);
local _ = require(script.Parent.AuthenticationProtocolTypes);
local v5 = {
    MSDK = "MSDK"
};
local v6 = {
    PC = "Win32", 
    Mac = "MacOS", 
    Android = "Android", 
    IOS = "iOS"
};
local v7 = {
    WECHAT = "WeChat", 
    QQ = "QQ", 
    NONE = "None"
};
local v8 = {
    eFlag_Succ = 0, 
    eFlag_QQ_UserCancel = 1001, 
    eFlag_QQ_LoginFail = 1002, 
    eFlag_QQ_NetworkErr = 1003, 
    eFlag_QQ_NotInstall = 1004, 
    eFlag_QQ_NotSupportApi = 1005, 
    eFlag_WX_NotInstall = 2000, 
    eFlag_WX_NotSupportApi = 2001, 
    eFlag_WX_UserCancel = 2002, 
    eFlag_WX_LoginFail = 2004, 
    eFlag_Need_Realname_Auth = 3005, 
    eFlag_Need_MSDK_Realname_Auth = 3006, 
    eFlag_Local_Invalid = -2
};
local v9 = {
    [v5.MSDK] = {
        [v8.eFlag_Succ] = "", 
        [v8.eFlag_WX_NotInstall] = "Authentication.Login.WeChat.NotInstalled", 
        [v8.eFlag_WX_NotSupportApi] = "Authentication.Login.Label.WeChatVersionNotSupported", 
        [v8.eFlag_WX_UserCancel] = "Authentication.Login.Label.WeChatUserCancel", 
        [v8.eFlag_WX_LoginFail] = "Authentication.Login.Response.TencentLoginFailurePleaseTryAgain", 
        [v8.eFlag_QQ_UserCancel] = "Authentication.Login.Label.QQUserCancel", 
        [v8.eFlag_QQ_LoginFail] = "Authentication.Login.Response.TencentLoginFailurePleaseTryAgain"
    }
};
local v10 = {
    [v5.MSDK] = "Authentication.Login.Response.TencentLoginFailurePleaseTryAgain"
};
local v11 = {
    AuthProviders = v5, 
    AuthMethods = v7, 
    AUTH_REQUEST_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("Authentication", "authRequest"), 
        validateParams = v3.strictInterface({
            authProvider = v3.valueOf(v5), 
            authMethod = v3.valueOf(v7)
        })
    }, 
    AUTH_RESPONSE_DESCRIPTORS = {
        [v5.MSDK] = {
            mid = l_MessageBus_0.getMessageId("Authentication", "MSDKAuthResponse"), 
            validateParams = v3.strictInterface({
                platform = v3.valueOf(v6), 
                status = v3.number, 
                tokenAuthBody = v3.optional(v3.strictInterface({
                    openId = v3.string, 
                    accessToken = v3.string, 
                    refreshToken = v3.string, 
                    accessTokenExpiry = v3.number, 
                    refreshTokenExpiry = v3.number, 
                    channelId = v3.number
                }))
            })
        }
    }
};
v11.__index = v11;
v11.new = function()
    return (setmetatable({
        subscriber = l_MessageBus_0.Subscriber.new()
    }, v11));
end;
v11.requestAuth = function(v12, v13, v14)
    local v20 = v1.new(function(v15, _)
        local v17 = v12.AUTH_RESPONSE_DESCRIPTORS[v13];
        v12.subscriber:subscribe(v17, function(v18)
            v12.subscriber:unsubscribe(v17);
            local v19 = nil;
            if v13 == v12.AuthProviders.MSDK then
                v19 = {
                    statusCode = v18.status, 
                    tokenAuthBody = v18.tokenAuthBody, 
                    errMessageKey = v9[v13][v18.status] or v10[v13]
                };
            end;
            v15(v19);
        end);
    end);
    l_MessageBus_0.publish(v12.AUTH_REQUEST_DESCRIPTOR, {
        authProvider = v13, 
        authMethod = v14
    });
    return v20;
end;
v11.listenWebAuthResponset = function(v21, v22)
    return (v1.new(function(v23, _)
        local v25 = v21.AUTH_RESPONSE_DESCRIPTORS[v22];
        v21.subscriber:subscribe(v25, function(v26)
            v21.subscriber:unsubscribe(v25);
            local v27 = nil;
            if v22 == v21.AuthProviders.MSDK then
                v27 = {
                    statusCode = v26.status, 
                    tokenAuthBody = v26.tokenAuthBody, 
                    errMessageKey = v9[v22][v26.status] or v10[v22]
                };
            end;
            v23(v27);
        end);
    end));
end;
v11.default = v11.new();
return v11;

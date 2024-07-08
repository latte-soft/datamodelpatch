local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Util.Base64);
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.Promise);
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local function _()
    return string.format("%sv1/passkey/FinishRegistration", l_Url_0.AUTH_URL);
end;
local function v13(v9, v10)
    return v9(string.format("%sv1/passkey/FinishRegistration", l_Url_0.AUTH_URL), "POST", {
        postBody = v10
    }):andThen(function(v11)
        return v3.resolve(v11);
    end, function(v12)
        return v3.reject({
            body = if type(v12) == "table" then l_HttpService_0:JSONEncode(v12) else nil, 
            name = "backendCreationError"
        });
    end);
end;
local function _()
    return string.format("%sv1/passkey/StartRegistration", l_Url_0.AUTH_URL);
end;
local function v18(v15)
    return v15(string.format("%sv1/passkey/StartRegistration", l_Url_0.AUTH_URL), "POST"):andThen(function(v16)
        assert(v16 and #v16 > 0, "no passkey challenge");
        assert(v16[1].creationOptions, "passkey creation options missing");
        assert(v16[1].sessionId, "sessionId missing");
        return v3.resolve(v16[1]);
    end, function(v17)
        return v3.reject({
            body = if type(v17) == "table" then l_HttpService_0:JSONEncode(v17) else nil, 
            name = "backendCreationError"
        });
    end);
end;
return function(v19)
    return v18(v19):andThen(function(v20)
        local v21 = l_HttpService_0:JSONDecode(v20.creationOptions);
        local l_sessionId_0 = v20.sessionId;
        local v23 = tonumber(v21.publicKey.timeout);
        v21.keyType = "platform";
        v21.deviceBoundOnly = true;
        if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Android then
            v21.publicKey.challenge = v1.FromUrlSafeBase64(v21.publicKey.challenge);
            v21.publicKey.user.id = v1.FromUrlSafeBase64(v21.publicKey.user.id);
        end;
        return l_default_0:registerCredentials(l_default_0.CredentialsTypes.FIDO2, l_HttpService_0:JSONEncode(v21), v23 / 1000):andThen(function(v24)
            local v25 = l_HttpService_0:JSONDecode(v24);
            if not (v25 ~= nil) or next(v25) == nil then
                return v3.reject({
                    name = "userOSDialogError"
                });
            elseif v25.errorCode ~= nil then
                l_Logger_0:warning("Passkey credential signing failed. Error {} ({}) returned.", v25.errorCode, v25.errorMsg);
                return v3.reject({
                    body = v25.errorMsg, 
                    name = "userOSDialogError"
                });
            else
                v25.id = v1.ToUrlSafeBase64(v25.id);
                v25.rawId = v1.ToUrlSafeBase64(v25.rawId);
                v25.response.attestationObject = v1.ToUrlSafeBase64(v25.response.attestationObject);
                v25.response.clientDataJSON = v1.ToUrlSafeBase64(v25.response.clientDataJSON);
                return v13(v19, (l_HttpService_0:JSONEncode({
                    sessionId = l_sessionId_0, 
                    credentialNickname = "Passkey", 
                    attestationResponse = l_HttpService_0:JSONEncode(v25)
                })));
            end;
        end, function(v26)
            return v3.reject({
                body = v26, 
                name = "userOSDialogError"
            });
        end);
    end, function(v27)
        if not (type(v27) == "table") or not v27.name then
            return v3.reject({
                body = v27, 
                name = "backendCreationError"
            });
        else
            return v3.reject(v27);
        end;
    end);
end;

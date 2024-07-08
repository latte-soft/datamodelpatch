local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Modules_0.LuaApp.Http.Url);
local v3 = require(l_Modules_0.LuaApp.Enum.CredentialType);
return function(v4, v5, v6, v7)
    local v8 = true;
    if v5 ~= v3.Email then
        v8 = v5 == v3.PhoneNumber;
    end;
    assert(v8, "AuthVerifyCredentials request expects credentialType to be a Email or PhoneNumber");
    assert(type(v6) == "string", "AuthVerifyCredentials request expects credentialType to be a string");
    assert(type(v7) == "string", "AuthVerifyCredentials request expects password to be a string");
    return v4(string.format("%sv2/credentials/verification/send", v2.AUTH_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            credentialType = v5, 
            credentialValue = v6, 
            password = v7
        })
    });
end;

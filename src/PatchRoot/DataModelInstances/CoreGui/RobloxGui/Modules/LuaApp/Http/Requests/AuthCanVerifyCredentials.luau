local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
local v2 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v3 = require(l_Modules_0.LuaApp.Enum.CredentialType);
local v4 = v2.new({
    base = v1.AUTH_URL, 
    path = "v2/credentials/verification", 
    query = "{credentialType}&{credentialValue}&{password}"
});
return function(v5, v6, v7, v8)
    local v9 = true;
    if v6 ~= v3.Email then
        v9 = v6 == v3.PhoneNumber;
    end;
    assert(v9, "AuthCanVerifyCredentials request expects credentialType to be a Email or PhoneNumber");
    assert(type(v7) == "string", "AuthCanVerifyCredentials request expects credentialType to be a string");
    assert(type(v8) == "string", "AuthCanVerifyCredentials request expects password to be a string");
    return v5(v4({
        credentialType = v6, 
        credentialValue = v7, 
        password = v8
    }), "GET");
end;

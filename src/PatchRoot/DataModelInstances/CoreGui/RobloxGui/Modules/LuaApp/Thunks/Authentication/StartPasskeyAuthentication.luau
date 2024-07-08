local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Promise);
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
local function _()
    return string.format("%sv1/passkey/StartAuthentication", l_Url_0.AUTH_URL);
end;
return function(v5)
    return function(_)
        return v5(string.format("%sv1/passkey/StartAuthentication", l_Url_0.AUTH_URL), "POST"):andThen(function(v7)
            assert(v7 and #v7 > 0, "no passkey challenge");
            assert(v7[1].authenticationOptions, "passkey authentication options missing");
            assert(v7[1].sessionId, "sessionId missing");
            return v7[1];
        end, function(v8)
            return v2.reject({
                errorCode = l_HttpService_0:JSONDecode(v8.Body).errors[1].code
            });
        end);
    end;
end;

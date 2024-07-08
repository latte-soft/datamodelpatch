local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Promise);
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
local function _()
    return string.format("%sv2/user/passwords/change", l_Url_0.AUTH_URL);
end;
return function(v5, v6)
    return v5(string.format("%sv2/user/passwords/change", l_Url_0.AUTH_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            currentPassword = nil, 
            newPassword = v6
        })
    }):andThen(function(v7)
        return v2.resolve(v7);
    end, function(v8)
        return v2.reject(v8);
    end);
end;

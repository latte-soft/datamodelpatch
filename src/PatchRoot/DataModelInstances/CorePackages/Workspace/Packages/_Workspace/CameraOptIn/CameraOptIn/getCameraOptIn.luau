local l_CorePackages_0 = game:GetService("CorePackages");
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
local v2 = require(l_CorePackages_0.Promise);
local _ = require(l_CorePackages_0.Packages.LuauPolyfill);
local v4 = nil;
return function(v5, v6)
    assert(type(v6) == "boolean", "GetCameraOptIn request expects invalidateCache to be a boolean");
    local v7 = string.format("%s/v1/settings/avatar", l_Url_0.VOICE_URL);
    local v8 = if v4 ~= nil then v4:getStatus() else nil;
    if not v6 then
        if v4 and v8 ~= v2.Status.Cancelled then
            return v4;
        end;
    elseif v8 == v2.Status.Started then
        return v4;
    end;
    v4 = v5(v7, "GET"):andThen(function(v9)
        local l_responseBody_0 = v9.responseBody;
        if l_responseBody_0 then
            return v2.resolve(l_responseBody_0.isAvatarVideoOptIn);
        else
            return v2.reject("Unexpected response fetching cameraOptIn settings");
        end;
    end, function(v11)
        return v2.reject(v11);
    end);
    return v4;
end;

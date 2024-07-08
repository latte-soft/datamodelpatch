local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck);
return function(v3, v4)
    v2.isType(v4, "boolean", "PostAgeVerificationOptOutCheckbox request expects showOverlay to be a boolean");
    return v3(string.format("%s/v1/settings/verify/show-overlay", v0.VOICE_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            showOverlay = v4
        })
    });
end;

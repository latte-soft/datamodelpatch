local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local v2 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.httpRequest);
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
local l_game_EngineFeature_0 = game:GetEngineFeature("ClientAvatarUsesColor3sForBodyParts");
local v5 = v2(l_HttpRbxApiService_0);
return function(v6)
    local _ = nil;
    return v5(if not l_game_EngineFeature_0 then string.format("%s/v1/outfits/%s/details", l_Url_0.AVATAR_URL, (tostring(v6))) else string.format("%s/v3/outfits/%s/details", l_Url_0.AVATAR_URL, (tostring(v6))), "GET"):andThen(function(v8)
        return v8.responseBody.name;
    end);
end;

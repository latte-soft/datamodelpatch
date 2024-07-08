local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = v4.UiMode;
local v7 = require(l_Modules_0.Personalization.OmniFeed.FeedViews.OmniFeedViewLoadMore);
local v8 = require(l_Modules_0.Personalization.OmniFeed.FeedViews.OmniFeedViewAnimated);
local v9 = game:DefineFastFlag("EnableAnimatedOmniFeed", false);
return function(v10)
    local v11 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    if not v9 or not v11 then
        return v2.createElement(v7, v10);
    else
        return v2.createElement(v8, (v3.Dictionary.join(v10, {
            loadNext = v3.None, 
            hasNextPage = v3.None
        })));
    end;
end;

local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_Modules_0.LuaApp.Actions.Games.AddOmniRecommendations);
local _ = require(l_Modules_0.Personalization.DataStoreTypes);
local v5 = require(l_Modules_0.LuaApp.Constants);
local v6 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local v7 = require(l_CorePackages_0.Logging);
local v8 = require(l_Modules_0.Personalization.Flags.getFFlagLuaAppHomePartialOmniResponse);
return function(v9, v10)
    v9 = v9 or {};
    if v10.type == v3.name then
        for v11, v12 in pairs(v10.recommendations) do
            if v11 == v5.OmniRecommendationsPageType.PAGE_TYPE_HOME then
                assert(v11 == v12.pageType);
                if v12.globalLayoutData then
                    if not v8() and v10.isAppend or v8() and v10.omniResponseType == v6.OmniResponseType.Append then
                        v9 = v2.Dictionary.join(v9, v12.globalLayoutData);
                    elseif v8() and v10.omniResponseType == v6.OmniResponseType.PartialFeed then
                        v7.warn("globalLayoutData from omni-recommendations partial feed is not supported");
                    else
                        v9 = v2.Dictionary.join({}, v12.globalLayoutData);
                    end;
                end;
            end;
        end;
    end;
    return v9;
end;

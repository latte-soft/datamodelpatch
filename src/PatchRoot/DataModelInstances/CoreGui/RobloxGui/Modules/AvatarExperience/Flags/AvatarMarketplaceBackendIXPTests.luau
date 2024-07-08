local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v2 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v3 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagLooksIXPLogging);
local v4 = game:DefineFastString("WidgetLayer", "AvatarMarketplace.WidgetPlatform");
local function v6(v5)
    return v2.defineIXPTest({
        name = v5 .. "DummyTest", 
        layer = v5, 
        recordExposure = false, 
        getDependentFlagsEnabled = function()
            return true;
        end, 
        getEnabledFlag = function()
            return true;
        end, 
        getEnabledForAllFlag = function()
            return false;
        end, 
        variables = {}
    });
end;
return {
    Editor = v6(v1.AvatarMarketplaceEditor), 
    RelevanceRecommendations = v6("AvatarMarketplace.RelevanceRecommendations"), 
    RecommendationsAndSearch = v6(v1.AvatarMarketplaceDefaultRecSearchLayer), 
    ItemDetailsPage = v6(v1.AvatarMarketplaceItemDetailsPage), 
    Widgets = v6(v4), 
    SearchWidgets = if not v3() then nil else v6("AvatarMarketplace.SearchPageWidgetPlatform"), 
    Sorts = if not v3() then nil else v6("AvatarMarketplace.Sorts")
};

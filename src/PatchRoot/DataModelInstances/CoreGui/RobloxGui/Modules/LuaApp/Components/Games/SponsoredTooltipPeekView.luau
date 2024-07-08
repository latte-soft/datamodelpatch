local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_InfoPeekView_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).InfoPeekView;
return function()
    local v4 = l_useLocalization_0({
        SponsoredTitle = "CoreScripts.Ads.Label.SponsoredAds", 
        SponsoredDisclosure = "CoreScripts.Ads.Label.SponsoredAdsDisclosureStatic"
    });
    return v1.createElement(l_InfoPeekView_0, {
        title = v4.SponsoredTitle, 
        body = v4.SponsoredDisclosure
    });
end;

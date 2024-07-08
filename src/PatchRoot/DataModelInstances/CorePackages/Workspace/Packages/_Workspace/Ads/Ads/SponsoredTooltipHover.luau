local l_Parent_0 = script:FindFirstAncestor("Ads").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_IconWithTooltip_0 = require(l_Parent_0.AppBlox).IconWithTooltip;
return function(v5)
    return v2.createElement(l_IconWithTooltip_0, v1.Dictionary.join(v5, {
        hoverText = l_useLocalization_0({
            SponsoredDisclosure = "CoreScripts.Ads.Label.SponsoredAdsDisclosureStatic"
        }).SponsoredDisclosure, 
        triggerPointName = "SponsoredTooltip"
    }));
end;

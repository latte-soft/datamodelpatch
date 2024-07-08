local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local _ = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.AvatarExperienceDeps);
local l_Common_0 = l_Modules_0.AvatarExperience.Common;
local _ = require(l_Common_0.Types);
local v7 = require(l_Common_0.Components.ItemDetails.ItemImageFrame);
local v8 = require(l_Common_0.Components.ItemDetails.ExperienceDetails);
local v9 = require(l_Common_0.Components.ItemDetails.NameLabel);
local _ = require(l_Common_0.Models.CollectibleInfo);
local l_FitFrameVertical_0 = v4.RoactFitComponents.FitFrameVertical;
return function(v12)
    return v2.createElement(l_FitFrameVertical_0, {
        width = UDim.new(1, 0), 
        contentPadding = UDim.new(0, 12), 
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        BackgroundTransparency = 1, 
        LayoutOrder = 1
    }, {
        NameLabel = v2.createElement(v9, {
            name = v12.name, 
            showPremiumBenefits = v12.showPremiumBenefits, 
            actionBarHeaderRef = v12.actionBarHeaderRef
        }), 
        ExperienceDetails = v2.createElement(v8, {
            itemType = v12.itemType, 
            itemId = v12.itemId
        }), 
        ItemImageFrame = v2.createElement(v7, {
            width = v12.width, 
            itemType = v12.itemType, 
            itemId = v12.itemId, 
            itemSubType = v12.itemSubType, 
            itemDetailsPeekViewRefs = v12.itemDetailsPeekViewRefs, 
            resultsListRef = v12.resultsListRef
        })
    });
end;

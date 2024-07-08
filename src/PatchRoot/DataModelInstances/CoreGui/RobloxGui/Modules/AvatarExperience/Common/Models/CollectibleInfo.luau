local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_MockId_0 = require(l_CorePackages_0.Workspace.Packages.UnitTestHelpers).MockId;
local v3 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v4 = require(l_Modules_0.AvatarExperience.Flags.GetAXInExperienceItemLinking);
return {
    mock = function()
        return {
            collectibleItemId = l_MockId_0(), 
            collectibleProductId = l_MockId_0(), 
            name = "", 
            description = "", 
            creator = {
                id = l_MockId_0(), 
                name = "", 
                type = "", 
                targetId = ""
            }, 
            price = 1, 
            lowestPrice = 0, 
            unitsAvailableForConsumption = 0, 
            offsaleDeadline = "", 
            assetStock = 0, 
            recentAveragePrice = 0, 
            saleLocationType = "ShopAndAllExperiences", 
            quantityLimitPerUser = 0, 
            resaleRestriction = v3.ResaleRestriction.None
        };
    end, 
    fromGetCollectibleItemData = function(v5)
        return {
            collectibleItemId = v5.collectibleItemId, 
            collectibleProductId = v5.collectibleProductId, 
            name = v5.name, 
            description = v5.description, 
            creator = {
                id = v5.creatorId, 
                name = v5.creatorName, 
                type = v5.creatorType, 
                targetId = v5.creatorTargetId
            }, 
            price = v5.price, 
            lowestPrice = v5.lowestPrice, 
            unitsAvailableForConsumption = v5.unitsAvailableForConsumption, 
            offsaleDeadline = v5.offsaleDeadline, 
            assetStock = v5.assetStock, 
            saleLocationType = v5.saleLocationType, 
            quantityLimitPerUser = v5.quantityLimitPerUser, 
            experiences = if not v4() then nil else v5.experiences, 
            resaleRestriction = v5.resaleRestriction
        };
    end, 
    fromGetResellers = function(v6)
        return {
            hasResellers = #v6 > 0
        };
    end, 
    fromGetResaleData = function(v7)
        return {
            recentAveragePrice = v7.recentAveragePrice
        };
    end
};

local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Rodux);
local l_Parent_0 = script.Parent;
local v4 = require(l_Parent_0.AvatarType);
local v5 = require(l_Parent_0.AvatarScales);
local v6 = require(l_Parent_0.BodyColors);
local v7 = require(l_Parent_0.BodyPartRangeIds);
local v8 = require(l_Parent_0.BodyColor3s);
local v9 = require(l_Parent_0.OwnedItemIdsBySubtype);
local v10 = require(l_Parent_0.EquippedAssets);
local v11 = require(l_Parent_0.OutfitOrAsset);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return v2.combineReducers({
    AvatarType = v4, 
    AvatarScales = v5, 
    BodyColors = v6, 
    BodyColor3s = v8, 
    BodyPartRangeIds = v7, 
    OwnedItemIdsBySubtype = v9, 
    EquippedAssets = v10, 
    OutfitOrAsset = v11
});

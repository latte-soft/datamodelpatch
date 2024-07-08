local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Rodux);
local v2 = require(l_Modules_0.AvatarExperience.Common.Reducers.AssetInfos);
local v3 = require(l_Modules_0.AvatarExperience.Common.Reducers.BundleInfos);
local v4 = require(l_Modules_0.AvatarExperience.Common.Reducers.Collectibles);
local v5 = require(l_Modules_0.AvatarExperience.Common.Reducers.ItemDetailsExpanded);
local v6 = require(l_Modules_0.AvatarExperience.Common.Reducers.ItemDetailsPeekView);
local v7 = require(l_Modules_0.AvatarExperience.Common.Reducers.AvatarExperienceLoaded);
local v8 = require(l_Modules_0.AvatarExperience.Common.Reducers.PlayEmoteInBackground);
local v9 = require(l_Modules_0.AvatarExperience.Common.Reducers.FullView);
local v10 = require(l_Modules_0.AvatarExperience.Common.Reducers.Widgets);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return v1.combineReducers({
    AssetInfos = v2, 
    BundleInfos = v3, 
    Collectibles = v4, 
    ItemDetailsExpanded = v5, 
    ItemDetailsPeekView = v6, 
    AvatarExperienceLoaded = v7, 
    PlayEmoteInBackground = v8, 
    FullView = v9, 
    Widgets = v10
});

local v0 = require(game:GetService("CorePackages").Rodux);
local l_Parent_0 = script.Parent;
return v0.combineReducers({
    Character = require(l_Parent_0.Character), 
    TryOn = require(l_Parent_0.TryOn), 
    AvatarRoute = require(l_Parent_0.AvatarRoute), 
    OutfitTryOn = require(l_Parent_0.OutfitTryOn), 
    Looks = require(l_Parent_0.Looks), 
    LastSavedTriedOnOutfit = require(l_Parent_0.LastSavedTriedOnOutfit)
});

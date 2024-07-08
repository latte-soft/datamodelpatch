local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
return require(game:GetService("CorePackages").Rodux).combineReducers({
    AvatarEditor = require(l_Modules_0.AvatarExperience.AvatarEditor.Reducers.AvatarEditor), 
    Catalog = require(l_Modules_0.AvatarExperience.Catalog.Reducers.Catalog), 
    ProfilePictureEditor = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Reducers.ProfilePictureEditor), 
    Common = require(l_Modules_0.AvatarExperience.Common.Reducers.Common), 
    AvatarScene = require(l_Modules_0.AvatarExperience.Common.Reducers.AvatarScene), 
    ExternalNavigationRequest = require(l_Modules_0.AvatarExperience.Common.Reducers.ExternalNavigationRequest), 
    AvatarAutocompleteSuggestions = require(l_Modules_0.AvatarExperience.Catalog.Reducers.AvatarAutocompleteSuggestions), 
    AccessoryAdjustment = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Reducers.AccessoryAdjustment), 
    LayeredClothingSort = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Reducers.LayeredClothingSort), 
    CameraButton = require(l_Modules_0.AvatarExperience.Common.Reducers.CameraButton)
});

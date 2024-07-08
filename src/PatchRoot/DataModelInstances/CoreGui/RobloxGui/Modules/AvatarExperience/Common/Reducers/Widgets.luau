local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
return require(l_CorePackages_0.Rodux).combineReducers({
    WidgetInfo = require(l_Modules_0.AvatarExperience.Common.Reducers.WidgetInfo), 
    SearchPageWidgetInfo = require(l_Modules_0.AvatarExperience.Common.Reducers.SearchPageWidgetInfo), 
    ContextWidgetInfo = if not require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXWidgetsByContext)() then nil else require(l_Modules_0.AvatarExperience.Common.Reducers.ContextWidgetInfo), 
    HydratedWidgetData = require(l_Modules_0.AvatarExperience.Common.Reducers.HydratedWidgetData)
});

local v0 = require(game:GetService("CorePackages").Rodux);
local l_Parent_0 = script.Parent;
return v0.combineReducers({
    ProfilePictureParams = require(l_Parent_0.ProfilePictureParams), 
    PeekabooLayoutDetails = require(l_Parent_0.PeekabooLayoutDetails), 
    CameraSliders = require(l_Parent_0.CameraSliders), 
    FinalPageViewMode = require(l_Parent_0.FinalPageViewMode)
});

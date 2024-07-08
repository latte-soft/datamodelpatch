local v0 = require(game:GetService("CorePackages").Rodux);
local l_Parent_0 = script.Parent;
return v0.combineReducers({
    AdjustmentInfo = require(l_Parent_0.AdjustmentInfo), 
    AdjustmentTypeSelected = require(l_Parent_0.AdjustmentTypeSelected), 
    SelectedAccessory = require(l_Parent_0.SelectedAccessory), 
    AdjustmentSliders = require(l_Parent_0.AdjustmentSliders)
});

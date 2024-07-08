local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Rodux);
local l_Actions_0 = script.Parent.Parent.Actions;
local v4 = require(l_Actions_0.FocusSegment);
local v5 = require(l_Actions_0.HideMenu);
local v6 = {
    focusedSegmentIndex = 0
};
return v2.createReducer(v6, {
    [v4.name] = function(v7, v8)
        return v1.Dictionary.join(v7, {
            focusedSegmentIndex = v8.segmentIndex
        });
    end, 
    [v5.name] = function(v9, _)
        return v1.Dictionary.join(v9, v6);
    end
});

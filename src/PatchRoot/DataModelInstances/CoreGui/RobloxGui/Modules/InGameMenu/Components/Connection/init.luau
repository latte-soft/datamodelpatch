local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_t_0 = v0.t;
local v3 = require(script.FriendStatusConnector);
local v4 = require(script.LastInputTypeConnector);
local v5 = require(script.MouseOverrideManager);
local v6 = require(script.FocusHighlightManager);
local v7 = require(script.VideoRecordConnector);
local v8 = require(script.NativeCloseEventConnector);
local v9 = require(script.Parent.Parent.InGameMenuPolicy);
local v10 = l_t_0.strictInterface({
    isEducationalPopupEnabled = l_t_0.optional(l_t_0.boolean)
});
return v9.connect(function(v11, _)
    return {
        isEducationalPopupEnabled = v11.enableEducationalPopup()
    };
end)(function(v13)
    assert(v10);
    return l_Roact_0.createFragment({
        FriendStatusConnector = l_Roact_0.createElement(v3), 
        LastInputTypeConnector = l_Roact_0.createElement(v4), 
        MouseOverrideManager = l_Roact_0.createElement(v5), 
        FocusHighlightManager = l_Roact_0.createElement(v6), 
        VideoRecordConnector = l_Roact_0.createElement(v7), 
        NativeCloseEventConnector = not not v13.isEducationalPopupEnabled and l_Roact_0.createElement(v8) or nil
    });
end);

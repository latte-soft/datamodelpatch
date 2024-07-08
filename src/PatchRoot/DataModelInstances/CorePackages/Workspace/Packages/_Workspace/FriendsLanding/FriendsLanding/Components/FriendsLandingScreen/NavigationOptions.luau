local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Roact_0 = require(l_script_FirstAncestor_0.dependencies).Roact;
local v2 = require(l_script_FirstAncestor_0.Enums.LocalizedKeys);
local v3 = require(l_script_FirstAncestor_0.Components.HeaderBarRightView);
local v4 = require(l_script_FirstAncestor_0.Components.HeaderBarCenterView);
local v5 = require(l_script_FirstAncestor_0.Flags.getFFlagNewHeaderBarForFriendsLandingEnabled);
return function(v6)
    return {
        headerText = {
            raw = v2.FriendsHeader.rawValue(), 
            shouldLocalize = true
        }, 
        useSecondaryHeader = not not v5() or nil, 
        shouldExitNavigation = false, 
        tabBarVisible = false, 
        renderRight = function()
            return l_Roact_0.createElement(v3, v6);
        end, 
        renderCenter = function()
            return l_Roact_0.createElement(v4, v6);
        end, 
        transparent = true, 
        absorbInputSelectable = false
    };
end;

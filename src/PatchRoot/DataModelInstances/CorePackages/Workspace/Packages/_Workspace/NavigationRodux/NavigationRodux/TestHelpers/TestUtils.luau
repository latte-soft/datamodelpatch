local l_script_FirstAncestor_0 = script:FindFirstAncestor("NavigationRodux");
local v1 = require(l_script_FirstAncestor_0.Parent.Navigation);
local l_getCurrentRouteState_0 = v1.getCurrentRouteState;
local _ = require(l_script_FirstAncestor_0.types);
local l_getLegacyRouteFromRoactNavigationState_0 = require(l_script_FirstAncestor_0.Utils).getLegacyRouteFromRoactNavigationState;
return {
    createMockReducerStateFromRouteState = function(v5)
        return {
            history = {
                (l_getLegacyRouteFromRoactNavigationState_0(v5))
            }, 
            currentRoute = l_getCurrentRouteState_0({
                state = v5
            }), 
            roactNavigationState = v5, 
            lockNavigationActions = false, 
            backNavigationDisableCounter = 0
        };
    end, 
    createMockStackState = v1.TestUtils.createMockStackState, 
    createMockSwitchState = v1.TestUtils.createMockSwitchState, 
    createMockScreenState = v1.TestUtils.createMockScreenState
};

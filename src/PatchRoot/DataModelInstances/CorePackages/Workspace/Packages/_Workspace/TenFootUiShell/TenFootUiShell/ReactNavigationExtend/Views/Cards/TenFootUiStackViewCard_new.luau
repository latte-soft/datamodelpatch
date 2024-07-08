local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ReactNavigationExtend_0 = l_script_FirstAncestor_0.ReactNavigationExtend;
local v3 = require(l_Parent_0.React);
local _ = require(l_ReactNavigationExtend_0.Views.RouteViewState);
local v5 = require(l_ReactNavigationExtend_0.Hooks.useStackAnimation_new);
local v6 = require(l_ReactNavigationExtend_0.Views.Cards.TenFootUiBaseViewCard_new);
local _ = require(l_Parent_0.TenFootUiCommon);
local _ = require(l_Parent_0.Navigation);
return function(v9)
    local v10 = v5({
        isTopOfStack = v9.isTopOfStack, 
        totalInStack = v9.totalInStack, 
        viewState = v9.viewState, 
        onAnimationComplete = v9.onAnimationComplete
    });
    return v3.createElement(v6, {
        descriptor = v9.descriptor, 
        screenProps = v9.screenProps, 
        navigation = v9.navigation, 
        isActiveCard = v9.isTopOfStack, 
        isVisible = v10.isVisible, 
        adorneeCFrame = v10.cFrame, 
        groupTransparency = v10.transparency
    });
end;

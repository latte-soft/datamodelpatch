local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ReactNavigationExtend_0 = l_script_FirstAncestor_0.ReactNavigationExtend;
local v3 = require(l_Parent_0.React);
local _ = require(l_Parent_0.Navigation);
local v5 = require(l_ReactNavigationExtend_0.Views.RouteViewState);
local v6 = require(l_ReactNavigationExtend_0.Views.Cards.TenFootUiStackViewCard_new);
local _ = require(l_Parent_0.TenFootUiCommon);
local v8 = require(l_ReactNavigationExtend_0.Hooks.useStackScreens_new);
local l_FFlagUnifyNavigationGraph_0 = require(l_Parent_0.SharedFlags).FFlagUnifyNavigationGraph;
return function(v10)
    local l_descriptors_0 = v10.descriptors;
    local l_navigation_0 = v10.navigation;
    local l_state_0 = l_navigation_0.state;
    local l_key_0 = l_state_0.routes[l_state_0.index].key;
    local v15 = v8({
        navigation = l_navigation_0, 
        descriptors = l_descriptors_0
    });
    local v16 = {};
    for _, v18 in v15, nil, nil do
        v16[v18.descriptor.key] = v3.createElement(v6, {
            descriptor = v18.descriptor, 
            screenProps = v10.screenProps, 
            navigation = l_navigation_0, 
            isTopOfStack = v18.descriptor.key == l_key_0, 
            totalInStack = l_state_0.index, 
            viewState = v18.viewState, 
            onAnimationComplete = function()
                if not (v18.viewState ~= v5.ViewState.Opening) or l_FFlagUnifyNavigationGraph_0 and v18.viewState == v5.ViewState.Opened then
                    v18.setOpened();
                    return ;
                else
                    if v18.viewState == v5.ViewState.Closing then
                        v18.setClosed();
                    end;
                    return ;
                end;
            end
        });
    end;
    return v16;
end;

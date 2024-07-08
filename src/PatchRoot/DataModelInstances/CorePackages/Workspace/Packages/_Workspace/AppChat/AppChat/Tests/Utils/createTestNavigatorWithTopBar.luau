local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactNavigation);
local v3 = require(l_Parent_0.Roact);
local l_mountFrameWithTopBar_0 = require(l_script_FirstAncestor_0.Tests.MountFrameHelpers).mountFrameWithTopBar;
local v5 = require(l_script_FirstAncestor_0.TopBarContext);
local v6 = require(l_script_FirstAncestor_0.configureTopBarWithNavigationOptions);
local v7 = require(l_script_FirstAncestor_0.getRoactChatStackNavigator);
return function(v8, v9)
    local v10 = v2.createRobloxStackNavigator(v9.navigator);
    local v11 = v3.Component:extend("testNavigatorConnector");
    v11.router = v10.router;
    v11.render = function(v12)
        return v3.createFragment({
            layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            testButton = v3.createElement("TextButton", {
                LayoutOrder = -2, 
                Size = UDim2.new(0, 100, 0, 20), 
                Text = "test button", 
                [v3.Event.Activated] = function()
                    v12.props.navigation.navigate(v9.testRoute, v9.testRouteParams);
                end
            }), 
            topBar = v6(v12.props.navigation), 
            testNavigator = v3.createElement(v10, v12.props)
        });
    end;
    local v13 = v2.createAppContainer(v7(v11));
    local v15 = v3.createElement(v5.Consumer, {
        render = function(v14)
            return v3.createElement(v13, {
                screenProps = {
                    topBarHeight = 64, 
                    getScreenTopBar = v14.getScreenTopBar, 
                    setScreenTopBar = v14.setScreenTopBar
                }
            });
        end
    });
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Parent = game:GetService("CoreGui");
    l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    local v17, v18 = l_mountFrameWithTopBar_0(v15, {
        store = v8, 
        parent = l_ScreenGui_0
    });
    return v17, v18;
end;

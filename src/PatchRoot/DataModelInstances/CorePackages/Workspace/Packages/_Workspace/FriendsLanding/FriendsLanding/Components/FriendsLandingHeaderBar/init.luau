local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_UIBlox_0 = v2.UIBlox;
local l_withLocalization_0 = v2.withLocalization;
local l_Actions_0 = v2.RoactNavigation.Actions;
local v7 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v8 = require(l_script_FirstAncestor_0.EnumScreens);
local v9 = require(script.FriendsLandingHeaderBarPresentational);
local l_HeaderBar_0 = l_UIBlox_0.App.Bar.HeaderBar;
local l_AppHeaderBar_0 = v2.AppHeaderBar;
local v12 = require(l_script_FirstAncestor_0.Navigator.getActiveChildNavigationOptionsSafely);
local l_GetFFlagUIBloxUseNewHeaderBar_0 = require(l_Parent_0.SharedFlags).UIBlox.GetFFlagUIBloxUseNewHeaderBar;
local v14 = l_Roact_0.PureComponent:extend("FriendsLandingHeaderBar");
v14.init = function(v15)
    v15.renderLeft = function(v16, v17, v18)
        if not v18 then
            return (if not l_GetFFlagUIBloxUseNewHeaderBar_0() then l_HeaderBar_0.renderLeft.backButton else l_AppHeaderBar_0.makeBackButton)(function()
                if not (v16.state.index == 1) or not v17 then
                    v16.dispatch(l_Actions_0.back());
                    return ;
                else
                    v17();
                    return ;
                end;
            end);
        else
            return function()
                return nil;
            end;
        end;
    end;
end;
v14.render = function(v19)
    return v7.with(function(v20)
        local l_navigation_0 = v19.props.navigation;
        local v22 = v12(l_navigation_0);
        local v23 = not not v20 and v20.exitFriendsLanding or nil;
        local l_headerText_0 = v22.headerText;
        local v25 = v20.getScreenTopBar(v8.FriendsLanding);
        return l_withLocalization_0({
            titleText = l_headerText_0.raw
        })(function(v26)
            local l_titleText_0 = v26.titleText;
            if not v20.addFriendsPageSearchbarEnabled then
                return l_Roact_0.createElement(v9, {
                    title = l_titleText_0, 
                    renderLeft = not v25.shouldRenderCenter and v22.renderLeft or v19.renderLeft(l_navigation_0, v23, v25.shouldRenderCenter), 
                    renderCenter = not not v25.shouldRenderCenter and v22.renderCenter or nil, 
                    renderRight = v22.renderRight
                });
            else
                return l_Roact_0.createElement(v9, {
                    title = l_titleText_0, 
                    renderLeft = not v25.shouldRenderCenter and v22.renderLeft or v19.renderLeft(l_navigation_0, v23, v25.shouldRenderCenter), 
                    renderCenter = if not v25.shouldRenderCenter then nil else v22.renderCenter, 
                    renderRight = v22.renderRight, 
                    isSecondary = v22.useSecondaryHeader, 
                    shouldHideSecondaryLeftItem = v25.shouldRenderCenter
                });
            end;
        end);
    end);
end;
return v14;

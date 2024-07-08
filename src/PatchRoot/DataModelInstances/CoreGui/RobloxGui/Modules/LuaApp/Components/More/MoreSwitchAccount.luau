local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local v3 = require(l_CorePackages_0.UIBlox);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v5 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v6 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_Modules_0.LuaApp.withLocalization);
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v11 = v1.PureComponent:extend("MoreSwitchAccount");
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v13 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v15 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v16 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenAccountSwitcher);
local v17 = require(l_Modules_0.LuaApp.EventStreamConstants);
v11.validateProps = v7.strictInterface({
    buttonHeight = v7.integer, 
    buttonMaxWidth = v7.integer, 
    item = v7.table, 
    layoutOrder = v7.optional(v7.integer), 
    position = v7.optional(v7.UDim2), 
    navigateDown = v7.callback, 
    navigateBack = v7.callback, 
    guiService = v7.union(v7.Instance, v7.table), 
    networkImpl = v7.callback, 
    willActivate = v7.optional(v7.callback), 
    authAnalytics = v7.table, 
    showAccountSwitcher = v7.callback
});
v11.init = function(v18)
    local l_item_0 = v18.props.item;
    v18.navigateDown = function()
        v18.props.navigateDown({
            name = l_item_0.context.page
        });
    end;
    v18.onActivated = function()
        v18.props.authAnalytics.reportAuthButtonClick(v17.Context.MorePage, v17.Button.SwitchAccounts);
        v18.props.showAccountSwitcher(v18.props.networkImpl, v18.props.authAnalytics);
        if v18.props.willActivate then
            v18.props.willActivate();
        end;
    end;
end;
v11.render = function(v20)
    local l_buttonHeight_0 = v20.props.buttonHeight;
    local l_buttonMaxWidth_0 = v20.props.buttonMaxWidth;
    local l_layoutOrder_0 = v20.props.layoutOrder;
    local l_position_0 = v20.props.position;
    return v8({
        switchAccountText = "Authentication.AccountSwitch.Heading.SwitchAccount", 
        addAccountText = "Authentication.AccountSwitch.Action.AddAccount", 
        maxAccountsReachedText = "Authentication.AccountSwitch.Label.AccountLimitReached.2"
    })(function(v25)
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = l_position_0, 
            LayoutOrder = l_layoutOrder_0, 
            Size = UDim2.new(1, 0, 0, l_buttonHeight_0)
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            SwitchAccountButtonFrame = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                UISizeConstraint = v1.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(l_buttonMaxWidth_0, l_buttonHeight_0)
                }), 
                SwitchAccountButton = v1.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.Secondary, 
                    isDisabled = false, 
                    isLoading = false, 
                    onActivated = v20.onActivated, 
                    size = UDim2.new(1, 0, 1, 0), 
                    text = v25.switchAccountText
                })
            })
        });
    end);
end;
return l_RoactServices_0.connect({
    guiService = l_AppGuiService_0, 
    networkImpl = v15, 
    authAnalytics = v13
})((v2.connect(function(_, _)
    return {};
end, function(v28)
    return {
        navigateDown = function(v29)
            v28(v5(v29));
        end, 
        navigateBack = function()
            v28(v6());
        end, 
        showAccountSwitcher = function(v30, v31)
            v28(v16(true, v30, v17.Origin.MoreMenu, v31));
        end
    };
end)(v11)));

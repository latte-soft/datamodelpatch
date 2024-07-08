local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Roact);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v9 = require(l_Modules_0.LuaApp.Constants);
local v10 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v11 = require(l_Modules_0.LuaApp.Components.More.MorePageScrollingFrame);
local v12 = require(l_Modules_0.LuaApp.Components.More.AccessibilityPageContent);
local v13 = require(l_Modules_0.LuaApp.Components.More.MorePageUtils);
local v14 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppSingleHeaderBar);
local v15 = v3.PureComponent:extend("AccessibilityPage");
v15.validateProps = v6.strictInterface({
    formFactor = v6.string, 
    platform = v6.EnumItem, 
    roactAnalytics = v6.union(v6.Instance, v6.table)
});
v15.renderWithProviders = function(v16, v17)
    local v18, v19, v20 = v13.paddingsForFormFactor(v16.props.formFactor);
    local v21 = v3.createElement(v11, {
        Position = UDim2.fromScale(0, 0), 
        Size = UDim2.fromScale(1, 1), 
        maxWidth = v20
    }, {
        Layout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, v9.MORE_PAGE_SECTION_PADDING)
        }), 
        UIPadding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v18), 
            PaddingRight = UDim.new(0, v18), 
            PaddingTop = UDim.new(0, v19), 
            PaddingBottom = UDim.new(0, v19)
        }), 
        Content = v3.createElement(v12)
    });
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v17.Color, 
        BackgroundTransparency = v17.Transparency
    }, {
        TopBar = if not v14 then v3.createElement(v10.Container, {
            leftItem = v10.BackButton, 
            rightItems = {
                v10.BuyRobuxButton, 
                v10.NotificationsButton
            }
        }) else nil, 
        PageContent = if not v14 then v3.createElement(v10.PageContent, {}, {
            Scroller = v21
        }) else v21
    });
end;
v15.render = function(v22)
    return l_withStyle_0(function(v23)
        return v22:renderWithProviders(v23.Theme.BackgroundDefault);
    end);
end;
v15.willUnmount = function(_)
    if game:GetEngineFeature("GlobalBasicSettingsSaveStateReflection") then
        task.spawn(function()
            UserSettings():SaveState();
        end);
    end;
end;
return l_RoactServices_0.connect({
    roactAnalytics = v5
})((v7.connect(function(v25, _)
    return {
        formFactor = v25.FormFactor, 
        platform = v25.Platform
    };
end)(v15)));

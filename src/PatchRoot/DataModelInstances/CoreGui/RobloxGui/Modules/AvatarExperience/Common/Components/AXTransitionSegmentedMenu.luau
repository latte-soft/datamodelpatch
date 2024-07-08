local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.RoactNavigation);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.Dash);
local v8 = require(l_CorePackages_0.UIBlox);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_SegmentedControl_0 = v8.App.Control.SegmentedControl;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarRoute);
local v17 = v2.PureComponent:extend("AXTransitionSegmentedMenu");
v17.validateProps = v6.strictInterface({
    formFactor = v6.string, 
    isCompactView = v6.boolean, 
    isUnderTitleSearchBarEnabled = v6.boolean, 
    isSearching = v6.boolean, 
    setVisible = v7.isCallable, 
    cancelSearch = v7.isCallable, 
    activateSearch = v7.isCallable, 
    buttonRef = v6.optional(v6.table), 
    navigation = v6.table, 
    avatarRoute = v16.Interface, 
    topBarHeight = v6.number, 
    avatarAnalytics = v6.table, 
    catalogAnalytics = v6.table, 
    [v2.Ref] = v6.optional(v6.table)
});
v17.getOpaquePage = function(v18)
    return v18.props.avatarRoute.opaque.name;
end;
v17.init = function(v19)
    v19:setState({
        segmentedControlWidth = 234
    });
    v19.goToAvatarEditorPage = function()
        if v19:getOpaquePage() ~= v14.AvatarEditor then
            v19.props.navigation.navigate(v14.AvatarEditor);
            v19.props.avatarAnalytics.catalogToAvatarButton();
        end;
    end;
    v19.goToCatalogPage = function()
        if v19:getOpaquePage() ~= v14.Catalog then
            v19.props.navigation.navigate(v14.Catalog);
            v19.props.catalogAnalytics.avatarToCatalogButton();
        end;
    end;
    v19.onTabActivated = function(v20)
        if v20 == 1 then
            v19.goToCatalogPage();
            return ;
        else
            if v20 == 2 then
                v19.goToAvatarEditorPage();
            end;
            return ;
        end;
    end;
end;
v17.render = function(v21)
    return l_withLocalization_0({
        customizeText = "Feature.Catalog.Action.Customize", 
        shopText = "Feature.Avatar.Action.Marketplace"
    })(function(v22)
        return v21:renderWithProviders(v22);
    end);
end;
v17.renderWithProviders = function(v23, v24)
    return v2.createElement(v5.Focusable.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        [v2.Change.AbsoluteSize] = function(v25)
            v23:absoluteSizeChanged(v25);
        end
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        SegmentedControl = v2.createElement(l_SegmentedControl_0, {
            width = UDim.new(0, v23.state.segmentedControlWidth), 
            selectedTabIndex = v23:getOpaquePage() == v14.Catalog and 1 or 2, 
            onTabActivated = v23.onTabActivated, 
            tabs = {
                {
                    tabName = v24.shopText
                }, 
                {
                    tabName = v24.customizeText
                }
            }
        })
    });
end;
v17.absoluteSizeChanged = function(v26, v27)
    v26:setState({
        segmentedControlWidth = v27.AbsoluteSize.X >= 234 and 234 or 224
    });
end;
return (v15((v4.withNavigation((l_RoactServices_0.connect({
    avatarAnalytics = v12, 
    catalogAnalytics = v13
})((v3.connect(function(v28, _)
    return {
        topBarHeight = v28.TopBar.topBarHeight
    };
end, nil)(v17))))))));

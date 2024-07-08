local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Dash);
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.UIBlox);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v8 = require(l_Modules_0.LuaApp.AppPage);
local v9 = require(l_Modules_0.LuaApp.AppPageLocalizationKeys);
local v10 = require(l_Modules_0.LuaApp.Components.More.DisconnectButton);
local v11 = require(l_Modules_0.LuaApp.Components.More.MoreGridItem);
local v12 = require(l_Modules_0.LuaApp.Hooks.useMorePageItems);
local v13 = require(l_Modules_0.LuaApp.Components.More.Settings.MorePageSettings);
local v14 = require(l_Modules_0.LuaApp.Components.Home.UserInfoWidget);
local l_IconSize_0 = v3.App.ImageSet.Enum.IconSize;
local l_GetFFlagFixTenFootUiMorePage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixTenFootUiMorePage;
return function()
    local v17 = l_useDesignTokens_0();
    local l_Title_0 = v17.Semantic.Typography.Title;
    local l_Emphasis_0 = v17.Semantic.Color.Text.Emphasis;
    local l_Space_400_0 = v17.Global.Space_400;
    local l_Space_400_1 = v17.Global.Space_400;
    local l_PageTopMargin_0 = v17.LuaApps.More.PageTopMargin;
    local l_BackgroundGradientOffset_0 = v17.LuaApps.More.BackgroundGradientOffset;
    local l_SafeAreaMargin_0 = v17.LuaApps.More.SafeAreaMargin;
    local l_ContentMargin_0 = v17.LuaApps.More.ContentMargin;
    local l_TitleHeight_0 = v17.LuaApps.More.TitleHeight;
    local l_TileSize_0 = v17.LuaApps.More.TileSize;
    local l_ButtonSize_0 = v17.LuaApps.More.ButtonSize;
    local v29 = if not l_GetFFlagFixTenFootUiMorePage_0() then nil else v17.LuaApps.More.UserIconSize;
    local v30 = if not l_GetFFlagFixTenFootUiMorePage_0() then nil else v17.LuaApps.More.UsernameTextFont;
    local v31 = if not l_GetFFlagFixTenFootUiMorePage_0() then nil else v17.LuaApps.More.UsernameTextStyle;
    local v32 = if not l_GetFFlagFixTenFootUiMorePage_0() then nil else v17.LuaApps.More.NavigationItemIconStyle;
    local v33 = if not l_GetFFlagFixTenFootUiMorePage_0() then nil else v17.LuaApps.More.NavigationItemTitleStyle;
    local v34 = if not l_GetFFlagFixTenFootUiMorePage_0() then nil else v17.LuaApps.More.NavigationItemTitleFont;
    local v35 = l_useLocalization_0({
        title = v9[v8.More]
    });
    local v36 = v12();
    local v38 = l_useSelector_0(function(v37)
        return v37.Users[v37.LocalUserId];
    end);
    local v43, v44, v45 = v2.useMemo(function()
        local v42 = v1.reduce(v36, function(v39, v40)
            return v1.join(v39, {
                [v40.type] = v1.append({}, v39[v40.type], (v1.map(v40.contents, function(v41)
                    return v1.join(v41, {
                        badgeCount = 0
                    });
                end)))
            });
        end, {
            [v13.SectionType.Content] = {}, 
            [v13.SectionType.Navigation] = {}, 
            [v13.SectionType.Action] = {}
        });
        return v42[v13.SectionType.Content], v42[v13.SectionType.Navigation], v42[v13.SectionType.Action];
    end, {
        v36
    });
    local v49 = v2.useMemo(function()
        return v1.reduce(v43, function(v46, v47, _)
            if v47.itemType == v13.ItemType.UserInfo then
                return v1.join(v46, {
                    UserInfo = v2.createElement(v14, {
                        localUserModel = v38, 
                        isProfileShareEnabled = false, 
                        onActivated = nil, 
                        onActivatedProfileShare = nil, 
                        sideMargin = v17.Global.Space_150, 
                        thumbnailSize = if not l_GetFFlagFixTenFootUiMorePage_0() then nil else v29, 
                        usernameTextFont = if not l_GetFFlagFixTenFootUiMorePage_0() then nil else v30, 
                        usernameTextStyle = if not l_GetFFlagFixTenFootUiMorePage_0() then nil else v31
                    })
                });
            else
                return v46;
            end;
        end, {});
    end, {
        v43
    });
    local v52 = v2.useMemo(function()
        return v1.map(v44, function(v50, v51)
            return v2.createElement("Frame", {
                Size = UDim2.new(0, l_TileSize_0.X, 0, l_TileSize_0.Y), 
                BackgroundTransparency = 1, 
                LayoutOrder = v51
            }, {
                GridItem = v2.createElement(v11, {
                    item = v50, 
                    layoutOrder = v51, 
                    itemStyleProps = if not l_GetFFlagFixTenFootUiMorePage_0() then nil else {
                        iconStyle = v32, 
                        iconSize = l_IconSize_0.Large, 
                        titleStyle = v33, 
                        titleFont = v34
                    }
                })
            });
        end);
    end, {
        v44
    });
    return v2.createElement("Frame", {
        Position = UDim2.new(0, l_SafeAreaMargin_0.X, 0, l_PageTopMargin_0), 
        Size = UDim2.new(1, -2 * l_SafeAreaMargin_0.X, 1, -l_SafeAreaMargin_0.Y - l_PageTopMargin_0), 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        BackgroundTransparency = 1
    }, {
        BackgroundFrame = v2.createElement("Frame", {
            Position = UDim2.new(0, -l_SafeAreaMargin_0.X, 0, -l_BackgroundGradientOffset_0), 
            Size = UDim2.new(1, l_SafeAreaMargin_0.X + l_SafeAreaMargin_0.X, 1, l_BackgroundGradientOffset_0 + l_SafeAreaMargin_0.Y), 
            ZIndex = -1
        }, {
            UIGradient = v2.createElement("UIGradient", {
                Color = ColorSequence.new(Color3.new(0, 0, 0)), 
                Transparency = NumberSequence.new(1, 0.4), 
                Rotation = 90
            })
        }), 
        TitleFrame = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_TitleHeight_0), 
            BackgroundTransparency = 1
        }, {
            Title = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                Text = v35.title, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                Font = l_Title_0.Font, 
                TextSize = l_Title_0.FontSize, 
                TextColor3 = l_Emphasis_0.Color3, 
                TextTransparency = l_Emphasis_0.Transparency
            })
        }), 
        ContentFrame = v2.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, l_TitleHeight_0 + l_Space_400_1), 
            Size = UDim2.new(0, 1, 0, 1), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, l_Space_400_0)
            })
        }, v49), 
        ActionFrame = v2.createElement("ScrollingFrame", {
            Position = UDim2.new(0, 0, 0, l_TitleHeight_0 + l_ContentMargin_0.Y), 
            Size = UDim2.new(1, 0, 0, l_TileSize_0.Y), 
            BackgroundTransparency = 1, 
            ClipsDescendants = false, 
            CanvasSize = UDim2.new(0, l_TileSize_0.X * #v52 + l_Space_400_0 * (#v52 - 1), 0, l_TileSize_0.Y), 
            ScrollingDirection = Enum.ScrollingDirection.X, 
            ScrollBarThickness = 0, 
            SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
            Selectable = false
        }, v1.assign({
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, l_Space_400_0)
            })
        }, v52)), 
        ButtonFrame = v2.createElement("Frame", {
            Position = UDim2.new(0.5, 0, 1, -l_ContentMargin_0.Y), 
            AnchorPoint = Vector2.new(0.5, 1), 
            Size = UDim2.new(0, l_ButtonSize_0.X, 0, l_ButtonSize_0.Y), 
            BackgroundTransparency = 1
        }, v1.assign({
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, l_Space_400_0)
            })
        }, (v2.useMemo(function()
            return v1.reduce(v45, function(v53, v54, v55)
                if v54.itemType == v13.ItemType.LogOut then
                    return v1.join(v53, {
                        Disconnect = v2.createElement("Frame", {
                            Size = UDim2.new(0, l_ButtonSize_0.X, 0, l_ButtonSize_0.Y), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = v55
                        }, {
                            v2.createElement(v10)
                        })
                    });
                else
                    return v53;
                end;
            end, {});
        end, {
            v45
        }))))
    });
end;

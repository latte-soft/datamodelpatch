local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v5 = require(l_CorePackages_0.Workspace.Packages.TenFootUiShell);
local v6 = require(l_CorePackages_0.Workspace.Packages.QRCodeDisplay);
local l_DisplayQRCode_0 = v6.DisplayQRCode;
local l_ECLevels_0 = v6.ECLevels;
local _ = require(l_CorePackages_0.UIBlox);
local l_CrossPlayCapabilities_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).Enum.CrossPlayCapabilities;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v13 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local _ = require(l_Modules_0.LuaApp.Components.More.Settings.MorePageSettings);
local _ = require(l_Modules_0.LuaApp.Components.More.DisconnectButton);
local _ = require(l_Modules_0.LuaApp.Components.More.MoreGridItem);
local _ = require(l_Modules_0.LuaApp.Hooks.useMorePageItems);
local v18 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local l_AnimatedFlatList_0 = require(l_CorePackages_0.Packages.VirtualizedList).AnimatedFlatList;
local v20 = require(script.Parent.MoreComponents.MoreSection);
local v21 = require(script.Parent.MoreComponents.MoreStatusButton);
local v22 = require(script.Parent.MoreComponents.MoreText);
local _ = v22.HeaderText;
local l_SubheaderText_0 = v22.SubheaderText;
local l_BodyText_0 = v22.BodyText;
local l_BoldBodyText_0 = v22.BoldBodyText;
local v27 = v18.static.settings.account();
local l_ThirdPartyUserService_0 = game:GetService("ThirdPartyUserService");
local function _(v29, v30)
    local v31 = not v29.isEnabled and "" or "(" .. v30.recommended .. ") ";
    if not v29.isLoading then
        if not v29.hasError then
            if not v29.isEnabled then
                return v31 .. v30.disabled;
            else
                return v31 .. v30.enabled;
            end;
        else
            return v31 .. v30.error;
        end;
    else
        return v31 .. v30.loading;
    end;
end;
local function _(v33)
    return ((v33 and v33.Success) and v33.CanJoinGame) and v33.PrivilegeCheckResult == "NoIssue";
end;
local function v44(v35, v36, v37, v38)
    local v39 = {
        [l_CrossPlayCapabilities_0.CrossPlatform] = v37.crossPlatform, 
        [l_CrossPlayCapabilities_0.Multiplayer] = v37.multiplayer, 
        [l_CrossPlayCapabilities_0.SharedContent] = v37.sharedContent
    };
    return v2.map(v35, function(v40)
        local v41 = v36[v40];
        local v42 = ((v41 and v41.Success) and v41.CanJoinGame) and v41.PrivilegeCheckResult == "NoIssue";
        v41 = v36[v40] and v36[v40].PrivilegeCheckResult == "Error";
        local _ = nil;
        return {
            label = v39[v40], 
            status = if not v38 then if v41 then v37.error else if v42 then v37.allowed else v37.disallowed else v37.loading
        };
    end);
end;
local function v53(v45)
    local v46 = v5.useCrossPlaySettings();
    local v47 = l_useLocalization_0({
        multiplayer = "Feature.Settings.Label.Multiplayer", 
        sharedContent = "Feature.Settings.Label.SharedContent", 
        recommended = "Feature.Settings.Label.Recommended", 
        enabled = "Feature.Settings.Label.Enabled", 
        disabled = "Feature.Settings.Label.Disabled", 
        loading = "Feature.Settings.Label.Loading", 
        error = "Feature.Settings.Label.Error", 
        allowed = "Feature.Settings.Label.Allowed", 
        disallowed = "Feature.Settings.Label.Disallowed"
    });
    local v51 = v3.useMemo(function()
        local l_v46_0 = v46;
        local l_v47_0 = v47;
        local v50 = not l_v46_0.isEnabled and "" or "(" .. l_v47_0.recommended .. ") ";
        return if not l_v46_0.isLoading then if l_v46_0.hasError then v50 .. l_v47_0.error else if l_v46_0.isEnabled then v50 .. l_v47_0.enabled else v50 .. l_v47_0.disabled else v50 .. l_v47_0.loading;
    end, {
        v46, 
        v47
    });
    local v52 = v3.useMemo(function()
        return v44(v45, v46.systemPrivileges, v47, v46.isLoading);
    end, {
        v46, 
        v45, 
        v47
    });
    v3.useEffect(function()
        v46.reload();
    end, {});
    return (v3.useMemo(function()
        return {
            crossPlaySettings = v46, 
            crossPlayStatusText = v51, 
            privilegeStatuses = v52
        };
    end, {
        v46, 
        v51, 
        v52
    }));
end;
local function _(v54, v55, v56)
    return v2.reduce(v55, function(v57, v58)
        local l_v57_0 = v57;
        if l_v57_0 then
            local v60 = v56[v58];
            l_v57_0 = ((v60 and v60.Success) and v60.CanJoinGame) and v60.PrivilegeCheckResult == "NoIssue";
        end;
        return l_v57_0;
    end, v54.isEnabled);
end;
return function()
    local v63 = v13(function(v62)
        return v62.getPlatformDisplayName();
    end);
    local v65 = v13(function(v64)
        return v64.getPlatformAccountName();
    end);
    local v66 = l_useLocalization_0({
        switchProfile = "Feature.Settings.Heading.SwitchProfile", 
        switchProfileDescription = {
            "Feature.Settings.Description.SwitchProfile"; 
            platform = v63
        }, 
        accountSettings = "Feature.Settings.Heading.AccountSettings", 
        accountSettingsWebsite = "Feature.Settings.Subheading.AccountSettingsWebsite", 
        accountSettingsWebsiteDescription = "Feature.Settings.Description.AccountSettingsWebsite", 
        accountSettingsScan = "Feature.Settings.Subheading.AccountSettingsScan", 
        accountSettingsScanDescription = "Feature.Settings.Description.AccountSettingsScan", 
        platformAccountSettings = {
            "Feature.Settings.Heading.PlatformAccountSettings"; 
            platform = v65
        }, 
        platformAccountSettingsSuccess = {
            "Feature.Settings.Description.PlatformAccountSettingsSuccess"; 
            platform = v65
        }, 
        crossPlatform = "Feature.Settings.Label.CrossPlatform", 
        crossPlatformDescription = "Feature.Settings.Description.CrossPlatform", 
        open = "Feature.Settings.Label.Open"
    });
    local v67 = l_useDesignTokens_0();
    local v68 = UDim.new(0, v67.Global.Space_200);
    local _ = UDim.new(0, v67.Global.Space_300);
    local l_PageTopMargin_0 = v67.LuaApps.More.PageTopMargin;
    local l_BackgroundGradientOffset_0 = v67.LuaApps.More.BackgroundGradientOffset;
    local l_SafeAreaMargin_0 = v67.LuaApps.More.SafeAreaMargin;
    local _ = v67.LuaApps.More.ContentMargin;
    local _ = v67.LuaApps.More.TitleHeight;
    local _ = v67.LuaApps.More.TileSize;
    local l_QrSize_0 = v67.LuaApps.More.QrSize;
    local v78 = v13(function(v77)
        return v77.getAllowPlatformAccountSwitching();
    end);
    local v80 = v13(function(v79)
        return (v79.getCrossPlayCapabilities());
    end);
    local v81 = v53(v80);
    local l_crossPlaySettings_0 = v81.crossPlaySettings;
    local l_crossPlayStatusText_0 = v81.crossPlayStatusText;
    local v85 = v2.map(v81.privilegeStatuses, function(v84)
        return v3.createElement(v21, {
            layoutOrder = 3, 
            title = v84.label, 
            status = v84.status, 
            onActivated = l_crossPlaySettings_0.invokeSystemUi
        });
    end);
    local v86 = if not v78 then nil else v3.createElement(v20, {
        layoutOrder = 1, 
        title = v66.switchProfile
    }, {
        v3.createElement(v21, {
            layoutOrder = 1, 
            title = v66.switchProfile, 
            status = v66.open, 
            onActivated = function()
                if l_ThirdPartyUserService_0 then
                    l_ThirdPartyUserService_0:ShowAccountPicker();
                end;
            end
        }), 
        v3.createElement(l_BodyText_0, {
            layoutOrder = 2, 
            text = v66.switchProfileDescription
        })
    });
    local l_systemPrivileges_0 = l_crossPlaySettings_0.systemPrivileges;
    local v92 = {
        v86, 
        v3.createElement(v20, {
            layoutOrder = 2, 
            title = v66.accountSettings
        }, {
            v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1
            }, v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), v3.createElement("Frame", {
                Size = UDim2.new(1, -l_QrSize_0, 1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = v68
            }), v3.createElement(l_SubheaderText_0, {
                layoutOrder = 1, 
                text = v66.accountSettingsWebsite
            }), v3.createElement(l_BodyText_0, {
                layoutOrder = 2, 
                text = v66.accountSettingsWebsiteDescription
            }), v3.createElement(l_BoldBodyText_0, {
                layoutOrder = 3, 
                text = v27
            }), v3.createElement(l_SubheaderText_0, {
                layoutOrder = 4, 
                text = v66.accountSettingsScan
            }), v3.createElement(l_BodyText_0, {
                layoutOrder = 5, 
                text = v66.accountSettingsScanDescription
            })), v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, v3.createElement(l_DisplayQRCode_0, {
                ecLevel = l_ECLevels_0.EC_LEVEL_1, 
                sideLength = l_QrSize_0, 
                toEncode = v27
            })))
        }), 
        (v3.createElement(v20, {
            layoutOrder = 3, 
            withDivider = false, 
            title = v66.platformAccountSettings
        }, v2.append({
            v3.createElement(v21, {
                layoutOrder = 1, 
                title = v66.crossPlatform, 
                status = l_crossPlayStatusText_0, 
                isDisabled = l_crossPlaySettings_0.isLoading, 
                onActivated = l_crossPlaySettings_0.toggle
            }), 
            v3.createElement(l_BodyText_0, {
                layoutOrder = 2, 
                text = v66.crossPlatformDescription
            })
        }, v85, {
            if not v2.reduce(v80, function(v88, v89)
                local l_v88_0 = v88;
                if l_v88_0 then
                    local v91 = l_systemPrivileges_0[v89];
                    l_v88_0 = ((v91 and v91.Success) and v91.CanJoinGame) and v91.PrivilegeCheckResult == "NoIssue";
                end;
                return l_v88_0;
            end, l_crossPlaySettings_0.isEnabled) then nil else v3.createElement(l_BodyText_0, {
                layoutOrder = 5, 
                text = v66.platformAccountSettingsSuccess
            })
        })))
    };
    return v3.createElement("Frame", {
        Position = UDim2.new(0, l_SafeAreaMargin_0.X, 0, l_PageTopMargin_0), 
        Size = UDim2.new(1, -2 * l_SafeAreaMargin_0.X, 1, -l_SafeAreaMargin_0.Y - l_PageTopMargin_0), 
        BackgroundTransparency = 1
    }, {
        BackgroundFrame = v3.createElement("Frame", {
            Position = UDim2.new(0, -l_SafeAreaMargin_0.X, 0, -l_BackgroundGradientOffset_0), 
            Size = UDim2.new(1, l_SafeAreaMargin_0.X + l_SafeAreaMargin_0.X, 1, l_BackgroundGradientOffset_0 + l_SafeAreaMargin_0.Y), 
            ZIndex = -1
        }, {
            UIGradient = v3.createElement("UIGradient", {
                Color = ColorSequence.new(Color3.new(0, 0, 0)), 
                Transparency = NumberSequence.new(1, 0.4), 
                Rotation = 90
            })
        }), 
        ContentList = v3.createElement(l_AnimatedFlatList_0, {
            animated = true, 
            animationConfig = v67.LuaApps.App.Page.ScrollAnimationConfig, 
            initialNumToRender = #v92, 
            data = v92, 
            renderItem = function(v93)
                return v93.item;
            end, 
            contentContainerStyle = {
                BackgroundTransparency = 1
            }, 
            style = {
                Selectable = false, 
                ClipsDescendants = false, 
                BackgroundTransparency = 1, 
                ScrollBarThickness = 0, 
                VerticalScrollBarInset = Enum.ScrollBarInset.None, 
                ScrollingEnabled = false
            }, 
            ItemSeparatorComponent = v3.useCallback(function()
                return v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v67.Global.Space_300), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 10000000
                });
            end, {
                v67.Global.Space_300
            }), 
            ListHeaderComponent = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v67.Global.Space_200), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }), 
            ListFooterComponent = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v67.Global.Space_400), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            })
        })
    });
end;

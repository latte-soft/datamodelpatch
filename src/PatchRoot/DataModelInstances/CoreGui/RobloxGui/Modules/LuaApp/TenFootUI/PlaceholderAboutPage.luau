local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_DataModelPatchService_0 = game:GetService("DataModelPatchService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_CorePackages_0.Packages.Dash);
local v6 = require(l_CorePackages_0.Packages.React);
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.TenFootUiShell).Constants;
local v8 = require(l_CorePackages_0.UIBlox);
local l_Images_0 = v8.App.ImageSet.Images;
local l_DropdownMenu_0 = v8.App.Menu.DropdownMenu;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v14 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v15 = require(l_Modules_0.LuaApp.openExternalBrowser);
local v16 = require(l_Modules_0.LuaApp.Components.More.Licensing.useLicenseData);
local v17 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local l_GetTextSize_0 = require(l_CorePackages_0.Workspace.Packages.Style).GetTextSize;
local l_ScrollBarType_0 = v8.App.Container.Enum.ScrollBarType;
local l_VerticalScrollView_0 = v8.App.Container.VerticalScrollView;
local l_AnimatedFlatList_0 = require(l_CorePackages_0.Packages.VirtualizedList).AnimatedFlatList;
local v22 = require(l_Modules_0.LuaApp.Components.FocusFrame);
local v23 = require(script.Parent.MoreComponents.MoreSection);
local v24 = require(script.Parent.MoreComponents.MoreStatusButton);
local l_BodyText_0 = require(script.Parent.MoreComponents.MoreText).BodyText;
local l_OtaPatchName_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).OtaPatchName;
local l_OtaPackagesStatus_0 = require(l_CorePackages_0.Workspace.Packages.OtaPatchPackagesStatus).OtaPackagesStatus;
local v28 = v17.static.about.terms();
local v29 = v17.static.about.privacy();
local v30 = game:DefineFastFlag("EnableTenFootUiAppInfo", false);
local l_FFlagLuaAppAddDiscoveryOtaVersion_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddDiscoveryOtaVersion;
local l_FFlagLuaAppShowOtaPackagesLoaded_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppShowOtaPackagesLoaded;
local l_game_EngineFeature_0 = game:GetEngineFeature("DataModelPatchServiceHasGetVersion");
local v34 = if not v30 then nil else l_RunService_0:GetRobloxVersion();
local v35 = if not v30 then nil else l_RunService_0:GetCoreScriptVersion();
local v36 = if not v30 then nil else l_RunService_0:GetRobloxClientChannel();
local function v46()
    local v37 = v16();
    local l_licenseList_0 = v37.licenseList;
    local l_initialLicenseKey_0 = v37.initialLicenseKey;
    local v40, v41 = v6.useState(nil);
    return v6.useMemo(function()
        return v5.map(l_licenseList_0, function(v42)
            return {
                text = v42.key
            };
        end);
    end, {
        l_licenseList_0
    }), v6.useMemo(function()
        local v44 = v5.map(l_licenseList_0, function(v43)
            return {
                key = v43.key, 
                value = table.concat(v43.value, "\n")
            };
        end);
        return ((v5.find(v44, function(v45)
            return v45.key == (v40 or l_initialLicenseKey_0);
        end) or v44[1]) or {
            key = "", 
            value = ""
        }).value;
    end, {
        v40, 
        l_licenseList_0, 
        l_initialLicenseKey_0
    }), v41;
end;
local function v53(v47)
    local v48 = l_useDesignTokens_0();
    local v49 = v6.useRef(nil);
    local v50 = v6.useRef(nil);
    v6.useEffect(function()
        if v49.current then
            for _, v52 in v49.current:GetDescendants() do
                if v52:IsA("GuiObject") then
                    if not (v52 == v50.current) or not v47.selectable then
                        v52.Selectable = false;
                    else
                        v52.Selectable = true;
                    end;
                end;
            end;
        end;
    end);
    return v6.createElement("Frame", {
        ref = v49, 
        Position = UDim2.new(), 
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = v48.Semantic.Color.Background.Default.Color3, 
        BackgroundTransparency = not v47.selectable and 1 or v48.Semantic.Color.Background.Default.Transparency, 
        SelectionGroup = true, 
        SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorUp = Enum.SelectionBehavior.Stop
    }, v6.createElement(l_VerticalScrollView_0, {
        ref = v50, 
        canvasSizeY = UDim.new(), 
        useAutomaticCanvasSize = true, 
        isGamepadFocusable = true, 
        scrollingEnabled = v47.scrollingEnabled, 
        scrollBarType = if not v47.scrollingEnabled then nil else l_ScrollBarType_0.Gamepad
    }, v47.children));
end;
return v6.forwardRef(function(_, v55)
    local v56 = nil;
    if l_game_EngineFeature_0 then
        local l_DiscoveryOta_0 = l_OtaPatchName_0.DiscoveryOta;
        v56 = l_DataModelPatchService_0:GetLuaVersion(l_DiscoveryOta_0);
        if v56 == "Undefined" then
            v56 = nil;
        elseif l_FFlagLuaAppShowOtaPackagesLoaded_0 then
            local v58 = l_OtaPackagesStatus_0.AllPatchPackagesLoaded(l_DiscoveryOta_0);
            if v58 ~= nil then
                v56 = v56 .. " (" .. v58 .. ")";
            end;
        end;
    end;
    local v59 = v14(l_AppLinking_0);
    local v60 = l_useLocalization_0({
        about = "CommonUI.Features.Label.About", 
        termsOfService = "CommonUI.Features.Label.TermsOfService", 
        privacy = "CommonUI.Features.Label.Privacy", 
        licensing = "CommonUI.Features.Label.Licensing", 
        noLicenses = "CommonUI.Messages.Message.NoLicenses", 
        buildVersionText = if not v30 then nil else {
            "CommonUI.Features.Label.VersionWithNumber"; 
            versionNumber = v34
        }, 
        coreScriptVersionText = if not v30 then nil else {
            "CommonUI.Features.Label.ClientCoreScriptVersion"; 
            clientCoreScriptVersion = v35
        }, 
        discoveryScriptVersionText = if not not v30 and l_FFlagLuaAppAddDiscoveryOtaVersion_0 then {
            "CommonUI.Features.Label.DiscoveryScriptVersion"; 
            discoveryScriptVersion = v56
        } else nil, 
        clientChannelText = if not v30 then nil else {
            "CommonUI.Features.Label.ChannelWithChannelName"; 
            channelName = v36
        }, 
        versionSectionTitle = if not v30 then nil else "CommonUI.Features.Label.Version"
    });
    local v61 = l_useDesignTokens_0();
    local l_LicensePanelWidthScale_0 = v61.LuaApps.More.LicensePanelWidthScale;
    local v63, v64 = v6.useState(0);
    local v66 = v6.useCallback(function(v65)
        if v65 then
            v64(v65.AbsoluteSize.X * l_LicensePanelWidthScale_0);
        end;
    end, {});
    local v67 = UDim.new(0, v61.Global.Space_300);
    local l_PageTopMargin_0 = v61.LuaApps.More.PageTopMargin;
    local l_Color3_0 = v61.Semantic.Color.Common.Overlay.Color3;
    local l_Transparency_0 = v61.Semantic.Color.Common.Overlay.Transparency;
    local l_BackgroundGradientOffset_0 = v61.LuaApps.More.BackgroundGradientOffset;
    local l_SafeAreaMargin_0 = v61.LuaApps.More.SafeAreaMargin;
    local l_Default_0 = v61.Semantic.Color.Background.Default;
    local l_Font_0 = v61.Semantic.Typography.Body.Font;
    local l_FontSize_0 = v61.Semantic.Typography.Body.FontSize;
    local l_Size_300_0 = v61.Global.Size_300;
    local l_Y_0 = l_Constants_0.TOP_BAR_CANVAS_SIZE.Y;
    local v78, v79, v80 = v46();
    local v81 = v6.createElement(v23, {
        layoutOrder = 1, 
        title = v60.about
    }, v6.createElement(v24, {
        layoutOrder = 1, 
        title = v60.termsOfService, 
        icon = l_Images_0["icons/navigation/externallink_medium"], 
        onActivated = function()
            v15(v59, v28);
        end
    }), v6.createElement(v24, {
        layoutOrder = 1, 
        title = v60.privacy, 
        icon = l_Images_0["icons/navigation/externallink_medium"], 
        onActivated = function()
            v15(v59, v29);
        end
    }));
    local v82 = v6.useMemo(function()
        if not v79 then
            return 0;
        else
            return l_GetTextSize_0(v79, l_FontSize_0, l_Font_0, Vector2.new(v63 + l_Size_300_0 * 2, math.huge)).Y;
        end;
    end, {
        v79, 
        l_Font_0, 
        l_FontSize_0, 
        v63, 
        l_Size_300_0
    });
    local v84 = v6.useCallback(function(_)
        return v6.createElement("Frame", {
            Position = UDim2.new(), 
            Size = UDim2.fromScale(l_LicensePanelWidthScale_0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, v6.createElement("UIPadding", {
            PaddingTop = v67, 
            PaddingBottom = v67
        }), v6.createElement(l_BodyText_0, {
            text = v79, 
            layoutOrder = 2, 
            size = UDim2.new(1, 0, 1, v82), 
            TextYAlignment = Enum.TextYAlignment.Top
        }));
    end, {
        v79, 
        v82, 
        v67, 
        l_LicensePanelWidthScale_0
    });
    local v88 = v6.useCallback(function(v85, v86, v87)
        return v6.createElement(v53, {
            scrollingEnabled = v85, 
            selectable = v86
        }, v87);
    end, {});
    local v90 = v6.useCallback(function(v89)
        return v89.item;
    end, {});
    local v91 = {
        v81, 
        (v6.createElement(v23, {
            layoutOrder = 2, 
            withDivider = not not v30 or false, 
            title = v60.licensing
        }, v6.createElement("Frame", {
            Name = "LicenseDropdown", 
            ref = v66, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, 72), 
            BackgroundTransparency = 1, 
            ZIndex = 2
        }, v6.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, v6.createElement(l_DropdownMenu_0, {
            placeholder = if #v78 > 0 then v78[1].text else v60.noLicenses, 
            onChange = v80, 
            height = UDim.new(0, 72), 
            screenSize = Vector2.new(1920, 1080), 
            cellDatas = v78, 
            menuListBackground = {
                Color = l_Default_0.Color3, 
                Transparency = l_Default_0.Transparency
            }
        }))), v6.createElement(v22, {
            ref = v55, 
            layoutOrder = 2, 
            safeAreaSize = UDim2.new(1, -2 * v61.Global.Size_800, 0, 3 * v61.Global.Size_1000), 
            limitInlineHeight = true, 
            overlayColor3 = l_Color3_0, 
            overlayTransparency = l_Transparency_0, 
            renderContents = v84, 
            renderContentWrapper = v88
        })))
    };
    if v30 then
        table.insert(v91, (v6.createElement(v23, {
            layoutOrder = 3, 
            withDivider = false, 
            title = v60.versionSectionTitle
        }, {
            Layout = v6.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = v67
            }), 
            BuildVersion = v6.createElement(l_BodyText_0, {
                text = v60.buildVersionText, 
                layoutOrder = 1
            }), 
            CoreScriptVersion = v6.createElement(l_BodyText_0, {
                text = v60.coreScriptVersionText, 
                layoutOrder = 2
            }), 
            DiscoveryVersionText = if not not l_FFlagLuaAppAddDiscoveryOtaVersion_0 and v56 ~= nil then v6.createElement(l_BodyText_0, {
                text = v60.discoveryScriptVersionText, 
                layoutOrder = 3
            }) else nil, 
            ClientChannel = v6.createElement(l_BodyText_0, {
                text = v60.clientChannelText, 
                layoutOrder = not l_FFlagLuaAppAddDiscoveryOtaVersion_0 and 3 or 4
            })
        })));
    end;
    return v6.createElement("Frame", {
        Position = UDim2.new(0, l_SafeAreaMargin_0.X, 0, l_PageTopMargin_0 + l_Y_0), 
        Size = UDim2.new(1, -2 * l_SafeAreaMargin_0.X, 1, (-l_SafeAreaMargin_0.Y - l_PageTopMargin_0) - l_Y_0), 
        BackgroundTransparency = 1
    }, {
        BackgroundFrame = v6.createElement("Frame", {
            Position = UDim2.new(0, -l_SafeAreaMargin_0.X, 0, -l_BackgroundGradientOffset_0), 
            Size = UDim2.new(1, l_SafeAreaMargin_0.X + l_SafeAreaMargin_0.X, 1, l_BackgroundGradientOffset_0 + l_SafeAreaMargin_0.Y), 
            ZIndex = -1
        }, {
            UIGradient = v6.createElement("UIGradient", {
                Color = ColorSequence.new(Color3.new(0, 0, 0)), 
                Transparency = NumberSequence.new(1, 0.4), 
                Rotation = 90
            })
        }), 
        ContentList = v6.createElement(l_AnimatedFlatList_0, {
            animated = true, 
            animationConfig = v61.LuaApps.App.Page.ScrollAnimationConfig, 
            initialNumToRender = #v91, 
            data = v91, 
            renderItem = v90, 
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
            ItemSeparatorComponent = v6.useCallback(function()
                return v6.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v61.Global.Space_300), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 10000000
                });
            end, {
                v61.Global.Space_300
            }), 
            ListHeaderComponent = v6.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v61.Global.Space_200), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }), 
            ListFooterComponent = v6.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v61.Global.Space_400), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            })
        })
    });
end);

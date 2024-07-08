local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_DataModelPatchService_0 = game:GetService("DataModelPatchService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v9 = require(l_Modules_0.LuaApp.AppPage);
local v10 = require(l_Modules_0.LuaApp.Constants);
local v11 = require(l_Modules_0.LuaApp.Components.More.Settings.MorePageSettings);
local v12 = require(l_Modules_0.LuaApp.withLocalization);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v14 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v15 = require(l_Modules_0.LuaApp.Components.More.MoreList);
local v16 = require(l_Modules_0.LuaApp.Components.More.MoreItemContainer);
local v17 = require(l_Modules_0.LuaApp.Components.More.MorePageScrollingFrame);
local v18 = require(l_CorePackages_0.Packages.React);
local v19 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v20 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.TenFootUiShell).Constants;
local v23 = require(l_Modules_0.LuaApp.Components.More.MoreSectionList);
local l_OtaPatchName_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).OtaPatchName;
local l_OtaPackagesStatus_0 = require(l_CorePackages_0.Workspace.Packages.OtaPatchPackagesStatus).OtaPackagesStatus;
local l_GetFFlagTenFootMoreSettingsAndAboutRefactor_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagTenFootMoreSettingsAndAboutRefactor;
local v27 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppSingleHeaderBar);
local l_FFlagLuaAppAddDiscoveryOtaVersion_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddDiscoveryOtaVersion;
local l_FFlagLuaAppShowOtaPackagesLoaded_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppShowOtaPackagesLoaded;
local l_game_EngineFeature_0 = game:GetEngineFeature("DataModelPatchServiceHasGetVersion");
local l_l_RunService_0_RobloxClientChannel_0 = l_RunService_0:GetRobloxClientChannel();
local l_l_RunService_0_RobloxVersion_0 = l_RunService_0:GetRobloxVersion();
local l_l_RunService_0_CoreScriptVersion_0 = l_RunService_0:GetCoreScriptVersion();
l_l_RunService_0_RobloxVersion_0 = string.format("%s (%.6s)", l_l_RunService_0_RobloxVersion_0, l_RunService_0.ClientGitHash);
local v34 = v5.PureComponent:extend("AboutPage");
v34.init = function(v35)
    v35.renderItem = function(v36, v37)
        return v5.createElement(v16, {
            item = v36, 
            layoutInfo = v37
        });
    end;
    if not (not l_FFlagLuaAppAddDiscoveryOtaVersion_0 or not l_game_EngineFeature_0) then
        local l_DiscoveryOta_0 = l_OtaPatchName_0.DiscoveryOta;
        v35.discoveryVersion = l_DataModelPatchService_0:GetLuaVersion(l_DiscoveryOta_0);
        if v35.discoveryVersion == "Undefined" then
            v35.discoveryVersion = nil;
            return ;
        elseif l_FFlagLuaAppShowOtaPackagesLoaded_0 then
            local v39 = l_OtaPackagesStatus_0.AllPatchPackagesLoaded(l_DiscoveryOta_0);
            if v39 ~= nil then
                v35.discoveryVersion = v35.discoveryVersion .. " (" .. v39 .. ")";
            end;
        end;
    end;
end;
v34.render = function(v40)
    local v41 = v40.props.formFactor == l_FormFactor_0.WIDE;
    local v42 = 0;
    local v43 = 0;
    local l_MORE_PAGE_SECTION_PADDING_0 = v10.MORE_PAGE_SECTION_PADDING;
    local l_MORE_PAGE_SECTION_PADDING_1 = v10.MORE_PAGE_SECTION_PADDING;
    if v41 then
        v42 = v10.MORE_PAGE_WIDE_PADDING_HORIZONTAL;
        v43 = v10.MORE_PAGE_WIDE_PADDING_HORIZONTAL;
        l_MORE_PAGE_SECTION_PADDING_0 = v10.MORE_PAGE_WIDE_PADDING_VERTICAL;
        l_MORE_PAGE_SECTION_PADDING_1 = v10.MORE_PAGE_WIDE_PADDING_VERTICAL;
    end;
    local v46 = (v10.MORE_PAGE_CONTENT_MAX_WIDTH + v42) + v43;
    local v48 = v4.List.map(v11.GetItemsInPage(v40.props.aboutPageType, nil, nil, nil, nil, v40.props.disableWebViewSupport), function(v47)
        return v47.contents;
    end);
    local function v52(v49, v50, v51)
        return v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v50.Color, 
            BackgroundTransparency = v50.Transparency
        }, {
            TopBar = if not v27 then v5.createElement(v14.Container, {
                leftItem = v14.BackButton, 
                rightItems = {
                    v14.BuyRobuxButton, 
                    v14.NotificationsButton
                }
            }) else nil, 
            PageContent = v5.createElement(if not v27 then v14.PageContent else v18.Fragment, if not v27 then {} else nil, {
                Scroller = v5.createElement(v17, {
                    Position = UDim2.fromScale(0, 0), 
                    Size = UDim2.fromScale(1, 1), 
                    maxWidth = v46
                }, {
                    Layout = v5.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, v10.MORE_PAGE_SECTION_PADDING)
                    }), 
                    UIPadding = v5.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v42), 
                        PaddingRight = UDim.new(0, v43), 
                        PaddingTop = UDim.new(0, l_MORE_PAGE_SECTION_PADDING_0), 
                        PaddingBottom = UDim.new(0, l_MORE_PAGE_SECTION_PADDING_1)
                    }), 
                    AboutPageList = v5.createElement(v15, {
                        LayoutOrder = 1, 
                        itemList = v48, 
                        renderItem = v40.renderItem, 
                        rowHeight = v10.MORE_PAGE_ROW_HEIGHT
                    }), 
                    FmodCreditsText = v5.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, v51.Size), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Text = v49.fmodCreditsText, 
                        Font = v51.Font, 
                        TextSize = v51.Size, 
                        TextColor3 = v51.Color, 
                        TextTransparency = v51.Transparency, 
                        LayoutOrder = 2
                    }), 
                    BuildVersionText = v5.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, v51.Size), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Text = v49.buildVersionText, 
                        Font = v51.Font, 
                        TextSize = v51.Size, 
                        TextColor3 = v51.Color, 
                        TextTransparency = v51.Transparency, 
                        LayoutOrder = 3
                    }), 
                    ClientCSVersionText = v5.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, v51.Size), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Text = v49.coreScriptVersionText, 
                        Font = v51.Font, 
                        TextSize = v51.Size, 
                        TextColor3 = v51.Color, 
                        TextTransparency = v51.Transparency, 
                        LayoutOrder = 4
                    }), 
                    DiscoveryVersionText = if not not l_FFlagLuaAppAddDiscoveryOtaVersion_0 and v40.discoveryVersion ~= nil then v18.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, v51.Size), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Text = v49.discoveryScriptVersionText, 
                        Font = v51.Font, 
                        TextSize = v51.Size, 
                        TextColor3 = v51.Color, 
                        TextTransparency = v51.Transparency, 
                        LayoutOrder = 5
                    }) else nil, 
                    ClientChannelText = v5.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, v51.Size), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Text = v49.clientChannelText, 
                        Font = v51.Font, 
                        TextSize = v51.Size, 
                        TextColor3 = v51.Color, 
                        TextTransparency = v51.Transparency, 
                        LayoutOrder = not l_FFlagLuaAppAddDiscoveryOtaVersion_0 and 5 or 6
                    })
                })
            })
        });
    end;
    return v12({
        buildVersionText = {
            "CommonUI.Features.Label.VersionWithNumber"; 
            versionNumber = l_l_RunService_0_RobloxVersion_0
        }, 
        fmodCreditsText = "CommonUI.Features.Label.FMODCredits", 
        clientChannelText = {
            "CommonUI.Features.Label.ChannelWithChannelName"; 
            channelName = l_l_RunService_0_RobloxClientChannel_0
        }, 
        coreScriptVersionText = {
            "CommonUI.Features.Label.ClientCoreScriptVersion"; 
            clientCoreScriptVersion = l_l_RunService_0_CoreScriptVersion_0
        }, 
        discoveryScriptVersionText = if not l_FFlagLuaAppAddDiscoveryOtaVersion_0 then nil else {
            "CommonUI.Features.Label.DiscoveryScriptVersion"; 
            discoveryScriptVersion = v40.discoveryVersion
        }
    })(function(v53)
        return l_withStyle_0(function(v54)
            return v52(v53, v54.Theme.BackgroundDefault, (v4.Dictionary.join(v54.Theme.TextDefault, {
                Font = v54.Font.Footer.Font, 
                Size = v54.Font.BaseSize * v54.Font.Footer.RelativeSize
            })));
        end);
    end);
end;
v34 = v6.connect(function(v55, _)
    return {
        formFactor = v55.FormFactor
    };
end)((l_RoactAppPolicy_0.connect(function(v57, _)
    return {
        aboutPageType = v57.getAboutPageType(), 
        disableWebViewSupport = not v57.getWebViewSupport()
    };
end)(v34)));
if not l_GetFFlagTenFootMoreSettingsAndAboutRefactor_0() then
    return v34;
else
    return function(v59)
        local v60 = v20.useUiModeInfo().uiMode == l_UiMode_0.TenFoot;
        local v62 = v19(function(v61)
            return v61.getAboutPageType();
        end);
        if not v60 then
            return v18.createElement(v34, v59);
        else
            return v18.createElement(v23, {
                itemList = v4.List.map(v11.GetItemsInPage(v62), function(v63)
                    return v63.contents;
                end), 
                topbarHeight = if v62 == v9.TenFootAbout then l_Constants_0.TOP_BAR_CANVAS_SIZE.Y else 0
            });
        end;
    end;
end;

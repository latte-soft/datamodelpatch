local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v5 = require(l_Modules_0.Common.memoize);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_ApiFetchGameDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GameDetails.ApiFetchGameDetails;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v10 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v11 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v13 = require(l_Modules_0.LuaApp.Components.LoadingSkeleton);
local v14 = require(l_Modules_0.LuaApp.Components.Games.GameMediaAccordionView);
local v15 = require(l_Modules_0.LuaApp.Components.GameDetails.GameInfoList);
local v16 = require(l_Modules_0.LuaApp.Components.GameDetails.GameHeader);
local v17 = require(l_Modules_0.LuaApp.Components.GameDetails.GamePlaysAndRatings);
local v18 = require(l_Modules_0.LuaApp.Components.GameDetails.RecommendedGameCarousel);
local v19 = require(l_Modules_0.LuaApp.Components.GameDetails.SwapToSourceButton);
local v20 = require(l_Modules_0.LuaApp.Thunks.Games.FetchGameDetailsPageData);
local v21 = require(l_Modules_0.LuaApp.Thunks.Games.RecommendedGames);
local v22 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v23 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v24 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v25 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v26 = require(l_Modules_0.LuaApp.Components.VirtualEvents.EventsListWrapper);
local v27 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v27.Style.withStyle;
local l_LoadingStateContainer_0 = v27.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v27.App.Loading.Enum.RetrievalStatus;
local l_EmptyState_0 = v27.App.Indicator.EmptyState;
local l_ExpandableTextArea_0 = v27.App.Text.ExpandableTextArea;
local v33 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.ExperienceMediaGallery);
local l_GetFFlagEnableSwapToSourceButton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableSwapToSourceButton;
local v35 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppShowPillContainsStrongLanguage);
local v36 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppShowPillContainsStrongLanguageContent);
local v37 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppShowPillContainsStrongLanguageIXP);
local v38 = require(l_Modules_0.LuaApp.Flags.GetFStringLuaAppShowPillContainsStrongLanguageLayer);
local l_GetFFlagEDPContextRedesign_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEDPContextRedesign;
local v40 = {
    [1] = {
        Size = UDim2.new(0.5, 0, 0, 35)
    }, 
    [2] = {
        Size = UDim2.new(0.25, 0, 0, 24)
    }, 
    [3] = {
        Size = UDim2.new(1, 0, 0, 200)
    }, 
    [4] = {
        Size = UDim2.new(1, 0, 0, 24)
    }, 
    [5] = {
        Size = UDim2.new(0.6, 0, 0, 24)
    }
};
local function _(v41)
    if v41 < 600 then
        return 20;
    else
        return 40;
    end;
end;
local _ = function(v43)
    if v43 == nil then
        return false;
    else
        for _, v45 in pairs(v43) do
            if not (not (v45.name == "strong-language") or not v45.contains) then
                return true;
            end;
        end;
        return false;
    end;
end;
local v47 = v2.PureComponent:extend("GameDetailsCard");
v47.init = function(v48)
    v22.isType(v48.props.universeId, "string", "GameDetailsCard.init.universeId");
    v48.fetchGameDetailsPageData = function()
        return v48.props.fetchGameDetailsPageData(v48.props.networking, v48.props.universeId);
    end;
    v48.headerFrameRef = v2.createRef();
    if l_GetFFlagEnableSwapToSourceButton_0() then
        v48.isMounted = false;
        v48.state = {
            showSource = false
        };
        v48.onSwapToSource = function()
            if v48.isMounted then
                v48:setState({
                    showSource = not v48.state.showSource
                });
            end;
        end;
    end;
    v48.onListLayoutAbsoluteContentSizeChanged = function(v49)
        if v48.headerFrameRef.current then
            v48.headerFrameRef.current.Size = UDim2.new(1, 0, 0, v49.AbsoluteContentSize.Y);
        end;
    end;
end;
v47.renderOnLoading = function(_, v51)
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 0), 
            PaddingLeft = UDim.new(0, v51), 
            PaddingRight = UDim.new(0, v51)
        }), 
        Skeleton = v2.createElement(v13, {
            Size = UDim2.new(1, 0, 1, 0), 
            createLayout = function()
                return v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 15)
                });
            end, 
            panels = v40
        })
    });
end;
v47.renderOnLoaded = function(v52, v53, v54)
    local l_universeId_0 = v52.props.universeId;
    local l_gameDetail_0 = v52.props.gameDetail;
    local l_gameInfo_0 = v52.props.gameInfo;
    local v58 = not not l_gameDetail_0 and l_gameDetail_0.rootPlaceId or l_gameInfo_0 and l_gameInfo_0.placeId;
    local v59 = v52.props.showRecommendedGames and v52.props.enableRecommendedGames;
    local v60 = l_gameDetail_0 and v52.props.enableSocial;
    local v61 = l_gameDetail_0 and v52.props.enableGameInfoList;
    local l_enableGamePlaysAndRatings_0 = v52.props.enableGamePlaysAndRatings;
    local v63 = nil;
    local v64 = nil;
    local v65 = v52.props.showGamePassPreview and v52.props.enableGamePassPreview;
    local l_showGameDetailsLayoutChanges_0 = v52.props.showGameDetailsLayoutChanges;
    local v67 = nil;
    local l_l_gameDetail_0_0 = l_gameDetail_0;
    if l_l_gameDetail_0_0 then
        l_l_gameDetail_0_0 = false;
        if l_gameDetail_0.description ~= nil then
            l_l_gameDetail_0_0 = l_gameDetail_0.description ~= "";
        end;
    end;
    local l_showGlobalCounters_0 = v52.props.showGlobalCounters;
    local l_ageRecommendations_0 = v52.props.ageRecommendations;
    local v71 = nil;
    local v72 = nil;
    if l_ageRecommendations_0 then
        local l_summary_0 = l_ageRecommendations_0.summary;
        v71 = if not not l_summary_0 and l_summary_0.ageRecommendation then l_summary_0.ageRecommendation.displayName else nil;
        if not v36() then
            v72 = nil;
        else
            local l_descriptorUsages_0 = v52.props.ageRecommendations.descriptorUsages;
            if l_descriptorUsages_0 == nil then
                v72 = false;
            else
                for _, v76 in pairs(l_descriptorUsages_0) do
                    if not (not (v76.name == "strong-language") or not v76.contains) then
                        v72 = true;
                        goto label0 --[[  true, false  ]];
                    end;
                end;
                v72 = false;
            end;
        end;
    end;
    ::label0::;
    local v77 = if not v37() then nil else v52.props.isShowContainsStrongLanguageWarningEnabled;
    local v78 = if not v35() then nil else v52.props.containsStrongLanguage or v72;
    if l_GetFFlagEnableSwapToSourceButton_0() then
        local l_l_gameDetail_0_1 = l_gameDetail_0;
        if l_l_gameDetail_0_1 then
            l_l_gameDetail_0_1 = false;
            if l_gameDetail_0.sourceDescription ~= nil then
                l_l_gameDetail_0_1 = l_gameDetail_0.sourceDescription ~= "";
            end;
        end;
        local l_l_gameDetail_0_2 = l_gameDetail_0;
        if l_l_gameDetail_0_2 then
            l_l_gameDetail_0_2 = false;
            if l_gameDetail_0.sourceName ~= nil then
                l_l_gameDetail_0_2 = l_gameDetail_0.sourceName ~= "";
            end;
        end;
        v63 = v52.props.enableSwapToSource and (l_l_gameDetail_0_2 or l_l_gameDetail_0_1);
        v64 = v52.state.showSource;
        v67 = l_gameDetail_0 and (v64 and l_gameDetail_0.sourceDescription or l_gameDetail_0.description);
    end;
    return l_withStyle_0(function(v81)
        return v2.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            ListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 24)
            }), 
            PagePadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v54), 
                PaddingRight = UDim.new(0, v54), 
                PaddingTop = if not not l_GetFFlagEDPContextRedesign_0() and v52.props.topPaddingBinding then v52.props.topPaddingBinding:map(function(v82)
                    return UDim.new(0, v82);
                end) else UDim.new(0, 0), 
                PaddingBottom = UDim.new(0, 20)
            }), 
            HeaderFrame = v2.createElement("Frame", {
                LayoutOrder = 1, 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                [v2.Ref] = v52.headerFrameRef, 
                [v2.Change.AbsoluteSize] = if not l_GetFFlagEDPContextRedesign_0() then nil else v52.props.onHeaderFrameSizeChanged, 
                AutomaticSize = Enum.AutomaticSize.None
            }, {
                ListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, not l_GetFFlagEDPContextRedesign_0() and 12 or 20), 
                    [v2.Change.AbsoluteContentSize] = v52.onListLayoutAbsoluteContentSizeChanged
                }), 
                MediaGalleryFrame = if not l_GetFFlagEDPContextRedesign_0() then nil else v2.createElement("Frame", {
                    LayoutOrder = 1, 
                    Position = UDim2.new(0, 0, 0, 0), 
                    Size = UDim2.new(1, v54 * 2, 0, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    MediaGallery = v2.createElement(v33, {
                        LayoutOrder = 1, 
                        universeId = l_universeId_0, 
                        deviceType = "Phone"
                    })
                }), 
                Header = v2.createElement(v16, {
                    LayoutOrder = not l_GetFFlagEDPContextRedesign_0() and 1 or 2, 
                    universeId = l_universeId_0, 
                    withNewThemeProvider = true, 
                    showSource = v64, 
                    ageSummary = v71, 
                    isShowContainsStrongLanguageWarningEnabled = if not v37() then nil else v77, 
                    containsStrongLanguage = if not v35() then nil else v78, 
                    showVisits = l_showGameDetailsLayoutChanges_0
                }), 
                ThumbnailAccordion = if not l_GetFFlagEDPContextRedesign_0() then v2.createElement(v14, {
                    LayoutOrder = 2, 
                    universeId = l_universeId_0, 
                    placeId = v58, 
                    width = v53 - 2 * v54, 
                    withNewThemeProvider = true
                }) else nil
            }), 
            Description = if not not l_showGameDetailsLayoutChanges_0 and l_l_gameDetail_0_0 then v2.createElement(l_ExpandableTextArea_0, {
                Text = if not l_GetFFlagEnableSwapToSourceButton_0() then l_gameDetail_0 and l_gameDetail_0.description else v67, 
                compactNumberOfLines = 3, 
                padding = Vector2.new(0, 0), 
                LayoutOrder = 3
            }) else l_l_gameDetail_0_0 and v2.createElement(v10, {
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 0, 0), 
                Text = if not l_GetFFlagEnableSwapToSourceButton_0() then l_gameDetail_0 and l_gameDetail_0.description else v67, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                BackgroundTransparency = 1, 
                Font = v81.Font.Body.Font, 
                TextSize = v81.Font.BaseSize * v81.Font.Body.RelativeSize, 
                TextColor3 = v81.Theme.TextDefault.Color, 
                TextTransparency = v81.Theme.TextDefault.Transparency
            }), 
            SwapToSourceButton = (l_GetFFlagEnableSwapToSourceButton_0() and v63) and v2.createElement(v19, {
                layoutOrder = 4, 
                universeId = l_universeId_0, 
                showSource = v64, 
                padding = 30, 
                onSwapToSource = v52.onSwapToSource, 
                font = v81.Font.Body.Font, 
                textColor = v81.Theme.TextDefault.Color, 
                textSize = v81.Font.BaseSize * v81.Font.Body.RelativeSize
            }), 
            PlaysAndRatings = l_enableGamePlaysAndRatings_0 and v2.createElement(v17, {
                LayoutOrder = if not l_showGameDetailsLayoutChanges_0 then l_GetFFlagEnableSwapToSourceButton_0() and 5 or 4 else l_GetFFlagEnableSwapToSourceButton_0() and 6 or 5, 
                universeId = l_universeId_0, 
                containerWidth = v53 - 2 * v54, 
                rowPadding = 20, 
                withNewThemeProvider = true, 
                showGlobalCounters = l_showGlobalCounters_0, 
                hideVisits = l_showGameDetailsLayoutChanges_0
            }), 
            InfoList = v61 and v2.createElement(v15, {
                LayoutOrder = if not l_showGameDetailsLayoutChanges_0 then l_GetFFlagEnableSwapToSourceButton_0() and 6 or 5 else l_GetFFlagEnableSwapToSourceButton_0() and 5 or 4, 
                universeId = l_universeId_0, 
                leftPadding = v54, 
                rightPadding = v54, 
                withNewThemeProvider = true, 
                showSocial = v60, 
                ageRecommendations = l_ageRecommendations_0, 
                width = v53, 
                enableGamePassPreview = v65
            }), 
            EventsList = v2.createElement(v26, {
                layoutOrder = not l_GetFFlagEnableSwapToSourceButton_0() and 7 or 8, 
                universeId = l_universeId_0, 
                referralSource = "expDetailsPage"
            }), 
            RecommendedGames = v59 and v2.createElement("Frame", {
                LayoutOrder = not l_GetFFlagEnableSwapToSourceButton_0() and 8 or 9, 
                Size = UDim2.new(1, v54 * 2, 0, 0), 
                BorderSizePixel = 0, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                Layout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                Padding = v2.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, v54), 
                    PaddingLeft = UDim.new(0, v54), 
                    PaddingRight = UDim.new(0, v54)
                }), 
                Carousel = v2.createElement(v18, {
                    universeId = l_universeId_0, 
                    withNewThemeProvider = true, 
                    gameDetailsViewWidth = v53, 
                    onPeekViewClosed = v52.props.onPeekViewClosed
                })
            })
        });
    end);
end;
v47.renderOnFailed = function(v83, v84, v85, v86)
    if not v83.props.gameInfo then
        return v2.createElement(l_EmptyState_0, {
            onActivated = v83.fetchGameDetailsPageData, 
            text = v84.failedMessage
        });
    else
        return v83:renderOnLoaded(v85, v86);
    end;
end;
v47.getImageSize = function(_, v88, v89, v90, v91)
    local v92 = v89 * 1.8;
    local v93 = v91 / v90;
    local v94 = math.max(v92, v88 * v93);
    return Vector2.new(v94 / v93, v94);
end;
v47.render = function(v95)
    local l_screenSize_0 = v95.props.screenSize;
    local l_globalGuiInset_0 = v95.props.globalGuiInset;
    local l_gameDetailsPageDataStatus_0 = v95.props.gameDetailsPageDataStatus;
    local v99 = l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0);
    local v100 = math.min(v99.X.Offset, 640);
    local l_Offset_0 = v99.Y.Offset;
    local v102 = v100 < 600 and 20 or 40;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = true
    }, {
        GameDetails = v2.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1
        }, {
            Background = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_Offset_0), 
                Position = UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1, 
                ZIndex = 1
            }), 
            LoadingState = l_withLocalization_0({
                failedMessage = "Feature.EmptyStatePage.Message.NoInternet"
            })(function(v103)
                return v2.createElement("Frame", {
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Position = UDim2.new(0, 0, 0, 0), 
                    ZIndex = 2, 
                    BackgroundTransparency = 1
                }, {
                    LoadingStateContainer = v2.createElement(l_LoadingStateContainer_0, {
                        dataStatus = l_RetrievalStatus_0.fromRawValue(l_gameDetailsPageDataStatus_0), 
                        renderOnFailed = function()
                            return v95:renderOnFailed(v103, v100, v102);
                        end, 
                        renderOnLoading = function()
                            return v95:renderOnLoading(v102);
                        end, 
                        renderOnLoaded = function()
                            return v95:renderOnLoaded(v100, v102);
                        end
                    })
                });
            end)
        })
    });
end;
v47.didMount = function(v104)
    if l_GetFFlagEnableSwapToSourceButton_0() then
        v104.isMounted = true;
    end;
    v104.fetchGameDetailsPageData();
end;
v47.willUnmount = function(v105)
    if l_GetFFlagEnableSwapToSourceButton_0() then
        v105.isMounted = false;
    end;
    local l_eventIngest_0 = v105.props.eventIngest;
    local l_universeId_1 = v105.props.universeId;
    local v108 = not not v105.props.gameDetail and v105.props.gameDetail.rootPlaceId or nil;
    local v109 = v105.props.source or "None";
    local v110 = v105.props.index or -1;
    if (l_eventIngest_0 ~= nil and l_universeId_1 ~= nil) and v108 ~= nil then
        l_eventIngest_0:setRBXEventStream("GameDetailsCard", "viewClose", {
            universeId = l_universeId_1, 
            rootPlaceId = v108, 
            source = v109, 
            index = v110
        });
    end;
end;
local v113 = v5(function(v111, v112)
    if v111 == v11.Done and (not (v112 ~= nil) or #v112 == 0) then
        return false;
    else
        return true;
    end;
end);
return (v24.connectUserLayer({
    v25.ExperienceDetailsPageLayer, 
    v38()
}, function(v114, _)
    local v116 = if not v37() then nil else (v114[v38()] or {}).IsShowContainsStrongLanguageWarningEnabled;
    local v117 = v114[v25.ExperienceDetailsPageLayer] or {};
    return {
        showGamePassPreview = v117.showGamePassPreview, 
        showGameDetailsLayoutChanges = v117.showGameDetailsLayoutChanges, 
        isShowContainsStrongLanguageWarningEnabled = if not v37() then nil else v116
    };
end)((l_RoactAppPolicy_0.connect(function(v118, _)
    return {
        enableRecommendedGames = v118.getRecommendedGames(), 
        enableSocial = v118.getSocialLinks(), 
        enableGameInfoList = v118.getGameInfoList(), 
        enableGamePlaysAndRatings = v118.getGamePlaysAndRatings(), 
        enableSwapToSource = v118.getSwapToSourceButton(), 
        showGlobalCounters = v118.getShowGlobalCounters(), 
        enableGamePassPreview = v118.getShowPassesOnExperienceDetails()
    };
end)((l_RoactServices_0.connect({
    networking = v7, 
    eventIngest = v23
})((v3.connect(function(v120, v121)
    local v122 = l_ApiFetchGameDetails_0.GetFetchingStatus(v120, v121.universeId);
    return {
        topBarHeight = 0, 
        gameDetail = v120.GameDetails[v121.universeId], 
        gameDetailsPageDataStatus = v122, 
        gameInfo = v120.Games[v121.universeId], 
        screenSize = v120.ScreenSize, 
        globalGuiInset = v120.GlobalGuiInset, 
        showLoadingBackground = v122 ~= v11.Done, 
        showRecommendedGames = v113(v21.GetFetchingStatus(v120, v121.universeId), v120.RecommendedGameEntries[v121.universeId]), 
        ageRecommendations = v120.AgeRecommendations[v121.universeId], 
        isShowContainsStrongLanguageWarningEnabled = if not v37() then nil else v121.isShowContainsStrongLanguageWarningEnabled, 
        containsStrongLanguage = if not v35() then nil else v120.AssetTextFilterSettings[v121.universeId]
    };
end, function(v123)
    return {
        fetchGameDetailsPageData = function(v124, v125)
            return v123(v20(v124, v125));
        end
    };
end)(v47))))))));

local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.UIBlox);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_EmptyState_0 = v3.App.Indicator.EmptyState;
local l_LoadingStateContainer_0 = v3.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v3.App.Loading.Enum.RetrievalStatus;
local l_LoadingSpinner_0 = v3.App.Loading.LoadingSpinner;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v12 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local v14 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v15 = require(l_Modules_0.LuaApp.Thunks.Search.ApiFetchGameSearchResults);
local v16 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactAnalyticsCommonGameEvents_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local v18 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v19 = require(l_Modules_0.LuaApp.Components.RefreshScrollingFrameWithLoadMore);
local v20 = require(l_Modules_0.LuaApp.Thunks.ConfirmSearch);
local v21 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v22 = require(l_Modules_0.LuaApp.Enum.SearchRetrievalStatus);
local v23 = require(l_Modules_0.LuaApp.Thunks.FetchDataWithErrorToasts);
local v24 = require(l_Modules_0.LuaApp.Components.Games.GameGridTable);
local v25 = require(l_Modules_0.LuaApp.AppPage);
local v26 = require(l_Modules_0.LuaApp.Constants);
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local v28 = require(l_Modules_0.Personalization.Games.GameSortImpressionsDetector);
local v29 = require(l_Modules_0.Personalization.Games.SendGameImpressions);
local l_GetFFlagTenFootUiSearchLoadMore_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagTenFootUiSearchLoadMore;
local l_GetFFlagTenFootUiExperiencesOmniLogFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagTenFootUiExperiencesOmniLogFix;
local l_FFlagCleanPlayerSearchProp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagCleanPlayerSearchProp;
local v33 = l_GetFFlagTenFootUiSearchLoadMore_0();
local function v35(v34)
    return v34.ScreenSize;
end;
return function(v36)
    local v37 = v2.useRef(nil);
    local l_searchKeyword_0 = v36.searchKeyword;
    local l_layoutOrder_0 = v36.layoutOrder;
    local l_searchType_0 = v36.searchType;
    local l_searchUuid_0 = v36.searchUuid;
    local v42 = v2.useMemo(function()
        return l_Signal_0.new();
    end, {});
    local function v45(v43)
        local v44 = v43.RequestsStatus.SearchesInGamesStatus[l_searchUuid_0];
        if v44 == nil then
            v44 = v22.NotStarted;
        end;
        return v44;
    end;
    local v46 = l_useSelector_0(v35);
    local v48 = l_useSelector_0(function(v47)
        return v47.Search.SearchesInGames[l_searchUuid_0] or {
            entries = {}, 
            suggestedKeyword = nil, 
            filteredKeyword = nil, 
            correctedKeyword = nil, 
            hasMoreRows = nil, 
            emphasis = nil, 
            algorithm = nil, 
            suggestionAlgorithm = nil
        };
    end);
    local v49 = l_useSelector_0(v45);
    local v50, v51 = v2.useState(v46);
    local v52, v53 = v2.useState(v50.X);
    local v54 = nil;
    local v55 = nil;
    if v33 then
        local v56, v57 = v2.useState(false);
        v54 = v56;
        v55 = v57;
    end;
    local l_entries_0 = v48.entries;
    local v59 = "SearchPage" .. tostring(l_searchUuid_0);
    if v33 then
        v2.useEffect(function()
            if v49 == v22.Done then
                v55(true);
                return ;
            else
                if not (not (v49 == v22.NotStarted) or not v54) then
                    v55(false);
                end;
                return ;
            end;
        end, {
            v49
        });
    end;
    local v60 = l_useDispatch_0();
    local v61 = l_useDesignTokens_0();
    local v62 = v14(v16);
    local v63 = v14(v21);
    local v64 = v14(l_RoactAnalyticsCommonGameEvents_0);
    local v65 = v14(l_AppSessionService_0);
    local v66 = v14(v18);
    local v67 = l_useNavigation_0();
    local function v69(v68)
        v53(v68.AbsoluteSize.X);
    end;
    local v71 = v2.useCallback(function(v70)
        if v70 then
            v51(v70.AbsoluteSize);
        end;
    end, {});
    local v72 = v2.useCallback(function()
        return v60(v23(v15(v62, {
            searchKeyword = l_searchKeyword_0, 
            searchUuid = l_searchUuid_0, 
            isAppend = true
        })));
    end, {
        v60, 
        v62, 
        l_searchKeyword_0, 
        l_searchUuid_0
    });
    local v73 = v12({
        failedMessage = "Feature.EmptyStatePage.Message.NoInternet", 
        games = "CommonUI.Features.Label.Game", 
        noResultsText = "Feature.GamePage.LabelNoSearchResults", 
        players = "CommonUI.Features.Label.Players"
    });
    v2.useEffect(function()
        if l_searchKeyword_0 == "" then
            return ;
        else
            assert(v67, "Expected navigation, found none");
            assert(v63, "Expected eventIngest, found none");
            assert(v65, "Expected sessionService, found none");
            v60(v20(l_searchKeyword_0, {
                isAutocompleteSuggestion = false, 
                allAutocompleteSuggestions = false, 
                searchType = v26.SearchTypes.Games, 
                playerSearch = if not l_FFlagCleanPlayerSearchProp_0 then l_GetFFlagTenFootUiExperiencesOmniLogFix_0() and true or false else nil, 
                isAvatarAutocompleteEnabled = false, 
                pageOwner = v67.state.routeName, 
                sessionService = v65, 
                eventIngest = v63
            }));
            v60(v15(v62, {
                searchKeyword = l_searchKeyword_0, 
                searchUuid = l_searchUuid_0, 
                isAppend = false
            }));
            return ;
        end;
    end, {
        l_searchKeyword_0, 
        l_searchUuid_0, 
        v60, 
        v63, 
        v65, 
        v62
    });
    local l_SearchBoxAndTypeOffset_0 = v61.LuaApps.Search.SearchBoxAndTypeOffset;
    local function v78(v75)
        local v76 = v48.entries or {};
        local v77 = v76[v75];
        if v77 ~= nil then
            v64.reportOpenGameDetailFromSearch(v77.placeId, v75, #v76, v77.isSponsored, v77.universeId, v25.SearchPage, nil, nil);
        end;
    end;
    if not v33 and l_searchType_0 ~= v26.SearchTypes.Games then
        return v2.createElement(v2.Fragment, nil, {});
    else
        local function v80(v79)
            v29.sendFromSearch(v63, v66, v79, v48.entries, v25.SearchPage, {
                searchUuid = l_searchUuid_0, 
                emphasisFlag = not v48.emphasis and 0 or 1, 
                seeAllFlag = 1
            });
        end;
        local v81;
        if not v33 then
            v81 = false;
            if v48 ~= nil then
                v81 = not v48.hasMoreRows;
                if v81 then
                    v81 = true;
                    if v48.entries ~= nil then
                        v81 = #v48.entries == 0;
                    end;
                end;
            end;
        else
            v81 = false;
            if l_searchType_0 == v26.SearchTypes.Games then
                v81 = false;
                if v48 ~= nil then
                    v81 = not v48.hasMoreRows;
                    if v81 then
                        v81 = true;
                        if v48.entries ~= nil then
                            v81 = #v48.entries == 0;
                        end;
                    end;
                end;
            end;
        end;
        local v82 = if not v33 then nil else v2.useCallback(function()
            if not v81 then
                return v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, -l_SearchBoxAndTypeOffset_0), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    LayoutOrder = l_layoutOrder_0, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    [v2.Change.AbsoluteSize] = v69
                }, {
                    CanvasGroupMask = v2.createElement("CanvasGroup", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 1, 0)
                    }, {
                        ScrollingFrame = v2.createElement(v19, {
                            Size = UDim2.new(1, 0, 1, 0), 
                            Position = UDim2.new(0, 0, 0, 0), 
                            CanvasSize = UDim2.new(1, 0, 1, 0), 
                            BackgroundTransparency = 1, 
                            ref = v37, 
                            onAbsoluteSizeChangedCallback = v71, 
                            onCanvasPositionChangedCallback = function()
                                v42:fire();
                            end, 
                            onLoadMore = not not v48.hasMoreRows and v72 or nil
                        }, {
                            Layout = v2.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                Padding = UDim.new(0, v61.Global.Space_100)
                            }), 
                            Padding = v2.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, 0), 
                                PaddingRight = UDim.new(0, 0), 
                                PaddingTop = UDim.new(0, v26.GAME_GRID_PADDING), 
                                PaddingBottom = UDim.new(0, v26.GAME_GRID_PADDING)
                            }), 
                            GameGridWrapper = v2.createElement("Frame", {
                                Size = UDim2.new(1, 0, 0, 0), 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                BackgroundTransparency = 1
                            }, {
                                Layout = v2.createElement("UIListLayout", {
                                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                                }), 
                                GameGridTable = v2.createElement(v24, {
                                    searchResultGrid = true, 
                                    entries = l_entries_0, 
                                    screenSize = v46, 
                                    windowSize = Vector2.new(v52, v50.Y), 
                                    gameEmphasis = false, 
                                    source = "SearchResults", 
                                    hideGameStats = true, 
                                    useHoverTile = false, 
                                    reportGameDetailOpened = v78, 
                                    horizontalAlignment = Enum.HorizontalAlignment.Left, 
                                    impressionsTag = v59, 
                                    launchExperienceEventContext = v26.AnalyticsContext.SearchExperienceTile
                                }), 
                                GameSortImpressionsDetector = v2.createElement(v28, {
                                    parentRef = v37, 
                                    pageContext = v25.SearchPage, 
                                    impressionsTag = v59, 
                                    scrollViewPositionChangedSignal = v42, 
                                    sendGameImpressions = v80
                                })
                            })
                        })
                    })
                });
            else
                return v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, -l_SearchBoxAndTypeOffset_0), 
                    Position = UDim2.new(0, 0, 0, l_SearchBoxAndTypeOffset_0), 
                    LayoutOrder = l_layoutOrder_0, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, {
                    NoResultsView = v2.createElement(l_EmptyState_0, {
                        text = v73.noResultsText, 
                        maxSizeTextLabel = Vector2.new(v46.X - v61.Global.Size_500, v46.Y)
                    })
                });
            end;
        end, {
            l_SearchBoxAndTypeOffset_0, 
            l_layoutOrder_0, 
            v61, 
            v73, 
            v69, 
            v48, 
            v81, 
            v71, 
            v42, 
            l_entries_0, 
            v72, 
            v46, 
            v50, 
            v52, 
            v78, 
            v59, 
            v80
        });
        local v83 = if not v33 then nil else v2.useCallback(function()
            if v54 and v82 ~= nil then
                return v82();
            else
                return v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, -l_SearchBoxAndTypeOffset_0), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    LayoutOrder = l_layoutOrder_0, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, {
                    LoadingSpinner = v2.createElement(l_LoadingSpinner_0, {
                        size = UDim2.fromOffset(v61.Global.Size_350, v61.Global.Size_350), 
                        position = UDim2.fromScale(0.5, 0.5), 
                        anchorPoint = Vector2.new(0.5, 0.5)
                    })
                });
            end;
        end, {
            v54, 
            v61, 
            v82, 
            l_SearchBoxAndTypeOffset_0, 
            l_layoutOrder_0
        });
        local v84 = if not v33 then nil else v2.useCallback(function()
            return v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, -l_SearchBoxAndTypeOffset_0), 
                Position = UDim2.new(0, 0, 0, l_SearchBoxAndTypeOffset_0), 
                LayoutOrder = l_layoutOrder_0, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                NoResultsView = v2.createElement(l_EmptyState_0, {
                    text = v73.failedMessage, 
                    maxSizeTextLabel = Vector2.new(v46.X - v61.Global.Size_500, v46.Y)
                })
            });
        end, {
            l_SearchBoxAndTypeOffset_0, 
            l_layoutOrder_0, 
            v46, 
            v61, 
            v73.failedMessage
        });
        local v85 = if not v33 then nil else v2.useCallback(function()
            v42:fire();
        end, {
            v42
        });
        if v33 and l_searchType_0 ~= v26.SearchTypes.Games then
            return v2.createElement(v2.Fragment, nil, {});
        else
            return if not v33 then v2.createElement(l_LoadingStateContainer_0, {
                dataStatus = l_RetrievalStatus_0.fromRawValue(v49), 
                renderOnEmpty = function()
                    return nil;
                end, 
                renderOnFailed = function()
                    return v2.createElement("Frame", {
                        Size = UDim2.new(1, 0, 1, -l_SearchBoxAndTypeOffset_0), 
                        Position = UDim2.new(0, 0, 0, l_SearchBoxAndTypeOffset_0), 
                        LayoutOrder = l_layoutOrder_0, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0
                    }, {
                        NoResultsView = v2.createElement(l_EmptyState_0, {
                            text = v73.failedMessage, 
                            maxSizeTextLabel = Vector2.new(v46.X - v61.Global.Size_500, v46.Y)
                        })
                    });
                end, 
                renderOnLoading = function()
                    return v2.createElement("Frame", {
                        Size = UDim2.new(1, 0, 1, -l_SearchBoxAndTypeOffset_0), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        LayoutOrder = l_layoutOrder_0, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0
                    }, {
                        LoadingSpinner = v2.createElement(l_LoadingSpinner_0, {
                            size = UDim2.fromOffset(v61.Global.Size_350, v61.Global.Size_350), 
                            position = UDim2.fromScale(0.5, 0.5), 
                            anchorPoint = Vector2.new(0.5, 0.5)
                        })
                    });
                end, 
                renderOnLoaded = function()
                    if not v81 then
                        return v2.createElement("Frame", {
                            Size = UDim2.new(1, 0, 1, -l_SearchBoxAndTypeOffset_0), 
                            Position = UDim2.new(0, 0, 0, 0), 
                            LayoutOrder = l_layoutOrder_0, 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            [v2.Change.AbsoluteSize] = v69
                        }, {
                            CanvasGroupMask = v2.createElement("CanvasGroup", {
                                BackgroundTransparency = 1, 
                                Size = UDim2.new(1, 0, 1, 0)
                            }, {
                                ScrollingFrame = v2.createElement(v19, {
                                    Size = UDim2.new(1, 0, 1, 0), 
                                    Position = UDim2.new(0, 0, 0, 0), 
                                    CanvasSize = UDim2.new(1, 0, 1, 0), 
                                    BackgroundTransparency = 1, 
                                    ref = v37, 
                                    onAbsoluteSizeChangedCallback = v71, 
                                    onCanvasPositionChangedCallback = v85, 
                                    onLoadMore = (not not v48.hasMoreRows and v72) and not v48.hasMoreRows or nil
                                }, {
                                    Layout = v2.createElement("UIListLayout", {
                                        FillDirection = Enum.FillDirection.Vertical, 
                                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                                        SortOrder = Enum.SortOrder.LayoutOrder, 
                                        Padding = UDim.new(0, v61.Global.Space_100)
                                    }), 
                                    Padding = v2.createElement("UIPadding", {
                                        PaddingLeft = UDim.new(0, 0), 
                                        PaddingRight = UDim.new(0, 0), 
                                        PaddingTop = UDim.new(0, v26.GAME_GRID_PADDING), 
                                        PaddingBottom = UDim.new(0, v26.GAME_GRID_PADDING)
                                    }), 
                                    GameGridWrapper = v2.createElement("Frame", {
                                        Size = UDim2.new(1, 0, 0, 0), 
                                        AutomaticSize = Enum.AutomaticSize.Y, 
                                        BackgroundTransparency = 1
                                    }, {
                                        Layout = v2.createElement("UIListLayout", {
                                            HorizontalAlignment = Enum.HorizontalAlignment.Center
                                        }), 
                                        GameGridTable = v2.createElement(v24, {
                                            searchResultGrid = true, 
                                            entries = l_entries_0, 
                                            screenSize = v46, 
                                            windowSize = Vector2.new(v52, v50.Y), 
                                            gameEmphasis = false, 
                                            source = "SearchResults", 
                                            hideGameStats = true, 
                                            useHoverTile = false, 
                                            reportGameDetailOpened = v78, 
                                            horizontalAlignment = Enum.HorizontalAlignment.Left, 
                                            impressionsTag = v59, 
                                            launchExperienceEventContext = v26.AnalyticsContext.SearchExperienceTile
                                        }), 
                                        GameSortImpressionsDetector = v2.createElement(v28, {
                                            parentRef = v37, 
                                            pageContext = v25.SearchPage, 
                                            impressionsTag = v59, 
                                            scrollViewPositionChangedSignal = v42, 
                                            sendGameImpressions = v80
                                        })
                                    })
                                })
                            })
                        });
                    else
                        return v2.createElement("Frame", {
                            Size = UDim2.new(1, 0, 1, -l_SearchBoxAndTypeOffset_0), 
                            Position = UDim2.new(0, 0, 0, l_SearchBoxAndTypeOffset_0), 
                            LayoutOrder = l_layoutOrder_0, 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0
                        }, {
                            NoResultsView = v2.createElement(l_EmptyState_0, {
                                text = v73.noResultsText, 
                                maxSizeTextLabel = Vector2.new(v46.X - v61.Global.Size_500, v46.Y)
                            })
                        });
                    end;
                end
            }) else v2.createElement(l_LoadingStateContainer_0, {
                dataStatus = l_RetrievalStatus_0.fromRawValue(v49), 
                renderOnEmpty = function()
                    return nil;
                end, 
                renderOnFailed = v84, 
                renderOnLoading = v83, 
                renderOnLoaded = v82
            });
        end;
    end;
end;

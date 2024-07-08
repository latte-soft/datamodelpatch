local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.React);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v6.Focusable;
local v8 = require(l_CorePackages_0.UIBlox);
local l_useInitializedValue_0 = v8.Core.Hooks.useInitializedValue;
local v10 = require(l_Modules_0.AvatarExperience.Common.Hooks.useFullView);
local v11 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v13 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local l_PeekView_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekView;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v17 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.BoundInputsUpdater);
local v19 = require(l_Modules_0.LuaApp.Constants);
local v20 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FiltersTopBar);
local v21 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.ResetApplyBar);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v23 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v26 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterSection);
local v27 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.Filters);
local v28 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.Sorts);
local v29 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useFiltersController);
local v30 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useSortsController);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v32 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
local v33 = require(l_Modules_0.AvatarExperience.Common.Context.NamedRefsContext);
local v34 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAvatarRoute);
local v35 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useCloseFiltersSignal);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_useStyle_0 = v8.Core.Style.useStyle;
local l_useIsGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useIsGamepad;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v40 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.SendApplySortAndFiltersAnalytics);
local v41 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v42 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local _ = require(l_Modules_0.AvatarExperience.Catalog.SearchTypes);
local v44 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.NavigateToSearch);
local v45 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v46 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAvatarExperienceFocusNavigationBindings);
local v47 = require(l_Modules_0.AvatarExperience.Common.Hooks.useOverlayClosedCallback);
local v48 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXRemovePriceFilters);
local v49 = require(l_Modules_0.AvatarExperience.Flags.RemovePriceFiltersIXPTest);
local v50 = require(l_Modules_0.AvatarExperience.Experiments.AXPersistentCatalogFiltersIXPTest);
local v51 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v52 = l_GuiService_0:IsTenFootInterface();
local function _(v53)
    return (v53 + 24) + 24;
end;
local function _()
    local v55 = v34();
    local v56 = if not (v55.opaque.name == v24.CatalogSearch) then nil else v55.opaque.params.detail;
    return (l_useSelector_0(function(v57)
        if not v56 then
            return nil;
        else
            return v57.SearchesParameters[v56];
        end;
    end));
end;
local function v100(v59)
    local v60 = v29();
    local v61 = v30();
    local v62 = l_useNavigation_0();
    local v63 = v4.useContext(v33);
    local v64 = v6.useRefCache();
    local v65 = v60.canApply or v61.canApply;
    local v66 = v60.canReset or v61.canReset;
    local v67 = l_useDispatch_0();
    local v68 = v41(v42);
    local v69 = v35();
    local v70 = v34();
    local v71 = if not (v70.opaque.name == v24.CatalogSearch) then nil else v70.opaque.params.detail;
    local l_v71_0 = v71 --[[ copy: 14 -> 32 ]];
    local v74 = l_useSelector_0(function(v73)
        if not l_v71_0 then
            return nil;
        else
            return v73.SearchesParameters[l_v71_0];
        end;
    end);
    v4.useEffect(function()
        if v50.isEnabled() then
            v51.logExposure(v50);
        end;
    end, {});
    v70 = function()
        v60.apply();
        v61.apply();
        v69:fire();
        v67(v40(v68));
        if v74 then
            v67(v44(v62, v74));
        end;
    end;
    local function v75()
        v60.reset();
        v61.reset();
    end;
    v71 = v10() == v11.SceneFullView;
    local v76 = l_useSelector_0(v45);
    local v77 = v6.useRootFocusController();
    local v78 = nil;
    local v79 = nil;
    if not v76 then
        v78 = UDim2.fromScale(v17.LandscapeNavWidth, 0);
        v79 = UDim2.fromScale(v17.LandscapeSceneWidth, 1);
    else
        v78 = UDim2.fromScale(0, 0);
        v79 = UDim2.fromScale(1, 1);
    end;
    local v80 = l_useIsGamepad_0();
    local v81 = l_useSelector_0(v13.selectTopBarHeight);
    local l_Theme_0 = l_useStyle_0().Theme;
    local v83 = 80;
    if not (not v80 or not v52) then
        v83 = v83 + v19.GAMEPAD_BOTTOM_BAR_SIZE;
    end;
    local v84 = l_useLocalization_0({
        sorts = "Feature.Catalog.Label.Filter.Sorts", 
        filters = "Feature.Catalog.Label.Filter.Filters"
    });
    local v85, v86 = v4.useBinding(0);
    local v87 = v85:map(v32.mapHeightToSize);
    local v88, v89 = v4.useBinding(0);
    local v90 = v88:map(v32.mapHeightToSize);
    local v91 = v4.useRef(nil);
    return v4.createElement("Frame", {
        ref = v46({
            overlayClosedCallback = v47(v77)
        }), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.fromScale(1, 1), 
        Visible = not v71
    }, (v4.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        Visible = not v71, 
        restorePreviousChildFocus = true, 
        focusController = v77, 
        defaultChild = v64.SortAndFiltersContent, 
        ref = v63[v24.SortAndFilters], 
        NextSelectionLeft = v63[v24.Catalog], 
        inputBindings = {
            NavigateBack = v6.Input.onBegin(Enum.KeyCode.ButtonB, function()
                v23.closeFocusedScreen(v62);
            end)
        }
    }, {
        GamepadFocusHandlerForPage = v4.createElement(v22, {
            focusController = v77, 
            captureFocusOnMount = true
        }), 
        NavigationEventsLogger = v4.createElement(v16), 
        BoundInputsUpdater = v4.createElement(v18), 
        Content = v4.createElement(l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = v79, 
            Position = v78, 
            restorePreviousChildFocus = true, 
            inputBindings = {
                Close = v6.Input.onBegin(Enum.KeyCode.ButtonB, function()
                    v69:fire();
                end, {
                    key = "CommonUI.Controls.Action.Back"
                }), 
                Apply = if not v65 then nil else v6.Input.onBegin(Enum.KeyCode.ButtonX, v70, {
                    key = "CommonUI.Messages.Action.Apply"
                }), 
                Reset = if not v66 then nil else v6.Input.onBegin(Enum.KeyCode.ButtonY, v75, {
                    key = "CommonUI.Messages.Action.Reset"
                })
            }
        }, {
            Background = v4.createElement("TextButton", {
                BackgroundTransparency = not not v76 and l_Theme_0.Overlay.Transparency or 1, 
                BackgroundColor3 = l_Theme_0.Overlay.Color, 
                Size = UDim2.new(1, 0, 1, v81), 
                Position = UDim2.fromOffset(0, -v81), 
                ZIndex = 1, 
                Text = "", 
                AutoButtonColor = false
            }), 
            FiltersTopBar = v4.createElement(v20, {
                buttonRef = v64.FiltersTopBar, 
                NextSelectionDown = v64.SortAndFiltersContent, 
                closePeekViewSignal = v69
            }), 
            PeekViewContainer = v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                ClipsDescendants = true, 
                Position = UDim2.fromOffset(0, v81), 
                Size = UDim2.new(1, 0, 1, -v81), 
                ZIndex = 2
            }, {
                PeekView = v4.createElement(l_PeekView_0, {
                    briefViewContentHeight = UDim.new(0, 0), 
                    mountAnimation = true, 
                    mountAsFullView = true, 
                    canDragFullViewToBrief = false, 
                    showDraggerInClosedState = false, 
                    returnToFullView = true, 
                    thumbstickScrollEnabled = true, 
                    contentFrameRef = v91, 
                    closeSignal = v69, 
                    viewStateChanged = function(v92, _)
                        if v92 == l_PeekViewState_0.Closed then
                            v62.goBack();
                        end;
                    end, 
                    bottomDockedContainerHeight = v83, 
                    bottomDockedContainerContent = v4.createElement(v21, {
                        height = v83, 
                        canReset = v66, 
                        canApply = v65, 
                        onReset = v75, 
                        onApply = v70, 
                        frameRef = v64.BottomBar, 
                        NextSelectionUp = v64.SortAndFiltersContent
                    }), 
                    backgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                    backgroundTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
                    peekHeaderClose = true, 
                    isScrollingEnabled = true
                }, {
                    SortAndFiltersContent = v4.createElement(l_Focusable_0.Frame, {
                        Size = l_useInitializedValue_0(function()
                            return v4.joinBindings({
                                v85, 
                                v88
                            }):map(function(v94)
                                return UDim2.new(1, 0, 0, ((v94[1] + 24) + 24) + ((v94[2] + 24) + 24));
                            end);
                        end), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        ref = v64.SortAndFiltersContent, 
                        NextSelectionUp = v64.FiltersTopBar, 
                        NextSelectionDown = v64.BottomBar, 
                        [v4.Change.AbsoluteSize] = function(v95)
                            local l_current_0 = v91.current;
                            if not (not v95 or not l_current_0) then
                                local l_Y_0 = v95.AbsoluteSize.Y;
                                l_current_0.AutomaticSize = Enum.AutomaticSize.None;
                                l_current_0.Size = UDim2.new(1, 0, 0, l_Y_0);
                            end;
                        end, 
                        defaultChild = v64.Filters, 
                        restorePreviousChildFocus = true
                    }, {
                        Layout = v4.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Vertical
                        }), 
                        FiltersSection = v4.createElement(v26, {
                            title = v84.filters, 
                            Size = v85:map(function(v98)
                                return UDim2.new(1, 0, 0, (v98 + 24) + 24);
                            end), 
                            contentSize = v87
                        }, {
                            Filters = v4.createElement(v27, {
                                Size = v87, 
                                filtersController = v60, 
                                frameRef = v64.Filters, 
                                NextSelectionDown = v64.Sorts, 
                                onHeightChanged = v86, 
                                removePriceRangeQueryIXP = if not v48() then nil else v59.removePriceRangeQueryIXP
                            })
                        }), 
                        SortsSection = v4.createElement(v26, {
                            title = v84.sorts, 
                            Size = v88:map(function(v99)
                                return UDim2.new(1, 0, 0, (v99 + 24) + 24);
                            end), 
                            contentSize = v90
                        }, {
                            Sorts = v4.createElement(v28, {
                                Size = v90, 
                                sortsController = v61, 
                                frameRef = v64.Sorts, 
                                NextSelectionUp = v64.Filters, 
                                onHeightChanged = v89, 
                                removePriceSortIXP = if not v48() then nil else v59.removePriceSortIXP
                            })
                        })
                    })
                })
            })
        })
    })));
end;
if v48() then
    v100 = v51.connectTestVariables({
        removePriceRangeQueryIXP = v49.RemovePriceRangeQueryForUser, 
        removePriceSortIXP = v49.RemovePriceSortForUser
    })(v100);
end;
return v25(v100);

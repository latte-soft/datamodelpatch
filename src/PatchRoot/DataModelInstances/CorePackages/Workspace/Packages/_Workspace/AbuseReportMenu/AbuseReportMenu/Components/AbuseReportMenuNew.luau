local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.Style);
local v8 = require(l_script_FirstAncestor_0.Components.ReportTypeSelector);
local v9 = require(l_script_FirstAncestor_0.Components.Constants);
local l_ReportModes_0 = v9.ReportModes;
local l_ReportTypes_0 = v9.ReportTypes;
local v12 = require(l_script_FirstAncestor_0.Components.SelectInSceneReportMenu);
local v13 = require(l_script_FirstAncestor_0.Components.Containers.ReportPersonMenuItemsContainer);
local v14 = require(l_script_FirstAncestor_0.Components.Containers.ReportExperienceMenuItemsContainer);
local v15 = require(l_script_FirstAncestor_0.ReportAnything.Utility.ReportAnythingAnalytics);
local v16 = require(l_script_FirstAncestor_0.Analytics.ReportAbuseAnalytics);
local v17 = require(l_script_FirstAncestor_0.ReportAnything.Components.AnnotationModal);
local v18 = require(l_script_FirstAncestor_0.Components.ModalBasedSelectorDialogController);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local v21 = require(l_script_FirstAncestor_0.Hooks.useReportAnythingWithScreenshot);
local v22 = require(l_script_FirstAncestor_0.Reducers.analyticsReducer);
local v23 = require(l_script_FirstAncestor_0.Components.createCleanup);
local v24 = require(l_Parent_0.DsaIllegalContentReporting);
local l_isShowEUDSAIllegalContentReportingLink_0 = v24.isShowEUDSAIllegalContentReportingLink;
local l_DSAReportLink_0 = v24.DSAReportLink;
local l_StyleProviderWithDefaultTheme_0 = v7.StyleProviderWithDefaultTheme;
local v28 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v29 = require(l_RobloxGui_0.Modules.Common.FocusNavigationEffectsWrapper);
local l_FocusNavigableSurfaceIdentifierEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum;
local v31 = v28.FocusNavigationService.new(v28.EngineInterface.CoreGui);
local l_GetFFlagSelectInSceneReportMenu_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSelectInSceneReportMenu;
local v33 = require(l_script_FirstAncestor_0.Utility.isShowSelectInSceneReportMenu);
local l_SegmentedControl_0 = require(l_CorePackages_0.UIBlox).App.Control.SegmentedControl;
local v35 = {
    l_ReportModes_0.Classic, 
    l_ReportModes_0.SelectInScene
};
local v36 = {
    l_ReportTypes_0.Person, 
    l_ReportTypes_0.Experience
};
local v37 = nil;
local l_RobloxTranslator_0 = l_RobloxGui_0.Modules:FindFirstChild("RobloxTranslator");
if l_RobloxTranslator_0 then
    v37 = require(l_RobloxTranslator_0);
end;
local function v67(v39)
    local v40, v41 = v6.useState(false);
    local v42, v43 = v6.useState(1);
    local v44, v45 = v6.useState(1);
    local v46, v47 = v6.useState(nil);
    local v48, v49 = v6.useState(0);
    local v50, v51 = v6.useState(false);
    local v52, v53 = v6.useState({
        width = 0, 
        height = 0
    });
    local v54, v55 = v6.useReducer(v22, v9.AnalyticsInitialState);
    local v56 = v35[v42];
    local v57 = v36[v44];
    local v58, v59 = v21(v40, v39.hideReportTab, v39.showReportTab, (v6.useCallback(v23(v54, v55, v47, v57), {
        v54, 
        v44
    })));
    v6.useEffect(function()
        v39.registerOnReportTabDisplayed(function()
            v41(true);
        end);
        v39.registerOnReportTabHidden(function()
            v41(false);
            v17.unmountAnnotationPage();
            v18.unmountModalSelector();
        end);
        v39.registerSetNextPlayerToReport(function(v60)
            v47(v60);
        end);
        v39.registerOnMenuWidthChange(function(v61)
            v49(v61);
        end);
        v39.registerOnSettingsHidden(function()
            if v16:getAbuseReportSessionEntryPoint() == "" then
                v59({
                    type = v9.ReportAnythingActions.ClearAll
                });
            end;
        end);
    end, {});
    v6.useEffect(function()
        if v40 then
            if #l_Players_0:GetPlayers() <= 1 then
                v51(true);
                v45(2);
                return ;
            else
                v45(1);
                v51(false);
            end;
        else
            v45(0);
            if l_GetFFlagSelectInSceneReportMenu_0() then
                v43(1);
                return ;
            end;
        end;
    end, {
        v40
    });
    v6.useEffect(function()
        if v40 then
            v55({
                type = v9.AnalyticsActions.SetMenuOpenedTimestamp, 
                timestamp = math.floor(workspace:GetServerTimeNow() * 1000)
            });
            v16:startAbuseReportSession("ReportPage");
        end;
        local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
        if l_CurrentCamera_0 ~= nil then
            local l_ViewportSize_0 = l_CurrentCamera_0.ViewportSize;
            v53({
                width = l_ViewportSize_0.X, 
                height = l_ViewportSize_0.Y
            });
            v55({
                type = v9.AnalyticsActions.SetViewportInformation, 
                viewportSizeX = l_ViewportSize_0.X, 
                viewportSizeY = l_ViewportSize_0.Y
            });
        end;
    end, {
        v40, 
        v48
    });
    local v64 = nil;
    local v65 = {
        onReportComplete = v39.onReportComplete, 
        reportAnythingAnalytics = v15, 
        reportAnythingState = v58, 
        reportAnythingDispatch = v59, 
        hideReportTab = v39.hideReportTab, 
        isReportTabVisible = v40, 
        showReportSentPage = v39.showReportSentPage, 
        analyticsState = v54, 
        analyticsDispatch = v55, 
        preselectedPlayer = v46, 
        setPreselectedPlayer = v47, 
        menuWidth = v48, 
        viewportDimension = v52
    };
    if v57 == l_ReportTypes_0.Person then
        v64 = v6.createElement(v13, {
            utilityProps = v65
        });
    elseif v57 == l_ReportTypes_0.Experience then
        v64 = v6.createElement(v14, {
            utilityProps = v65
        });
    end;
    return v6.createElement("Frame", {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0)
    }, {
        MenuLayoutFrame = v6.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            Layout = v6.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = 0, 
                Padding = UDim.new(0, 12)
            }), 
            SelectInSceneToggleFrame = if not v33() then nil else v6.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Position = UDim2.new(0.5, 0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                LayoutOrder = 0
            }, {
                SelectInSceneToggle = v6.createElement(l_SegmentedControl_0, {
                    onTabActivated = function(v66)
                        v43(v66);
                    end, 
                    selectedTabIndex = v42, 
                    tabs = {
                        {
                            tabName = v37:FormatByKey("Feature.ReportAbuse.Action.BuildAReport")
                        }, 
                        {
                            tabName = v37:FormatByKey("Feature.ReportAbuse.Action.SelectInScene")
                        }
                    }, 
                    width = UDim.new(0, v48)
                })
            }), 
            Menu = if v56 == l_ReportModes_0.SelectInScene then v6.createElement(v12) else if v56 == l_ReportModes_0.Classic then v6.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                LayoutOrder = 1
            }, {
                Layout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 12)
                }), 
                ReportTypeSelector = v6.createElement(v8, {
                    label = "Experience or Person?", 
                    abuseType = v36[v44], 
                    layoutOrder = 0, 
                    utilityProps = v65, 
                    isSelectionDisabled = v50, 
                    menuWidth = v48, 
                    onClickLeft = function()
                        v59({
                            type = v9.ReportAnythingActions.ClearAnnotationFlowProperties
                        });
                        v55({
                            type = v9.AnalyticsActions.IncrementExperiencePersonChanged
                        });
                        v45(((v44 - 1) - 1) % #v36 + 1);
                    end, 
                    onClickRight = function()
                        v59({
                            type = v9.ReportAnythingActions.ClearAnnotationFlowProperties
                        });
                        v55({
                            type = v9.AnalyticsActions.IncrementExperiencePersonChanged
                        });
                        v45(((v44 - 1) + 1) % #v36 + 1);
                    end
                }), 
                MenuItemsContainer = v6.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0)
                }, {
                    MenuItems = v64
                }), 
                DSALinkFrame = if not l_isShowEUDSAIllegalContentReportingLink_0() then nil else v6.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0)
                }, {
                    DSALink = v6.createElement(l_DSAReportLink_0)
                })
            }) else nil
        })
    });
end;
return function(v68)
    return v6.createElement(l_StyleProviderWithDefaultTheme_0, {
        withDarkTheme = true
    }, {
        LocalizationProvider = v6.createElement(l_LocalizationProvider_0, {
            localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
        }, {
            FocusNavigationProvider = v6.createElement(v28.FocusNavigationContext.Provider, {
                value = v31
            }, {
                FocusNavigationEffects = v6.createElement(v29, {
                    selectionGroupName = v9.AbuseReportMenuRootName, 
                    focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.RouterView, 
                    automaticSize = Enum.AutomaticSize.Y, 
                    size = UDim2.new(1, 0, 0, 0)
                }, {
                    [v9.AbuseReportMenuRootName] = v6.createElement(v67, v68)
                })
            })
        })
    });
end;

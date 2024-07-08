local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameAssetReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Players_0 = game:GetService("Players");
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_ScreenshotManager_0 = require(l_Parent_0.Screenshot).ScreenshotManager;
local v7 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Resources.Constants);
local v8 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Resources.AnalyticsReducer);
local v9 = require(l_script_FirstAncestor_0.Analysis.SceneAnalysis);
local v10 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.InGameAssetReportSubmitDialog);
local v11 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.InGameAssetReportErrorModal);
local v12 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.InGameAssetReportCompleteModal);
local v13 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.InGameAssetReportLandscapeHeader);
local v14 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.InGameAssetReportPortraitHeaderFooter);
local v15 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.ScreenshotHighlighter);
local v16 = require(l_script_FirstAncestor_0.Utility.buildReport);
local function v18(v17)
    return v17.point;
end;
local function v20(v19)
    return v19.interpretationResult;
end;
return function(v21)
    local v22, v23 = v4.useState({});
    local v24, v25 = v4.useState({});
    local v26, v27 = v4.useState(false);
    local v28, v29 = v4.useState(false);
    local v30, v31 = v4.useState(false);
    local v32, v33 = v4.useState("");
    local v34, v35 = v4.useState(nil);
    local v36, v37 = v4.useState(true);
    local _, v39 = v4.useReducer(v8, v7.AnalyticsInitialState);
    local l_ViewportSize_0 = game.Workspace.CurrentCamera.ViewportSize;
    local v41 = v21.getIsSmallPortraitMode(l_ViewportSize_0);
    v4.useEffect(function()
        v39({
            type = v7.AnalyticsActions.AccumulateForTimeSpent, 
            accumulated_time_ms = workspace:GetServerTimeNow() * -1
        });
        v39({
            type = v7.AnalyticsActions.SetPlaceId, 
            place_id = game.PlaceId
        });
    end, {});
    local v46 = v4.useCallback(function(v42, v43)
        if #v22 == 0 and v32 == "" then
            l_ScreenshotManager_0:TakeScreenshotWithCallback(v33, nil);
        end;
        local v44 = table.clone(v22);
        local v45 = {
            point = v42, 
            interpretationResult = v9.interpretAnnotation(v42 * l_ViewportSize_0, v43 * math.max(l_ViewportSize_0.X, l_ViewportSize_0.Y), function()
            end)
        };
        table.insert(v44, v45);
        v23(v44);
        v25({});
        v39({
            type = v7.AnalyticsActions.IncremementAnnotationCount
        });
        task.defer(v45.interpretationResult.raycastComputation);
    end, {
        v22, 
        v23, 
        v25, 
        v32
    });
    local v49 = v4.useCallback(function()
        if #v22 > 0 then
            local v47 = table.clone(v22);
            local v48 = table.clone(v24);
            table.insert(v48, table.remove(v47));
            v25(v48);
            v23(v47);
            v39({
                type = v7.AnalyticsActions.IncremementAnnotationUndoCount
            });
        end;
    end, {
        v23, 
        v22, 
        v25, 
        v24
    });
    local v52 = v4.useCallback(function()
        if #v24 > 0 then
            local v50 = table.clone(v22);
            local v51 = table.clone(v24);
            table.insert(v50, table.remove(v51));
            v25(v51);
            v23(v50);
            v39({
                type = v7.AnalyticsActions.IncremementAnnotationRedoCount
            });
        end;
    end, {
        v22, 
        v24
    });
    local v54 = v4.useCallback(function()
        if #v22 == 0 and v32 == "" then
            l_ScreenshotManager_0:TakeScreenshotWithCallback(v33, nil);
        end;
        local v53 = v9.extractItemsFromInterpretations(v3.List.map(v22, v20), function()
        end);
        v35(v53);
        v27(true);
        v39({
            type = v7.AnalyticsActions.SetViewportInformation, 
            viewport_size_x = l_ViewportSize_0.X, 
            viewport_size_y = l_ViewportSize_0.Y, 
            is_portrait_mode = v41
        });
        v39({
            type = v7.AnalyticsActions.IncrementNextCount
        });
        task.defer(v53.computation);
    end, {
        v22, 
        v27, 
        v35, 
        v32, 
        l_ViewportSize_0, 
        v41
    });
    local v55 = v4.useCallback(function()
        v39({
            type = v7.AnalyticsActions.SetInteractionType, 
            interaction_type = 2
        });
        v39({
            type = v7.AnalyticsActions.AccumulateForTimeSpent, 
            accumulated_time_ms = workspace:GetServerTimeNow()
        });
        v21.backAction();
    end, {
        v21.backAction
    });
    local v58 = v4.useCallback(function(v56, v57)
        v27(false);
        v29(true);
        v39({
            type = v7.AnalyticsActions.SetInteractionType, 
            interaction_type = 1
        });
        v39({
            type = v7.AnalyticsActions.SetExtractionResults, 
            results = v34, 
            final_annotation_count = #v22
        });
        l_Players_0:ReportAbuseV3(l_Players_0.LocalPlayer, (v16(l_Players_0.LocalPlayer.UserId, v32, v34, v56, v57)));
    end, {
        v34, 
        v27, 
        v29, 
        v32, 
        v22
    });
    local v59 = v4.useCallback(function()
        v35(nil);
        v27(false);
    end, {
        v27, 
        v35
    });
    local v60 = v4.useCallback(function()
        v29(false);
        v39({
            type = v7.AnalyticsActions.AccumulateForTimeSpent, 
            accumulated_time_ms = workspace:GetServerTimeNow()
        });
        v21.onReportComplete();
    end, {
        v21.onReportComplete, 
        v22, 
        v29
    });
    local v61 = v4.useCallback(function()
        v31(true);
    end, {});
    local v62 = v4.useCallback(function()
        v31(false);
    end, {});
    local v63 = v4.useCallback(function()
        if not v36 then
            v39({
                type = v7.AnalyticsActions.SetDidUserResize, 
                did_user_resize = true
            });
        else
            v37(false);
        end;
        if not v26 then
            v23({});
            v25({});
        end;
    end, {
        v36, 
        v26
    });
    local v64 = #v22 > 0;
    local v65 = #v24 > 0;
    local v66 = v3.List.map(v22, v18);
    return l_withLocalization_0({
        mainTitle = "Feature.ReportAbuse.Label.SelectProblem", 
        next = "Feature.ReportAbuse.Action.Next"
    })(function(v67)
        return v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            [v4.Change.AbsoluteSize] = v63
        }, {
            Header = v4.createElement("TextButton", {
                Size = UDim2.new(1, 0, 0, 72), 
                BackgroundTransparency = 1, 
                ZIndex = 2, 
                AutoButtonColor = false
            }, {
                Layout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                InGameAssetReportModeHeader = if not v41 then v4.createElement(v13, {
                    titleText = v67.mainTitle, 
                    nextText = v67.next, 
                    nextAction = v54, 
                    backAction = v55, 
                    undoAnnotationPoints = v49, 
                    redoAnnotationPoints = v52, 
                    isRedoEnabled = v65, 
                    isUndoEnabled = v64, 
                    annotationPoints = v22
                }) else v4.createElement(v14.PortraitModeHeader, {
                    titleText = v67.mainTitle, 
                    nextText = v67.next, 
                    backAction = v55, 
                    undoAnnotationPoints = v49, 
                    redoAnnotationPoints = v52, 
                    isRedoEnabled = v65, 
                    isUndoEnabled = v64, 
                    annotationPoints = v22
                })
            }), 
            Footer = if not v41 then nil else v4.createElement("TextButton", {
                Size = UDim2.new(1, 0, 0, 60), 
                Position = UDim2.new(0, 0, 1, -60), 
                ZIndex = 2, 
                BackgroundTransparency = 1, 
                AutoButtonColor = false
            }, {
                InGameAssetReportModeFooter = v4.createElement(v14.PortraitModeFooter, {
                    nextAction = v54, 
                    annotationPoints = v22, 
                    nextText = v67.next
                })
            }), 
            ScreenshotAnnotation = v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 1, 0), 
                ZIndex = 1
            }, {
                Highlighter = v4.createElement(v15, {
                    annotationPoints = v66, 
                    handleNewAnnotationPoint = v46, 
                    onExceedMaxAnnotationLimit = v61, 
                    ZIndex = 2
                }, {})
            }), 
            ErrorStateModal = if not v30 then nil else v4.createElement(v11, {
                screenSize = l_ViewportSize_0, 
                onBack = v62
            }), 
            SubmitDialog = if not v26 then nil else v4.createElement(v10, {
                screenSize = l_ViewportSize_0, 
                onSubmit = v58, 
                onBack = v59, 
                analyticsDispatch = v39
            }), 
            ReportCompleteModal = if not v28 then nil else v4.createElement(v12, {
                screenSize = l_ViewportSize_0, 
                onClose = v60
            })
        });
    end);
end;

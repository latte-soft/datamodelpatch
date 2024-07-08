local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Localization);
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.RoactAppExperiment);
local v6 = require(l_Parent_1.RoactUtils);
local v7 = require(l_Parent_1.UIBlox);
local v8 = require(l_Parent_0.Analytics.useAnalytics);
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v3.Hooks.useLocalization;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local l_useUserExperiment_0 = v5.useUserExperiment;
local l_IconButton_0 = v7.App.Button.IconButton;
local l_IconSize_0 = v7.App.ImageSet.Enum.IconSize;
local l_Images_0 = v7.App.ImageSet.Images;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local l_Interactable_0 = v7.Core.Control.Interactable;
local l_TooltipOrientation_0 = v7.App.Dialog.Enum.TooltipOrientation;
local l_useStyle_0 = v7.Core.Style.useStyle;
local l_withTooltip_0 = v7.App.Dialog.TooltipV2.withTooltip;
local v21 = require(l_Parent_0.Actions.CaptureManagerOpened);
local v22 = require(l_Parent_0.Analytics.EventNames);
local v23 = require(l_Parent_0.Utils.getCaptureStorageUsage);
local v24 = require(l_Parent_0.App.ScreenshotsPolicy);
local v25 = require(l_Parent_0.Flags.FFlagCapturesManagerGuacPolicy);
local v26 = require(l_Parent_0.Flags.FFlagCaptureStorageBulkManagementM2Enabled);
local l_FFlagEnableBulkManagementExperiment_0 = require(l_Parent_1.SharedFlags).FFlagEnableBulkManagementExperiment;
local l_FStringCapturesTabIXPLayer_0 = require(l_Parent_1.SharedFlags).FStringCapturesTabIXPLayer;
return (v24.connect(function(v29)
    return {
        enableCapturesBulkManagement = v29.enableCapturesBulkManagement()
    };
end)(function(v30)
    local v31 = v8();
    local v32 = l_useStyle_0();
    local v33 = l_useDispatch_0();
    local l_Color_0 = v32.Theme.TextDefault.Color;
    local l_Font_0 = v32.Font.CaptionBody.Font;
    local v36 = v32.Font.BaseSize * v32.Font.CaptionBody.RelativeSize;
    local v37, v38 = v4.useState(false);
    local v39 = l_useLocalization_0({
        oneCaptureLabel = "Feature.Captures.Label.OneCapture", 
        multipleCapturesLabel = {
            "Feature.Captures.Label.CaptureCounts"; 
            numberOfCaptures = v30.itemCount
        }, 
        tooltipTitle = "Feature.Captures.Title.CaptureStorageTooltipTitle", 
        tooltipBody = "Feature.Captures.Label.CaptureStorageTooltipLabel"
    });
    local v41 = l_useSelector_0(function(v40)
        return v40.Screenshots.Captures;
    end);
    local v42 = v4.useCallback(function()
        v38(false);
        v31.fireEvent(v22.CapturesManagerOpened);
        v33(v21());
    end, {});
    local v44 = v4.useCallback(function(_)
        v38(not v37);
    end, {
        v37
    });
    local v45 = v4.useMemo(function()
        return v23(v41);
    end, {
        v41
    });
    local v47 = l_useUserExperiment_0({
        l_FStringCapturesTabIXPLayer_0
    }, function(v46)
        return (v46[l_FStringCapturesTabIXPLayer_0] or {}).CapturesBulkManagementEnabled;
    end);
    local v48 = if v30.itemCount == 1 then v39.oneCaptureLabel else v39.multipleCapturesLabel;
    if not v25 or v30.enableCapturesBulkManagement then
        if not l_FFlagEnableBulkManagementExperiment_0 or v47 then
            return v4.createElement("Frame", {
                BackgroundColor3 = v32.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v32.Theme.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = v30.LayoutOrder, 
                Size = UDim2.new(1, 0, 0, 36)
            }, {
                GridLayout = v4.createElement("UIGridLayout", {
                    CellSize = UDim2.new(0.5, -4, 0, 36), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    FillDirectionMaxCells = 2, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                IconFrame = v4.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 0)
                }, {
                    ListLayout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    SettingIcon = v4.createElement(l_IconButton_0, {
                        icon = l_Images_0["icons/common/settings"], 
                        iconSize = l_IconSize_0.Medium, 
                        onActivated = v42, 
                        showBackground = false
                    })
                }), 
                TextFrame = v4.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 0), 
                    ZIndex = 3
                }, {
                    ListLayout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        Padding = UDim.new(0, 4), 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    ItemCountAndStorageSpaceLabel = v4.createElement("TextLabel", {
                        AutomaticSize = Enum.AutomaticSize.X, 
                        BackgroundTransparency = 1, 
                        Font = l_Font_0, 
                        Size = UDim2.new(0, 0, 0, 20), 
                        Text = if not v26 then ("%*"):format(v48) else ("%*, %*"):format(v48, v45), 
                        TextColor3 = l_Color_0, 
                        TextSize = v36, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    }), 
                    InfoIconWithTooltip = if not v26 then nil else l_withTooltip_0({
                        headerText = v39.tooltipTitle, 
                        bodyText = v39.tooltipBody
                    }, {
                        preferredOrientation = l_TooltipOrientation_0.Bottom, 
                        guiTarget = l_CoreGui_0, 
                        DisplayOrder = 100, 
                        active = v37
                    }, function(v49)
                        local function v51(v50)
                            v38(false);
                            v49(v50);
                        end;
                        return v4.createElement(l_Interactable_0, {
                            Position = UDim2.new(1, 0, 0.5, 0), 
                            AnchorPoint = Vector2.new(1, 0.5), 
                            Size = UDim2.fromOffset(16, 16), 
                            BackgroundTransparency = 1, 
                            [v4.Change.AbsolutePosition] = v51, 
                            [v4.Change.AbsoluteSize] = v51, 
                            [v4.Event.Activated] = v44, 
                            onStateChanged = function()
                            end
                        }, {
                            InfoIcon = v4.createElement(l_ImageSetLabel_0, {
                                Size = UDim2.fromScale(1, 1), 
                                BackgroundTransparency = 1, 
                                Image = l_Images_0["icons/actions/info_small"]
                            })
                        });
                    end)
                })
            });
        else
            return nil;
        end;
    else
        return nil;
    end;
end));

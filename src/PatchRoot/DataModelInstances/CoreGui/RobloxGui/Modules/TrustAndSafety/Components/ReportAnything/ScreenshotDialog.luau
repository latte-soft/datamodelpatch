local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.UIBlox);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Cryo);
local l_ImageSetButton_0 = v2.Core.ImageSet.ImageSetButton;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_ButtonStack_0 = v2.App.Button.ButtonStack;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_Parent_0 = script.Parent.Parent.Parent;
local v10 = require(l_Parent_0.Resources.Assets);
local v11 = require(l_Parent_0.Dependencies);
local v12 = require(l_Parent_0.Components.DebugCanvas);
local v13 = require(l_Parent_0.Components.ReportAnything.ScreenshotHighlighter);
local v14 = require(l_Parent_0.Components.VirtualKeyboardMonitor);
local v15 = require(l_Parent_0.Components.ReportAnything.ScreenshotDialogPortraitModeHeader);
local v16 = require(l_Parent_0.Components.ReportAnything.ScreenshotDialogLandscapeModeHeader);
local v17 = require(l_Parent_0.Utility.AbuseReportBuilder);
local _ = require(l_Parent_0.Utility.ReportAnythingAnalytics);
local v19 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v20 = require(l_Parent_0.Flags.GetFFlagReportAnythingLocalizationEnabled);
local v21 = require(v11.Divider);
local function v23(v22)
    return v3.createElement("Frame", {
        BackgroundTransparency = 0, 
        Size = UDim2.new(1, 0, 0, 60), 
        BackgroundColor3 = Color3.fromHex("#4F545F"), 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.fromScale(0, 1), 
        LayoutOrder = 4
    }, {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        Container = v3.createElement("Frame", {
            Size = UDim2.new(0, 400, 1, 0), 
            BackgroundTransparency = 1
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12), 
                PaddingBottom = UDim.new(0, 12), 
                PaddingLeft = UDim.new(0, 32), 
                PaddingRight = UDim.new(0, 32)
            }), 
            ActionButtons = v3.createElement(l_ButtonStack_0, {
                marginBetween = 8, 
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = function()
                                v22.reportAction(v22.annotationPoints);
                            end, 
                            text = not v20() and "Next" or v19:FormatByKey("Feature.ReportAbuse.Action.Next")
                        }
                    }
                }
            })
        })
    });
end;
return function(v24)
    v3.useEffect(function()
        if v24.reportAnythingAnalytics then
            v24.reportAnythingAnalytics.incrementAnnotationPageSeen();
        end;
    end, {});
    local l_Theme_0 = l_useStyle_0().Theme;
    local v26 = v14.getInstance();
    local function v27()
        warn("OverlayActivated");
        if not v26:isKeyboardJustOff() then
            if v24.dismissAction then
                warn("Menu dismissed");
                v24.dismissAction();
            end;
            return ;
        else
            return ;
        end;
    end;
    local v28, v29 = v3.useState(v4.Dictionary.join({}, v24.initialAnnotationPoints or {}));
    local v30, v31 = v3.useState({});
    local function _()
        local v32 = {};
        for v33, v34 in pairs(v28) do
            v32[v33] = v34;
        end;
        v29(v32);
    end;
    local function v40(_)
        if v24.reportAnythingAnalytics then
            v24.reportAnythingAnalytics.incrementAnnotationPlace();
        end;
        local v37 = {};
        for v38, v39 in pairs(v28) do
            v37[v38] = v39;
        end;
        v29(v37);
        v31({});
    end;
    local function v44()
        if #v28 > 0 then
            if v24.reportAnythingAnalytics then
                v24.reportAnythingAnalytics.incrementAnnotationUndo();
            end;
            table.insert(v30, 1, v28[#v28]);
            table.remove(v28, #v28);
            local v41 = {};
            for v42, v43 in pairs(v28) do
                v41[v42] = v43;
            end;
            v29(v41);
        end;
    end;
    local function v48()
        if #v30 > 0 then
            if v24.reportAnythingAnalytics then
                v24.reportAnythingAnalytics.incrementAnnotationRedo();
            end;
            table.insert(v28, v30[1]);
            table.remove(v30, 1);
            local v45 = {};
            for v46, v47 in pairs(v28) do
                v45[v46] = v47;
            end;
            v29(v45);
        end;
    end;
    local v49 = #v28 > 0;
    local v50 = #v30 > 0;
    return v3.createElement("TextButton", {
        AutoButtonColor = false, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_Theme_0.Overlay.Color, 
        BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        ZIndex = 10, 
        Text = "", 
        [v3.Event.Activated] = v27
    }, {
        ScreenshotDialog = v3.createElement(l_ImageSetButton_0, {
            Active = true, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            Image = v10.Images.RoundedRect.Image, 
            ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            ImageTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
            ScaleType = v10.Images.RoundedRect.ScaleType, 
            SliceCenter = v10.Images.RoundedRect.SliceCenter
        }, {
            HeaderAndContent = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, not v24.isSmallPortraitMode and 0 or -60), 
                BackgroundTransparency = 1
            }, {
                Layout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Header = if not v24.isSmallPortraitMode then v3.createElement(v16, {
                    titleText = v24.titleText, 
                    backAction = v24.backAction, 
                    reportAction = v24.reportAction, 
                    undoAnnotationPoints = v44, 
                    redoAnnotationPoints = v48, 
                    isRedoEnabled = v50, 
                    isUndoEnabled = v49, 
                    annotationPoints = v28
                }) else v3.createElement(v15, {
                    titleText = v24.titleText, 
                    backAction = v24.backAction, 
                    undoAnnotationPoints = v44, 
                    redoAnnotationPoints = v48, 
                    isRedoEnabled = v50, 
                    isUndoEnabled = v49, 
                    annotationPoints = v28
                }), 
                Divider = v3.createElement(v21, {
                    LayoutOrder = 2
                }), 
                ScreenshotAnnotation = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3, 
                    Size = UDim2.new(1, 0, 1, -49), 
                    ZIndex = 1
                }, {
                    Container = v3.createElement("Frame", {
                        Size = UDim2.fromScale(1, 1), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        BackgroundTransparency = 1
                    }, {
                        UIAspectRatioConstraint = v3.createElement("UIAspectRatioConstraint", {
                            AspectRatio = v24.imageAspectRatio
                        }), 
                        Padding = v3.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 16), 
                            PaddingBottom = UDim.new(0, 16), 
                            PaddingLeft = UDim.new(0, 16), 
                            PaddingRight = UDim.new(0, 16)
                        }), 
                        AnnotationLayer = v3.createElement("Frame", {
                            Size = UDim2.new(1, 0, 1, 0), 
                            BorderSizePixel = 2, 
                            BorderMode = Enum.BorderMode.Inset, 
                            BorderColor3 = Color3.fromRGB(255, 255, 255)
                        }, {
                            ScreenshotImage = v3.createElement("ImageLabel", {
                                Size = UDim2.fromScale(1, 1), 
                                Image = v24.screenshot, 
                                ZIndex = 1
                            }, {}), 
                            DebugCanvas = v3.createElement(v12, {
                                identifiedAvatars = v17.getIdentifiedAvatars(), 
                                identifiedAds = v17.getIdentifiedAds(), 
                                ZIndex = 2
                            }), 
                            Highlighter = v3.createElement(v13, {
                                annotationPoints = v28, 
                                handleAnnotationPoints = v40, 
                                setAnnotationCircleRadius = v17.setAnnotationCircleRadius, 
                                setAspectRatioDimensions = v17.setAspectRatioDimensions, 
                                ZIndex = 3
                            }, {})
                        })
                    })
                })
            }), 
            Footer = if not v24.isSmallPortraitMode then nil else v3.createElement(v23, {
                reportAction = v24.reportAction, 
                annotationPoints = v28
            })
        })
    });
end;

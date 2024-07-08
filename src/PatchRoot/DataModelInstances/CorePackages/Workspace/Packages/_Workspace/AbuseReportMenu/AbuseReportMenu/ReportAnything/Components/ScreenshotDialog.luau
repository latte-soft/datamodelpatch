local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.UIBlox);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Cryo);
local l_ImageSetButton_0 = v2.Core.ImageSet.ImageSetButton;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_ButtonStack_0 = v2.App.Button.ButtonStack;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_Parent_0 = script.Parent.Parent;
local v10 = require(l_Parent_0.Resources.Assets);
local v11 = require(l_Parent_0.Components.Divider);
local v12 = require(l_Parent_0.Components.ScreenshotHighlighter);
local v13 = require(l_Parent_0.Utility.VirtualKeyboardMonitor);
local v14 = require(l_Parent_0.Components.ScreenshotDialogPortraitModeHeader);
local v15 = require(l_Parent_0.Components.ScreenshotDialogLandscapeModeHeader);
local _ = require(l_Parent_0.Utility.ReportAnythingAnalytics);
local v17 = nil;
local l_RobloxTranslator_0 = l_RobloxGui_0.Modules:FindFirstChild("RobloxTranslator");
if l_RobloxTranslator_0 then
    v17 = require(l_RobloxTranslator_0);
end;
local function v20(v19)
    if v17 then
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
                                    v19.finishAnnotationAction(v19.annotationPoints);
                                end, 
                                text = v17:FormatByKey("Feature.ReportAbuse.Action.Next")
                            }
                        }
                    }
                })
            })
        });
    else
        return nil;
    end;
end;
return function(v21)
    if v17 then
        local l_Theme_0 = l_useStyle_0().Theme;
        local v23 = v13.getInstance();
        local function v24()
            warn("OverlayActivated");
            if not v23:isKeyboardJustOff() then
                if v21.dismissAction then
                    warn("Menu dismissed");
                    v21.dismissAction();
                end;
                return ;
            else
                return ;
            end;
        end;
        local v25, v26 = v3.useState(v4.Dictionary.join({}, v21.initialAnnotationPoints or {}));
        local v27, v28 = v3.useState({});
        local v29 = v3.useCallback(function()
            v26(table.clone(v25));
        end, {
            v26, 
            v25
        });
        local v30 = v3.useCallback(function()
            v21.reportAnythingAnalytics.incrementAnnotationBack();
            v21.backAction();
        end, {
            v21.backAction, 
            v21.reportAnythingAnalytics
        });
        local v32 = v3.useCallback(function(_)
            v21.reportAnythingAnalytics.incrementAnnotationPlace();
            v29();
            v28({});
        end, {
            v28, 
            v29, 
            v21.reportAnythingAnalytics
        });
        local v33 = v3.useCallback(function()
            if #v25 > 0 then
                v21.reportAnythingAnalytics.incrementAnnotationUndo();
                table.insert(v27, 1, v25[#v25]);
                table.remove(v25, #v25);
                v29();
            end;
        end, {
            v29, 
            v25, 
            v27, 
            v21.reportAnythingAnalytics
        });
        local v34 = v3.useCallback(function()
            if #v27 > 0 then
                v21.reportAnythingAnalytics.incrementAnnotationRedo();
                table.insert(v25, v27[1]);
                table.remove(v27, 1);
                v29();
            end;
        end, {
            v29, 
            v25, 
            v27, 
            v21.reportAnythingAnalytics
        });
        local v36 = v3.useCallback(function(v35)
            v21.reportAnythingAnalytics.setAnnotationNext();
            v21.finishAnnotationAction(v35);
        end, {
            v21.finishAnnotationAction, 
            v21.reportAnythingAnalytics
        });
        local v37 = #v25 > 0;
        local v38 = #v27 > 0;
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
            [v3.Event.Activated] = v24
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
                    Size = UDim2.new(1, 0, 1, not v21.isSmallPortraitMode and 0 or -60), 
                    BackgroundTransparency = 1
                }, {
                    Layout = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Header = if not v21.isSmallPortraitMode then v3.createElement(v15, {
                        titleText = v21.titleText, 
                        backAction = v30, 
                        finishAnnotationAction = v36, 
                        undoAnnotationPoints = v33, 
                        redoAnnotationPoints = v34, 
                        isRedoEnabled = v38, 
                        isUndoEnabled = v37, 
                        annotationPoints = v25
                    }) else v3.createElement(v14, {
                        titleText = v21.titleText, 
                        backAction = v30, 
                        undoAnnotationPoints = v33, 
                        redoAnnotationPoints = v34, 
                        isRedoEnabled = v38, 
                        isUndoEnabled = v37, 
                        annotationPoints = v25
                    }), 
                    Divider = v3.createElement(v11, {
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
                                AspectRatio = v21.imageAspectRatio
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
                                    Image = v21.screenshot, 
                                    ZIndex = 1
                                }, {}), 
                                Highlighter = v3.createElement(v12, {
                                    annotationPoints = v25, 
                                    handleAnnotationPoints = v32, 
                                    setAnnotationCircleRadius = v21.setAnnotationCircleRadius, 
                                    setAnnotationAreaDimensions = v21.setAnnotationAreaDimensions, 
                                    ZIndex = 3
                                }, {})
                            })
                        })
                    })
                }), 
                Footer = if not v21.isSmallPortraitMode then nil else v3.createElement(v20, {
                    finishAnnotationAction = v36, 
                    annotationPoints = v25
                })
            })
        });
    else
        return nil;
    end;
end;

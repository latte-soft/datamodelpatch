local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.UIBlox);
local v3 = require(l_CorePackages_0.Packages.React);
local l_ButtonStack_0 = v2.App.Button.ButtonStack;
local _ = v2.App.Button.Enum.ButtonType;
local l_HeaderBar_0 = v2.App.Bar.HeaderBar;
local l_IconButton_0 = v2.App.Button.IconButton;
local l_IconSize_0 = v2.App.ImageSet.Enum.IconSize;
local l_ImageSetButton_0 = v2.Core.ImageSet.ImageSetButton;
local l_Images_0 = v2.App.ImageSet.Images;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_Button_0 = v2.App.Button.Button;
local l_ButtonType_1 = v2.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v2.App.Button.Enum.StandardButtonSize;
local l_Parent_0 = script.Parent.Parent.Parent;
local v16 = require(l_Parent_0.Resources.Assets);
local v17 = require(l_Parent_0.Dependencies);
local v18 = require(l_Parent_0.Components.ReportAnything.RestartScreenshotDialog);
local _ = require(l_Parent_0.Utility.ReportAnythingAnalytics);
local v20 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v21 = require(l_Parent_0.Flags.GetFFlagReportAnythingLocalizationEnabled);
local v22 = require(v17.Divider);
local function v27(v23)
    local v24, v25 = v3.useState(0);
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Text = v3.createElement("TextLabel", {
            LayoutOrder = -1, 
            Text = v20:FormatByKey("Feature.SettingsHub.Label.SceneCaptured"), 
            Font = v23.font.Header2.Font, 
            TextColor3 = v23.theme.TextEmphasis.Color, 
            TextTransparency = v23.theme.TextEmphasis.Transparency, 
            TextSize = 20, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Size = UDim2.new(0, (v23.viewportWidth - v24) - 50, 1, 0), 
            BackgroundTransparency = 1
        }), 
        RetakeButton = v3.createElement(l_Button_0, {
            buttonType = l_ButtonType_1.Secondary, 
            text = v20:FormatByKey("Feature.ReportAbuse.Action.Retake"), 
            fitContent = true, 
            standardSize = l_StandardButtonSize_0.XSmall, 
            onActivated = v3.useCallback(function()
                v23.setShowRestartDialog(true);
            end, {
                v23.setShowRestartDialog
            }), 
            [v3.Change.AbsoluteSize] = v3.useCallback(function(v26)
                v25(v26.AbsoluteSize.X);
            end, {
                v25
            })
        })
    });
end;
return function(v28)
    v3.useEffect(function()
        if v28.reportAnythingAnalytics then
            v28.reportAnythingAnalytics.incrementAnnotationOptionSeen();
        end;
    end, {});
    local v29 = 60;
    if not (not v21() or not v28.isSmallPortraitMode) then
        v29 = 104;
    end;
    local v30, v31 = v3.useState(false);
    local v32 = l_useStyle_0();
    local l_Theme_0 = v32.Theme;
    local l_Font_0 = v32.Font;
    return v3.createElement("TextButton", {
        AutoButtonColor = false, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_Theme_0.Overlay.Color, 
        BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
        Size = UDim2.fromScale(1, 1), 
        ZIndex = 10, 
        Text = "", 
        [v3.Event.Activated] = v28.onBack
    }, {
        Container = v3.createElement("Frame", {
            Size = if not v28.isSmallPortraitMode then if v28.viewportHeight >= 800 then UDim2.new(0, 800, 0, 800) else UDim2.new(1, 0, 1, 0) else UDim2.new(1, 0, 1, 0), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Theme_0.Overlay.Color, 
            BackgroundTransparency = 0, 
            ZIndex = 10
        }, {
            RestartDialog = v30 and v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                DialogBody = v3.createElement(v18, {
                    ZIndex = 3, 
                    isSmallPortraitMode = v28.isSmallPortraitMode, 
                    onCancel = function()
                        v31(false);
                    end, 
                    onRestart = v28.onRestart
                })
            }), 
            RestartDialogMask = v30 and v3.createElement(l_ImageSetButton_0, {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 0.2, 
                BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                Active = true, 
                AutoButtonColor = false, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Image = v16.Images.RoundedRect.Image, 
                ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                ImageTransparency = 1, 
                ScaleType = v16.Images.RoundedRect.ScaleType, 
                SliceCenter = v16.Images.RoundedRect.SliceCenter
            }, {}), 
            ScreenshotDialog = v3.createElement(l_ImageSetButton_0, {
                Active = true, 
                Size = UDim2.fromScale(1, 1), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = v16.Images.RoundedRect.Image, 
                ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                ImageTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
                ScaleType = v16.Images.RoundedRect.ScaleType, 
                SliceCenter = v16.Images.RoundedRect.SliceCenter
            }, {
                Layout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                HeaderAndContent = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, -v29), 
                    BackgroundTransparency = 1
                }, {
                    Layout = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Header = v3.createElement("Frame", {
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = Color3.fromHex("#4F545F"), 
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, 48)
                    }, {
                        Bar = v3.createElement(l_HeaderBar_0, {
                            backgroundTransparency = 1, 
                            barHeight = 48, 
                            margin = 12, 
                            renderLeft = function()
                                return v3.createElement(l_IconButton_0, {
                                    iconSize = l_IconSize_0.Medium, 
                                    icon = l_Images_0["icons/navigation/pushBack"], 
                                    onActivated = function()
                                        v28.onBack();
                                    end
                                });
                            end, 
                            renderRight = function()
                                if not v21() or not v28.isSmallPortraitMode then
                                    return v3.createElement(l_Button_0, {
                                        buttonType = l_ButtonType_1.Secondary, 
                                        size = if not v21() then UDim2.new(0, not v28.isSmallPortraitMode and 120 or 72, 0, not v28.isSmallPortraitMode and 36 or 28) else nil, 
                                        text = not v21() and "Retake" or v20:FormatByKey("Feature.ReportAbuse.Action.Retake"), 
                                        fitContent = v21(), 
                                        standardSize = if not v21() then nil else l_StandardButtonSize_0.XSmall, 
                                        onActivated = function()
                                            v31(true);
                                        end
                                    });
                                else
                                    return v3.createElement(v27, {
                                        setShowRestartDialog = v31, 
                                        font = l_Font_0, 
                                        theme = l_Theme_0, 
                                        viewportWidth = v28.viewportWidth
                                    });
                                end;
                            end, 
                            title = not v21() and "Scene Captured" or if v28.isSmallPortraitMode then nil else v20:FormatByKey("Feature.SettingsHub.Label.SceneCaptured"), 
                            isSecondary = v28.isSmallPortraitMode
                        })
                    }), 
                    Divider = v3.createElement(v22, {
                        LayoutOrder = 2
                    }), 
                    ScreenshotBody = v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 3, 
                        Size = UDim2.new(1, 0, 1, -60), 
                        ZIndex = 10
                    }, {
                        Padding = v3.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 16)
                        }), 
                        Layout = v3.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        ScreenshotContainer = v3.createElement("Frame", {
                            Size = UDim2.new(1, 0, 1, -32), 
                            BackgroundTransparency = 2, 
                            LayoutOrder = 1
                        }, {
                            Padding = v3.createElement("UIPadding", {
                                PaddingTop = UDim.new(0, 12), 
                                PaddingBottom = UDim.new(0, 12), 
                                PaddingLeft = UDim.new(0, 16), 
                                PaddingRight = UDim.new(0, 16)
                            }), 
                            Screenshot = v3.createElement("Frame", {
                                Size = UDim2.new(1, 0, 1, 0), 
                                Position = UDim2.fromScale(0.5, 0.5), 
                                AnchorPoint = Vector2.new(0.5, 0.5), 
                                BorderSizePixel = 2, 
                                BorderMode = Enum.BorderMode.Inset, 
                                BorderColor3 = Color3.fromRGB(255, 255, 255), 
                                LayoutOrder = 1
                            }, {
                                UIAspectRatioConstraint = v3.createElement("UIAspectRatioConstraint", {
                                    AspectRatio = v28.imageAspectRatio
                                }), 
                                ScreenshotImage = v3.createElement(l_ImageSetButton_0, {
                                    Active = true, 
                                    Size = UDim2.fromScale(1, 1), 
                                    Image = v28.screenshot, 
                                    ZIndex = 1, 
                                    AnchorPoint = Vector2.new(0.5, 0.5), 
                                    Position = UDim2.fromScale(0.5, 0.5), 
                                    BackgroundTransparency = 1, 
                                    ScaleType = Enum.ScaleType.Fit, 
                                    SliceCenter = v16.Images.RoundedRect.SliceCenter, 
                                    [v3.Event.Activated] = function()
                                        v28.onNextPage();
                                    end
                                })
                            })
                        }), 
                        Description = v3.createElement("TextLabel", {
                            Text = not v21() and "If the problem is not in this scene, you can \226\128\156Retake\226\128\157\nthe screenshot." or v20:FormatByKey("Feature.ReportAbuse.Message.ProblemNotInScene"), 
                            Font = l_Font_0.Header1.Font, 
                            LayoutOrder = 2, 
                            TextColor3 = l_Theme_0.TextEmphasis.Color, 
                            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                            TextSize = not v28.isSmallPortraitMode and 20 or 12, 
                            TextXAlignment = Enum.TextXAlignment.Center, 
                            TextWrapped = v21(), 
                            Size = if not v21() then UDim2.new(1, 0, 0, 20) else UDim2.new(1, -24, 0, not v28.isSmallPortraitMode and 40 or 24), 
                            BackgroundTransparency = 1
                        })
                    })
                }), 
                Footer = v3.createElement("Frame", {
                    BackgroundTransparency = 0, 
                    Size = UDim2.new(1, 0, 0, v29), 
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
                        Size = if not not v21() and v28.isSmallPortraitMode then UDim2.new(1, 0, 1, 0) else UDim2.new(0, not v28.isSmallPortraitMode and 612 or 400, 1, 0), 
                        BackgroundTransparency = 1
                    }, {
                        Padding = v3.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 12), 
                            PaddingBottom = UDim.new(0, 12), 
                            PaddingLeft = UDim.new(0, 16), 
                            PaddingRight = UDim.new(0, 16)
                        }), 
                        ActionButtons = v3.createElement(l_ButtonStack_0, {
                            forcedFillDirection = if not not v21() and v28.isSmallPortraitMode then Enum.FillDirection.Vertical else nil, 
                            marginBetween = 8, 
                            buttons = {
                                {
                                    buttonType = l_ButtonType_1.Secondary, 
                                    props = {
                                        onActivated = v28.onSkip, 
                                        text = not v21() and "Attach Screenshot" or v20:FormatByKey("Feature.ReportAbuse.Action.AttachScreenshot")
                                    }
                                }, 
                                {
                                    buttonType = l_ButtonType_1.PrimarySystem, 
                                    props = {
                                        onActivated = function()
                                            v28.onNextPage();
                                        end, 
                                        text = not v21() and "Highlight Scene" or v20:FormatByKey("Feature.ReportAbuse.Action.HighlightScene")
                                    }
                                }
                            }
                        })
                    })
                })
            })
        })
    });
end;

local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_script_FirstAncestor_0.ReportAnything.Resources.Constants);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_CorePackages_0.Packages.React);
local l_ButtonStack_0 = v4.App.Button.ButtonStack;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_HeaderBar_0 = v4.App.Bar.HeaderBar;
local l_IconButton_0 = v4.App.Button.IconButton;
local l_IconSize_0 = v4.App.ImageSet.Enum.IconSize;
local l_ImageSetButton_0 = v4.Core.ImageSet.ImageSetButton;
local l_Images_0 = v4.App.ImageSet.Images;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_Button_0 = v4.App.Button.Button;
local l_StandardButtonSize_0 = v4.App.Button.Enum.StandardButtonSize;
local l_Parent_0 = script.Parent.Parent;
local v17 = require(l_Parent_0.Resources.Assets);
local v18 = require(l_Parent_0.Components.Divider);
local v19 = require(l_Parent_0.Components.RestartScreenshotDialog);
local _ = require(l_Parent_0.Utility.ReportAnythingAnalytics);
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v23 = require(l_RobloxGui_0.Modules.Common.FocusNavigationEffectsWrapper);
local l_FocusNavigableSurfaceIdentifierEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum;
local v25 = nil;
local l_RobloxTranslator_0 = l_RobloxGui_0.Modules:FindFirstChild("RobloxTranslator");
if l_RobloxTranslator_0 then
    v25 = require(l_RobloxTranslator_0);
end;
local function v31(v27)
    local v28, v29 = v5.useState(0);
    return v5.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        Layout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Text = v5.createElement("TextLabel", {
            LayoutOrder = -1, 
            Text = v25:FormatByKey("Feature.SettingsHub.Label.SceneCaptured"), 
            Font = v27.font.Header2.Font, 
            TextColor3 = v27.theme.TextEmphasis.Color, 
            TextTransparency = v27.theme.TextEmphasis.Transparency, 
            TextSize = 20, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Size = UDim2.new(0, (v27.viewportWidth - v28) - 50, 1, 0), 
            BackgroundTransparency = 1
        }), 
        RetakeButton = v5.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.Secondary, 
            text = v25:FormatByKey("Feature.ReportAbuse.Action.Retake"), 
            fitContent = true, 
            standardSize = l_StandardButtonSize_0.XSmall, 
            onActivated = v5.useCallback(function()
                v27.setShowRestartDialog(true);
            end, {
                v27.setShowRestartDialog
            }), 
            [v5.Change.AbsoluteSize] = v5.useCallback(function(v30)
                v29(v30.AbsoluteSize.X);
            end, {
                v29
            })
        })
    });
end;
return function(v32)
    local v33 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    if v25 then
        local v34 = 60;
        if v32.isSmallPortraitMode then
            v34 = 104;
        end;
        local v35 = v5.useCallback(function()
            v32.reportAnythingAnalytics.incrementPreviewBack();
            v32.onBack();
        end, {
            v32.onBack, 
            v32.reportAnythingAnalytics
        });
        local v36 = v5.useCallback(function()
            v32.reportAnythingAnalytics.incrementPreviewAttach();
            v32.onSkip();
        end, {
            v32.onSkip, 
            v32.reportAnythingAnalytics
        });
        local v37, v38 = v5.useState(false);
        local v39 = v5.useCallback(function()
            v32.reportAnythingAnalytics.incrementRetake();
            v38(true);
        end, {
            v38, 
            v32.reportAnythingAnalytics
        });
        local v40 = v5.useCallback(function()
            v32.reportAnythingAnalytics.setRetakeAbandon();
            v32.onRestart();
        end, {
            v32.onRestart, 
            v32.reportAnythingAnalytics
        });
        local v41 = v5.useCallback(function()
            v32.reportAnythingAnalytics.incrementHighlightScene();
            v32.onNextPage();
        end, {
            v32.onNextPage, 
            v32.reportAnythingAnalytics
        });
        local v42 = l_useStyle_0();
        local l_Theme_0 = v42.Theme;
        local l_Font_0 = v42.Font;
        return v5.createElement("TextButton", {
            Selectable = false, 
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Theme_0.Overlay.Color, 
            BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 10, 
            Text = "", 
            [v5.Event.Activated] = v35
        }, {
            Container = v5.createElement("Frame", {
                Size = if not v32.isSmallPortraitMode then if v32.viewportHeight >= 800 then UDim2.new(0, 800, 0, 800) else UDim2.new(1, 0, 1, 0) else UDim2.new(1, 0, 1, 0), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Theme_0.Overlay.Color, 
                BackgroundTransparency = 0, 
                ZIndex = 10
            }, {
                RestartDialog = v37 and v5.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    FocusNavigationEffects = v5.createElement(v23, {
                        selectionGroupName = v3.RestartScreenshotDialogRootName, 
                        focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
                    }, {
                        DialogBody = v5.createElement(v19, {
                            ZIndex = 3, 
                            isSmallPortraitMode = v32.isSmallPortraitMode, 
                            onCancel = function()
                                v38(false);
                            end, 
                            onRestart = v40
                        })
                    })
                }), 
                RestartDialogMask = v37 and v5.createElement(l_ImageSetButton_0, {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 0.2, 
                    BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                    Active = true, 
                    AutoButtonColor = false, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Image = v17.Images.RoundedRect.Image, 
                    ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                    ImageTransparency = 1, 
                    ScaleType = v17.Images.RoundedRect.ScaleType, 
                    SliceCenter = v17.Images.RoundedRect.SliceCenter
                }, {}), 
                ScreenshotDialog = v5.createElement(l_ImageSetButton_0, {
                    Active = true, 
                    Selectable = false, 
                    Size = UDim2.fromScale(1, 1), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = v17.Images.RoundedRect.Image, 
                    ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                    ImageTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
                    ScaleType = v17.Images.RoundedRect.ScaleType, 
                    SliceCenter = v17.Images.RoundedRect.SliceCenter
                }, {
                    Layout = v5.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    HeaderAndContent = v5.createElement("Frame", {
                        Size = UDim2.new(1, 0, 1, -v34), 
                        BackgroundTransparency = 1
                    }, {
                        Layout = v5.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        Header = v5.createElement("Frame", {
                            BackgroundTransparency = 0, 
                            BackgroundColor3 = Color3.fromHex("#4F545F"), 
                            LayoutOrder = 1, 
                            Size = UDim2.new(1, 0, 0, 48)
                        }, {
                            Bar = v5.createElement(l_HeaderBar_0, {
                                backgroundTransparency = 1, 
                                barHeight = 48, 
                                margin = 12, 
                                renderLeft = function()
                                    return v5.createElement(l_IconButton_0, {
                                        iconSize = l_IconSize_0.Medium, 
                                        icon = l_Images_0["icons/navigation/pushBack"], 
                                        onActivated = v35
                                    });
                                end, 
                                renderRight = function()
                                    if not v32.isSmallPortraitMode then
                                        return v5.createElement(l_Button_0, {
                                            buttonType = l_ButtonType_0.Secondary, 
                                            text = v25:FormatByKey("Feature.ReportAbuse.Action.Retake"), 
                                            fitContent = true, 
                                            standardSize = l_StandardButtonSize_0.XSmall, 
                                            onActivated = v39
                                        });
                                    else
                                        return v5.createElement(v31, {
                                            onActivated = v39, 
                                            font = l_Font_0, 
                                            theme = l_Theme_0, 
                                            viewportWidth = v32.viewportWidth
                                        });
                                    end;
                                end, 
                                title = if not v32.isSmallPortraitMode then v25:FormatByKey("Feature.SettingsHub.Label.SceneCaptured") else nil, 
                                isSecondary = v32.isSmallPortraitMode
                            })
                        }), 
                        Divider = v5.createElement(v18, {
                            LayoutOrder = 2
                        }), 
                        ScreenshotBody = v5.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            LayoutOrder = 3, 
                            Size = UDim2.new(1, 0, 1, -60), 
                            ZIndex = 10
                        }, {
                            Padding = v5.createElement("UIPadding", {
                                PaddingTop = UDim.new(0, 16)
                            }), 
                            Layout = v5.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                                SortOrder = Enum.SortOrder.LayoutOrder
                            }), 
                            ScreenshotContainer = v5.createElement("Frame", {
                                Size = UDim2.new(1, 0, 1, -32), 
                                BackgroundTransparency = 2, 
                                LayoutOrder = 1
                            }, {
                                Padding = v5.createElement("UIPadding", {
                                    PaddingTop = UDim.new(0, 12), 
                                    PaddingBottom = UDim.new(0, 12), 
                                    PaddingLeft = UDim.new(0, 16), 
                                    PaddingRight = UDim.new(0, 16)
                                }), 
                                Screenshot = v5.createElement("Frame", {
                                    Size = UDim2.new(1, 0, 1, 0), 
                                    Position = UDim2.fromScale(0.5, 0.5), 
                                    AnchorPoint = Vector2.new(0.5, 0.5), 
                                    BorderSizePixel = 2, 
                                    BorderMode = Enum.BorderMode.Inset, 
                                    BorderColor3 = Color3.fromRGB(255, 255, 255), 
                                    LayoutOrder = 1
                                }, {
                                    UIAspectRatioConstraint = v5.createElement("UIAspectRatioConstraint", {
                                        AspectRatio = v32.imageAspectRatio
                                    }), 
                                    ScreenshotImage = v5.createElement(l_ImageSetButton_0, {
                                        Active = true, 
                                        Selectable = not v33 and true or false, 
                                        Size = UDim2.fromScale(1, 1), 
                                        Image = v32.screenshot, 
                                        ZIndex = 1, 
                                        AnchorPoint = Vector2.new(0.5, 0.5), 
                                        Position = UDim2.fromScale(0.5, 0.5), 
                                        BackgroundTransparency = 1, 
                                        ScaleType = Enum.ScaleType.Fit, 
                                        SliceCenter = v17.Images.RoundedRect.SliceCenter, 
                                        [v5.Event.Activated] = v41
                                    })
                                })
                            }), 
                            Description = v5.createElement("TextLabel", {
                                Text = v25:FormatByKey("Feature.ReportAbuse.Message.ProblemNotInScene"), 
                                Font = l_Font_0.Header1.Font, 
                                LayoutOrder = 2, 
                                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                                TextSize = not v32.isSmallPortraitMode and 20 or 12, 
                                TextXAlignment = Enum.TextXAlignment.Center, 
                                TextWrapped = true, 
                                Size = UDim2.new(1, -24, 0, not v32.isSmallPortraitMode and 40 or 24), 
                                BackgroundTransparency = 1
                            })
                        })
                    }), 
                    Footer = v5.createElement("Frame", {
                        BackgroundTransparency = 0, 
                        Size = UDim2.new(1, 0, 0, v34), 
                        BackgroundColor3 = Color3.fromHex("#4F545F"), 
                        AnchorPoint = Vector2.new(0, 1), 
                        Position = UDim2.fromScale(0, 1), 
                        LayoutOrder = 4
                    }, {
                        Layout = v5.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center
                        }), 
                        Container = v5.createElement("Frame", {
                            Size = if not v32.isSmallPortraitMode then UDim2.new(0, not v32.isSmallPortraitMode and 612 or 400, 1, 0) else UDim2.new(1, 0, 1, 0), 
                            BackgroundTransparency = 1
                        }, {
                            Padding = v5.createElement("UIPadding", {
                                PaddingTop = UDim.new(0, 12), 
                                PaddingBottom = UDim.new(0, 12), 
                                PaddingLeft = UDim.new(0, 16), 
                                PaddingRight = UDim.new(0, 16)
                            }), 
                            ActionButtons = v5.createElement(l_ButtonStack_0, {
                                forcedFillDirection = if not v32.isSmallPortraitMode then nil else Enum.FillDirection.Vertical, 
                                marginBetween = 8, 
                                buttons = {
                                    {
                                        buttonType = l_ButtonType_0.Secondary, 
                                        props = {
                                            onActivated = v36, 
                                            text = v25:FormatByKey("Feature.ReportAbuse.Action.AttachScreenshot")
                                        }
                                    }, 
                                    if not v33 then {
                                        buttonType = l_ButtonType_0.PrimarySystem, 
                                        props = {
                                            onActivated = v41, 
                                            text = v25:FormatByKey("Feature.ReportAbuse.Action.HighlightScene")
                                        }
                                    } else nil
                                }
                            })
                        })
                    })
                })
            })
        });
    else
        return nil;
    end;
end;

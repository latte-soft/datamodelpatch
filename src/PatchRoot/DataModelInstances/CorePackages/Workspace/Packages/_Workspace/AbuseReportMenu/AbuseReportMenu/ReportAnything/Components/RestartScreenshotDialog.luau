local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.UIBlox);
local v3 = require(l_CorePackages_0.Packages.React);
local l_ButtonStack_0 = v2.App.Button.ButtonStack;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_HeaderBar_0 = v2.App.Bar.HeaderBar;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_Parent_0 = script.Parent.Parent;
local v9 = nil;
local l_RobloxTranslator_0 = l_RobloxGui_0.Modules:FindFirstChild("RobloxTranslator");
if l_RobloxTranslator_0 then
    v9 = require(l_RobloxTranslator_0);
end;
local v11 = require(l_Parent_0.Components.Divider);
return function(v12)
    if v9 then
        local v13 = l_useStyle_0();
        local l_Theme_0 = v13.Theme;
        local l_Font_0 = v13.Font;
        local v16 = 48;
        local v17 = 180;
        local v18 = 50;
        if v12.isSmallPortraitMode then
            v16 = 84;
            v17 = 260;
            v18 = 100;
        end;
        return v3.createElement("Frame", {
            Size = UDim2.new(0, not v12.isSmallPortraitMode and 480 or 343, 0, v17), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundColor3 = Color3.fromHex("#4F545F"), 
            ZIndex = 5
        }, {
            Corner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            HeaderAndContent = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                Layout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Header = v3.createElement(l_HeaderBar_0, {
                    backgroundTransparency = 1, 
                    barHeight = 48, 
                    renderLeft = function()
                    end, 
                    renderRight = function()
                    end, 
                    title = v9:FormatByKey("Feature.ReportAbuse.Action.RetakeScene"), 
                    LayoutOrder = 1
                }), 
                Divider = v3.createElement(v11, {
                    LayoutOrder = 2
                }), 
                Description = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, -v16 - 1), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3
                }, {
                    Padding = v3.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 8), 
                        PaddingBottom = UDim.new(0, 8), 
                        PaddingLeft = UDim.new(0, 16), 
                        PaddingRight = UDim.new(0, 16)
                    }), 
                    TextBody = v3.createElement("TextLabel", {
                        Text = v9:FormatByKey("Feature.ReportAbuse.Message.RetakeScene"), 
                        Font = l_Font_0.Body.Font, 
                        LayoutOrder = 3, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                        TextSize = 16, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        Size = UDim2.new(1, 0, 0, v18), 
                        BackgroundTransparency = 1
                    })
                })
            }), 
            Footer = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v16), 
                Position = UDim2.new(0, 0, 1, -v16), 
                BorderSizePixel = 0, 
                LayoutOrder = 4
            }, {
                Padding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 6), 
                    PaddingBottom = UDim.new(0, 6), 
                    PaddingLeft = UDim.new(0, 16), 
                    PaddingRight = UDim.new(0, 16)
                }), 
                ActionButtons = v3.createElement(l_ButtonStack_0, {
                    forcedFillDirection = if not v12.isSmallPortraitMode then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical, 
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.Secondary, 
                            props = if not v12.isSmallPortraitMode then {
                                onActivated = v12.onCancel, 
                                text = v9:FormatByKey("InGame.InspectMenu.Action.Cancel")
                            } else {
                                onActivated = v12.onCancel, 
                                text = v9:FormatByKey("InGame.InspectMenu.Action.Cancel"), 
                                size = UDim2.new(1, 0, 0, 28), 
                                fontStyle = l_Font_0.Body2
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = if not v12.isSmallPortraitMode then {
                                onActivated = v12.onRestart, 
                                text = v9:FormatByKey("Feature.ReportAbuse.Action.BackToExperience")
                            } else {
                                onActivated = v12.onRestart, 
                                text = v9:FormatByKey("Feature.ReportAbuse.Action.BackToExperience"), 
                                size = UDim2.new(1, 0, 0, 28), 
                                fontStyle = l_Font_0.Body2
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

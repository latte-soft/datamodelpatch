local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_Modules_0.LuaApp.FitChildren);
local v4 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v5 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v5.Style.withStyle;
local l_Checkbox_0 = v5.App.InputButton.Checkbox;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_Large_0 = v5.App.Constant.IconSize.Large;
return function(v10)
    return l_withStyle_0(function(v11)
        local l_Font_0 = v11.Font.Body.Font;
        local v13 = v11.Font.BaseSize * v11.Font.Body.RelativeSize;
        local l_Transparency_0 = v11.Theme.TextDefault.Transparency;
        local v15 = v10.TextColor or v11.Theme.TextDefault.Color;
        local v16 = {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v10.MainTextPadding or 0)
            })
        };
        if v10.MainText then
            for v17 = 1, #v10.MainText do
                local v18 = v10.MainText[v17];
                if not (typeof(v18) == "table") or not v10.showConsentCheckbox then
                    table.insert(v16, v2.createElement(v4, {
                        Text = v18, 
                        TextColor3 = v15, 
                        TextSize = v13, 
                        TextTransparency = l_Transparency_0, 
                        Font = l_Font_0, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        LayoutOrder = #v16, 
                        TextWrapped = true, 
                        RichText = v10.showConsentCheckbox, 
                        TextXAlignment = if not v10.showConsentCheckbox then Enum.TextXAlignment.Center else Enum.TextXAlignment.Left, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        fitAxis = v3.FitAxis.Height
                    }));
                else
                    table.insert(v16, v2.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1
                    }, {
                        Image = v2.createElement(l_ImageSetLabel_0, {
                            Image = v18.image, 
                            Size = UDim2.fromOffset(l_Large_0, l_Large_0), 
                            BackgroundTransparency = 1, 
                            ScaleType = Enum.ScaleType.Slice
                        }), 
                        Layout = v2.createElement("UIListLayout", {
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            VerticalAlignment = Enum.VerticalAlignment.Top, 
                            FillDirection = Enum.FillDirection.Horizontal, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, 12)
                        }), 
                        Label = v2.createElement(v4, {
                            Text = v18.content, 
                            TextColor3 = v15, 
                            TextSize = v13, 
                            TextTransparency = l_Transparency_0, 
                            Font = l_Font_0, 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            LayoutOrder = #v16, 
                            TextWrapped = true, 
                            RichText = true, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            Size = UDim2.new(1, -l_Large_0, 0, 0), 
                            fitAxis = v3.FitAxis.Height
                        })
                    }));
                end;
            end;
            if v10.LocalizedOptOutText then
                table.insert(v16, v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = #v16, 
                    Size = UDim2.new(0, 0, 0, 25), 
                    AutomaticSize = Enum.AutomaticSize.XY
                }, {
                    v2.createElement("Frame", {
                        Position = UDim2.fromScale(not v10.centerCheckbox and 0 or 0.5, 0.5), 
                        BackgroundTransparency = 1
                    }, {
                        Checkbox = v2.createElement(l_Checkbox_0, {
                            text = v10.LocalizedOptOutText, 
                            onActivated = v10.onActivated, 
                            isSelected = v10.checkboxSelected
                        })
                    })
                }));
            end;
            if v10.showConsentCheckbox then
                table.insert(v16, v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = #v16, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 25)
                }, {
                    v2.createElement("Frame", {
                        Position = UDim2.fromOffset(0, 12), 
                        Size = UDim2.new(1, 0, 0, 50), 
                        BackgroundTransparency = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        Checkbox = not v10.hideConsent and v2.createElement(l_Checkbox_0, {
                            text = "", 
                            onActivated = v10.consentActivated, 
                            isSelected = v10.consentSelected
                        }), 
                        CheckboxContent = if not v10.hideConsent then v2.createElement("TextButton", {
                            Text = v10.consentText, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            TextColor3 = v15, 
                            TextSize = v13, 
                            TextTransparency = l_Transparency_0, 
                            Font = l_Font_0, 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            LayoutOrder = 10, 
                            TextWrapped = true, 
                            RichText = true, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            [v2.Event.Activated] = v10.consentActivated, 
                            Size = UDim2.new(1, -10, 0, 0)
                        }) else v2.createElement("TextLabel", {
                            Text = v10.consentText, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            TextColor3 = v15, 
                            TextSize = v13, 
                            TextTransparency = l_Transparency_0, 
                            Font = l_Font_0, 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            LayoutOrder = 10, 
                            TextWrapped = true, 
                            RichText = true, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            Size = UDim2.new(1, -10, 0, 0)
                        }), 
                        Layout = v2.createElement("UIListLayout", {
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            FillDirection = Enum.FillDirection.Horizontal, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, 10)
                        }), 
                        Padding = v2.createElement("UIPadding", {
                            PaddingRight = UDim.new(0, 10)
                        })
                    })
                }));
            end;
        end;
        return v2.createElement(v3.FitFrame, {
            LayoutOrder = v10.LayoutOrder, 
            Size = UDim2.new(1, 0, 0, 0), 
            fitAxis = v3.FitAxis.Height, 
            BackgroundTransparency = 1
        }, v16);
    end);
end;

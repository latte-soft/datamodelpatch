local l_TextService_0 = game:GetService("TextService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_createElement_0 = v2.createElement;
local v4 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_LinkButton_0 = v4.App.Button.LinkButton;
local _ = v4.Core.Control.Interactable;
local l_ControlState_0 = v4.Core.Control.Enum.ControlState;
local _ = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_List_0 = require(l_CorePackages_0.Cryo).List;
local v11 = require(script.Parent.useAnalytics);
local v12 = Vector2.new(8, 8);
local function v15(v13)
    local l_text_0 = v13.text;
    return l_createElement_0("TextLabel", {
        AutomaticSize = Enum.AutomaticSize.X, 
        Size = UDim2.fromOffset(0, l_TextService_0:GetTextSize(l_text_0, v13.textSize, v13.font, Vector2.new(300 - v12.X * 2, math.huge)).Y), 
        BackgroundTransparency = 1, 
        Text = l_text_0, 
        TextWrapped = true, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        Font = v13.font, 
        TextSize = v13.textSize, 
        TextColor3 = v13.textColor3, 
        TextTransparency = v13.textTransparency, 
        LayoutOrder = v13.layoutOrder
    });
end;
return function(v16)
    local v17 = l_useStyle_0();
    local l_Footer_0 = v17.Font.Footer;
    local l_bodyText_0 = v16.bodyText;
    local v20 = v11();
    v2.useEffect(function()
        if v16.visible then
            v20.fireEvent("popupImpression", {
                copyType = v16.analyticsCopyType
            });
        end;
    end, {
        v16.visible
    });
    return l_createElement_0("Frame", {
        Visible = v16.visible, 
        LayoutOrder = v16.layoutOrder, 
        Size = UDim2.fromOffset(300, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = v17.Theme.BackgroundUIContrast.Color, 
        BackgroundTransparency = v17.Theme.BackgroundUIContrast.Transparency
    }, {
        layout = l_createElement_0("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 12)
        }), 
        padding = l_createElement_0("UIPadding", {
            PaddingTop = UDim.new(0, v12.Y), 
            PaddingBottom = UDim.new(0, v12.Y), 
            PaddingLeft = UDim.new(0, v12.X), 
            PaddingRight = UDim.new(0, v12.X)
        }), 
        shape = l_createElement_0("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        body = l_createElement_0(v2.Fragment, nil, l_List_0.map(l_bodyText_0, function(v21, v22)
            return l_createElement_0(v15, {
                layoutOrder = v22, 
                text = v21, 
                font = l_Footer_0.Font, 
                textSize = v17.Font.BaseSize * l_Footer_0.RelativeSize, 
                textColor3 = v17.Theme.TextEmphasis.Color, 
                textTransparency = v17.Theme.TextEmphasis.Transparency
            });
        end)), 
        link = l_createElement_0(l_LinkButton_0, {
            text = v16.linkText, 
            fontStyle = "Footer", 
            layoutOrder = 100, 
            minPaddingX = 0, 
            minPaddingY = 8, 
            underlineAlwaysEnabled = true, 
            onActivated = v2.useCallback(function()
                v20.fireEvent("formInteraction", {
                    aType = "click", 
                    input = "learn_more"
                });
                v16.openWebview();
            end), 
            onStateChanged = v2.useCallback(function(_, v24)
                if v24 == l_ControlState_0.Hover then
                    v20.fireEvent("formInteraction", {
                        aType = "hover", 
                        input = "learn_more"
                    });
                end;
            end)
        })
    });
end;

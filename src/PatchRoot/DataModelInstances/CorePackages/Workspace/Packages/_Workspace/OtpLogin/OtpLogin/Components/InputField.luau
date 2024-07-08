local v0 = require(script.Parent.Parent.dependencies);
local l_React_0 = v0.React;
local l_UIBlox_0 = v0.UIBlox;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_useCursor_0 = l_UIBlox_0.App.SelectionCursor.useCursor;
local l_FFlagLuaAppFixCursorHooks_0 = v0.SharedFlags.FFlagLuaAppFixCursorHooks;
return function(v6)
    local v7 = l_useStyle_0();
    local l_HelperText_0 = v7.Tokens.Component.HelperText;
    local l_Typography_0 = l_HelperText_0.Base.Typography;
    local v10 = l_React_0.useRef(nil);
    local v11, v12 = l_React_0.useState(false);
    local l_TextField_0 = v7.Tokens.Component.TextField;
    local v14 = if not l_FFlagLuaAppFixCursorHooks_0 then nil else l_useCursor_0(UDim.new(0, l_TextField_0.Base.Field.BorderRadius), 2, 2);
    local function v15()
        if not v6.disabled or not v10.current then
            v12(true);
            return ;
        else
            v10.current:ReleaseFocus();
            return ;
        end;
    end;
    local function v16()
        v12(false);
    end;
    local function _()
        return v6.errorMessage and string.len(v6.errorMessage) > 0;
    end;
    return l_React_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v6.LayoutOrder
    }, {
        Layout = l_React_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v7.Tokens.Component.InputLabel.Base.Spacing.Bottom)
        }), 
        InputCanvas = l_React_0.createElement("CanvasGroup", {
            Size = UDim2.new(1, 0, 0, 48), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            GroupTransparency = not v6.disabled and 0 or 1 - l_TextField_0.Disabled.Field.Opacity
        }, {
            Input = l_React_0.createElement("ImageButton", {
                Size = UDim2.new(1, -2, 1, -2), 
                Position = UDim2.new(0, 1, 0, 1), 
                BackgroundTransparency = 1, 
                Selectable = not v6.disabled, 
                Image = "", 
                ImageColor3 = v7.Theme.BackgroundUIContrast.Color, 
                SelectionImageObject = if not l_FFlagLuaAppFixCursorHooks_0 then l_useCursor_0(UDim.new(0, l_TextField_0.Base.Field.BorderRadius), 2, 2) else v14, 
                [l_React_0.Event.Activated] = function()
                    if v10.current then
                        v10.current:CaptureFocus();
                    end;
                end
            }, {
                Corner = l_React_0.createElement("UICorner", {
                    CornerRadius = UDim.new(0, l_TextField_0.Base.Field.BorderRadius)
                }), 
                Border = l_React_0.createElement("UIStroke", {
                    Color = if not (v6.errorMessage and string.len(v6.errorMessage) > 0) then l_TextField_0.Base.Field.BorderColor.Color3 else l_TextField_0.Error.Field.BorderColor.Color3, 
                    Transparency = if not (v6.errorMessage and string.len(v6.errorMessage) > 0) then v11 and 0 or l_TextField_0.Base.Field.BorderColor.Transparency else l_TextField_0.Error.Field.BorderColor.Transparency, 
                    Thickness = 1
                }), 
                BorderFrame = l_React_0.createElement("Frame", {
                    Size = UDim2.new(1, -4, 1, -4), 
                    Position = UDim2.new(0, 2, 0, 2), 
                    BackgroundTransparency = 1
                }, {
                    Corner = l_React_0.createElement("UICorner", {
                        CornerRadius = UDim.new(0, l_TextField_0.Base.Field.BorderRadius - 2)
                    }), 
                    Focus = if not v6.disabled and v11 then l_React_0.createElement("UIStroke", {
                        Color = l_TextField_0.Base.Field.BorderColor.Color3, 
                        Transparency = 0.88, 
                        Thickness = 3
                    }) else nil, 
                    Padding = l_React_0.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, l_TextField_0.Base.Field.Spacing.Leading), 
                        PaddingRight = UDim.new(0, l_TextField_0.Base.Field.Spacing.Trailing)
                    }), 
                    Layout = l_React_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, l_TextField_0.Base.Field.Gap * 2)
                    }), 
                    TextBox = l_React_0.createElement("TextBox", {
                        ref = v10, 
                        Text = v6.text, 
                        ClearTextOnFocus = false, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        TextEditable = not v6.disabled, 
                        BackgroundTransparency = 1, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        Font = l_TextField_0.Base.Field.Typography.Font, 
                        TextSize = l_TextField_0.Base.Field.Typography.FontSize, 
                        LineHeight = 1, 
                        TextColor3 = l_TextField_0.Base.FieldValue.ContentColor.Color3, 
                        TextTransparency = l_TextField_0.Base.FieldValue.ContentColor.Transparency, 
                        PlaceholderText = v6.placeholder, 
                        ClipsDescendants = true, 
                        LayoutOrder = 1, 
                        [l_React_0.Event.Focused] = v15, 
                        [l_React_0.Event.FocusLost] = v16, 
                        [l_React_0.Change.Text] = v6.onChange
                    })
                })
            })
        }), 
        HelperText = if not (v6.errorMessage and string.len(v6.errorMessage) > 0) then nil else l_React_0.createElement("TextLabel", {
            Text = v6.errorMessage, 
            TextTransparency = l_HelperText_0.Base.ContentColor.Transparency, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextWrapped = true, 
            BackgroundTransparency = 1, 
            TextColor3 = l_HelperText_0.Error.ContentColor.Color3, 
            Font = l_Typography_0.Font, 
            TextSize = l_Typography_0.FontSize, 
            LineHeight = l_Typography_0.LineHeight, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2
        })
    });
end;

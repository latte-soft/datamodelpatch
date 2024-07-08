local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Parent.React);
local v4 = require(l_Parent_0.InputLabel);
local v5 = require(l_Parent_0.HelperText);
local v6 = require(l_Parent_2.Core.ImageSet.ImageSetComponent);
local _ = require(l_Parent_1.ImageSet.ImagesTypes);
local v8 = require(l_Parent_2.Core.Style.useStyle);
local v9 = require(l_Parent_2.App.SelectionCursor.useCursor);
local v10 = {
    width = UDim.new(0, 400)
};
return function(v11)
    local l_Tokens_0 = v8().Tokens;
    local v13 = v3.useRef(nil);
    local v14, v15 = v3.useState(false);
    local v16, v17 = v3.useState(false);
    local l_TextField_0 = l_Tokens_0.Component.TextField;
    local l_Focus_0 = l_Tokens_0.Semantic.Stroke.Focus;
    local l_Small_0 = l_Tokens_0.Semantic.Icon.Size.Small;
    local l_Input_0 = l_Tokens_0.Semantic.Stroke.Input;
    local v22 = math.ceil(l_Input_0) * 2;
    local l_Focus_1 = l_Tokens_0.Semantic.Stroke.Focus;
    local v24 = math.ceil(l_Focus_1) * 2;
    local v25 = v9(UDim.new(0, l_TextField_0.Base.Field.BorderRadius), l_Focus_0, l_Focus_0);
    local v26 = v9(UDim.new(0.5), l_Small_0 / 2, l_Focus_0);
    local v27 = if v11.width ~= nil then v11.width else v10.width;
    local function _()
        local v28 = 0;
        if v11.iconLeading then
            v28 = (v28 - l_Small_0) - l_TextField_0.Base.Field.Gap * 2;
        end;
        if v11.iconButton then
            v28 = (v28 - l_Small_0) - l_TextField_0.Base.Field.Gap * 2;
        end;
        return v28;
    end;
    local function v31(v30)
        if v30 == nil then
            v11.onChange("");
            return ;
        else
            v11.onChange(v30.Text);
            return ;
        end;
    end;
    local function v32()
        if not v11.disabled or not v13.current then
            v17(true);
            return ;
        else
            v13.current:ReleaseFocus();
            return ;
        end;
    end;
    local function v33()
        v17(false);
    end;
    local l_createElement_0 = v3.createElement;
    local v35 = "Frame";
    local v36 = {
        BackgroundTransparency = 1, 
        Size = UDim2.new(v27, UDim.new(0, 0)), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v11.LayoutOrder
    };
    local v37 = {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_Tokens_0.Component.InputLabel.Base.Spacing.Bottom)
        }), 
        InputLabel = if not v11.label then nil else v3.createElement(v4, {
            text = v11.label, 
            required = v11.required, 
            LayoutOrder = 1
        })
    };
    local l_createElement_1 = v3.createElement;
    local v39 = "CanvasGroup";
    local v40 = {
        Size = UDim2.new(1, 0, 0, l_Tokens_0.Global.Size_600), 
        BackgroundTransparency = 1, 
        LayoutOrder = 2, 
        GroupTransparency = not v11.disabled and 0 or 1 - l_TextField_0.Disabled.Field.Opacity
    };
    local v41 = {};
    local l_createElement_2 = v3.createElement;
    local v43 = "ImageButton";
    local v44 = {
        Size = UDim2.new(1, -v22, 1, -v22), 
        Position = UDim2.new(0, v22 / 2, 0, v22 / 2), 
        BackgroundTransparency = 1, 
        Selectable = not v11.disabled, 
        Image = "", 
        SelectionImageObject = v25, 
        [v3.Event.Activated] = function()
            if v13.current then
                v13.current:CaptureFocus();
            end;
        end, 
        [v3.Event.MouseEnter] = function()
            v15(true);
        end, 
        [v3.Event.MouseLeave] = function()
            v15(false);
        end
    };
    local v45 = {
        Corner = v3.createElement("UICorner", {
            CornerRadius = UDim.new(0, l_TextField_0.Base.Field.BorderRadius)
        }), 
        Border = v3.createElement("UIStroke", {
            Color = if not v11.error then l_TextField_0.Base.Field.BorderColor.Color3 else l_TextField_0.Error.Field.BorderColor.Color3, 
            Transparency = if not v11.error then v16 and 0 or l_TextField_0.Base.Field.BorderColor.Transparency else l_TextField_0.Error.Field.BorderColor.Transparency, 
            Thickness = l_Input_0
        })
    };
    local l_createElement_3 = v3.createElement;
    local v47 = "Frame";
    local v48 = {
        Size = UDim2.new(1, -v24, 1, -v24), 
        Position = UDim2.new(0, v24 / 2, 0, v24 / 2), 
        BackgroundTransparency = 1
    };
    local v49 = {
        Corner = v3.createElement("UICorner", {
            CornerRadius = UDim.new(0, l_TextField_0.Base.Field.BorderRadius - v24 / 2)
        }), 
        Focus = if not v11.disabled and (v14 or v16) then v3.createElement("UIStroke", {
            Color = l_TextField_0.Base.Field.BorderColor.Color3, 
            Transparency = l_Tokens_0.Global.Opacity_12, 
            Thickness = l_Focus_1
        }) else nil, 
        Padding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_TextField_0.Base.Field.Spacing.Leading), 
            PaddingRight = UDim.new(0, l_TextField_0.Base.Field.Spacing.Trailing)
        }), 
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_TextField_0.Base.Field.Gap * 2)
        }), 
        IconLeading = if not v11.iconLeading then nil else v3.createElement(v6.Label, {
            BackgroundTransparency = 1, 
            Image = v11.iconLeading, 
            Size = UDim2.new(0, l_Small_0, 0, l_Small_0), 
            ImageColor3 = l_TextField_0.Base.IconLeading.ContentColor.Color3, 
            ImageTransparency = l_TextField_0.Base.IconLeading.ContentColor.Transparency, 
            LayoutOrder = 1
        })
    };
    local l_createElement_4 = v3.createElement;
    local v51 = "TextBox";
    local v52 = {
        ref = v13, 
        Text = v11.text, 
        ClearTextOnFocus = false
    };
    local l_new_0 = UDim2.new;
    local v54 = 1;
    local v55 = 0;
    if v11.iconLeading then
        v55 = (v55 - l_Small_0) - l_TextField_0.Base.Field.Gap * 2;
    end;
    if v11.iconButton then
        v55 = (v55 - l_Small_0) - l_TextField_0.Base.Field.Gap * 2;
    end;
    v52.Size = l_new_0(v54, v55, 1, 0);
    v52.TextEditable = not v11.disabled;
    v52.BackgroundTransparency = 1;
    v52.TextXAlignment = Enum.TextXAlignment.Left;
    v52.TextYAlignment = Enum.TextYAlignment.Center;
    v52.Font = l_TextField_0.Base.Field.Typography.Font;
    v52.TextSize = l_TextField_0.Base.Field.Typography.FontSize;
    v52.LineHeight = 1;
    v52.TextColor3 = l_TextField_0.Base.FieldValue.ContentColor.Color3;
    v52.TextTransparency = l_TextField_0.Base.FieldValue.ContentColor.Transparency;
    v52.PlaceholderText = v11.placeholder;
    v52.ClipsDescendants = true;
    v52.Selectable = false;
    v52.LayoutOrder = 2;
    v52[v3.Event.Focused] = v32;
    v52[v3.Event.FocusLost] = v33;
    v52[v3.Change.Text] = v31;
    v49.TextBox = l_createElement_4(v51, v52);
    v49.IconButton = if not v11.iconButton then nil else v3.createElement(v6.Button, {
        BackgroundTransparency = 1, 
        Image = v11.iconButton, 
        Size = UDim2.new(0, l_Small_0, 0, l_Small_0), 
        ImageColor3 = l_TextField_0.Base.IconLeading.ContentColor.Color3, 
        Selectable = not v11.disabled, 
        SelectionImageObject = v26, 
        LayoutOrder = 3, 
        [v3.Event.Activated] = if v11.disabled then nil else v11.onButtonPress
    });
    v45.BorderFrame = l_createElement_3(v47, v48, v49);
    v41.Input = l_createElement_2(v43, v44, v45);
    v37.InputCanvas = l_createElement_1(v39, v40, v41);
    v37.HelperText = if not v11.hint then nil else v3.createElement(v5, {
        text = v11.hint, 
        error = v11.error, 
        LayoutOrder = 3
    });
    return l_createElement_0(v35, v36, v37);
end;

local l_TextService_0 = game:GetService("TextService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_UIBlox_0 = v2.UIBlox;
local l_t_0 = v2.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Resources.Assets);
local v9 = require(l_Parent_0.GlobalConfig);
local v10 = require(l_Parent_0.Components.ThemedTextLabel);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v12 = {
    [Enum.KeyCode.Escape] = {
        text = "ESC", 
        fontKey = "Footer", 
        width = 36
    }, 
    [Enum.KeyCode.Space] = {
        text = "Space", 
        width = 92
    }, 
    [Enum.KeyCode.LeftShift] = {
        text = "Shift", 
        width = 66, 
        alignment = Enum.TextXAlignment.Left
    }, 
    [Enum.KeyCode.LeftControl] = {
        text = "Ctrl", 
        width = 66, 
        alignment = Enum.TextXAlignment.Left
    }, 
    [Enum.KeyCode.LeftSuper] = {
        text = "Command"
    }, 
    [Enum.KeyCode.LeftMeta] = {
        text = "fn"
    }, 
    [Enum.KeyCode.LeftAlt] = {
        text = "Opt"
    }, 
    [Enum.KeyCode.Tilde] = {
        text = "~", 
        fontKey = "CaptionHeader"
    }, 
    [Enum.KeyCode.F10] = {
        fontKey = "CaptionHeader", 
        width = 36
    }, 
    [Enum.KeyCode.F11] = {
        fontKey = "CaptionHeader", 
        width = 36
    }, 
    [Enum.KeyCode.Up] = {
        image = v8.Images.UpArrow
    }, 
    [Enum.KeyCode.Down] = {
        image = v8.Images.DownArrow
    }, 
    [Enum.KeyCode.Left] = {
        image = v8.Images.LeftArrow
    }, 
    [Enum.KeyCode.Right] = {
        image = v8.Images.RightArrow
    }
};
local v13 = l_t_0.strictInterface({
    input = l_t_0.enum(Enum.KeyCode), 
    borderThemeKey = l_t_0.optional(l_t_0.string), 
    textThemeKey = l_t_0.optional(l_t_0.string), 
    AnchorPoint = l_t_0.optional(l_t_0.Vector2), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    LayoutOrder = l_t_0.optional(l_t_0.integer), 
    ZIndex = l_t_0.optional(l_t_0.integer)
});
local function v25(v14, v15, v16)
    local v17 = v12[v14];
    if not v17 or not v17.image then
        local v18 = nil;
        local v19 = nil;
        local v20 = nil;
        local v21 = nil;
        local l_l_UserInputService_0_StringForKeyCode_0 = l_UserInputService_0:GetStringForKeyCode(v14);
        v18 = if not not v17 and v17.text then v17.text else if l_l_UserInputService_0_StringForKeyCode_0 and l_l_UserInputService_0_StringForKeyCode_0 ~= "" then l_l_UserInputService_0_StringForKeyCode_0 else v14.Name;
        local v23 = v18:len() < 3;
        v19 = if not not v17 and v17.fontKey then v17.fontKey else not v23 and "Footer" or "CaptionHeader";
        if not v17 or not v17.width then
            if not v23 then
                local v24 = v15.Font[v19];
                v20 = l_TextService_0:GetTextSize(v18, v24.RelativeSize * v15.Font.BaseSize, v24.Font, Vector2.new(math.huge, 36)).X + 28;
            else
                v20 = 36;
            end;
        else
            v20 = v17.width;
        end;
        if not (not v17 or not v17.alignment) then
            v21 = v17.alignment;
        end;
        return v20, l_Roact_0.createElement(v10, {
            fontKey = v19, 
            themeKey = v16 or "TextEmphasis", 
            Text = v18, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, -1), 
            TextXAlignment = v21
        }), v21;
    else
        return 36, (l_Roact_0.createElement(l_ImageSetLabel_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = v17.image, 
            ImageColor3 = v15.Theme.IconEmphasis.Color, 
            ImageTransparency = v15.Theme.IconEmphasis.Transparency, 
            Position = UDim2.new(0.5, 0, 0.5, -1), 
            Size = UDim2.new(0, 16, 0, 16)
        }));
    end;
end;
return function(v26)
    if v9.propValidation then
        assert(v13(v26));
    end;
    return l_withStyle_0(function(v27)
        local v28 = v27.Theme[v26.borderThemeKey or "UIEmphasis"];
        local v29, v30, v31 = v25(v26.input, v27, v26.textThemeKey);
        local v32 = nil;
        if v31 then
            v32 = 9;
        end;
        return l_Roact_0.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            ImageTransparency = v28.Transparency, 
            ImageColor3 = v28.Color, 
            Image = v8.Images.KeyBorder, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(Vector2.new(9, 7), Vector2.new(26, 26)), 
            Size = UDim2.new(0, v29, 0, 36), 
            Position = v26.Position, 
            AnchorPoint = v26.AnchorPoint, 
            LayoutOrder = v26.LayoutOrder, 
            ZIndex = v26.ZIndex
        }, {
            Padding = v32 and l_Roact_0.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v32), 
                PaddingRight = UDim.new(0, v32)
            }), 
            LabelContent = v30
        });
    end);
end;

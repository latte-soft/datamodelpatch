local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local _ = require(l_Parent_0.Types);
local v5 = require(l_Parent_0.Constants);
local _ = require(l_Parent_2.Style.Fonts);
local v7 = require(l_Parent_2.ImageSet.Images);
local v8 = require(l_Parent_3.Core.Text.GetTextSize);
local v9 = require(l_Parent_1.platformIconMap);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_DIRECTIONAL_GAMEPAD_ICONS_0 = v9.DIRECTIONAL_GAMEPAD_ICONS;
local l_GAMEPAD_ICONS_0 = v9.GAMEPAD_ICONS;
local v13 = {
    [Enum.KeyCode.Escape] = "Esc", 
    [Enum.KeyCode.Print] = "Prt Sc", 
    [Enum.KeyCode.ScrollLock] = "Sc Lock", 
    [Enum.KeyCode.Pause] = "Pause", 
    [Enum.KeyCode.Insert] = "Ins", 
    [Enum.KeyCode.PageUp] = "PgUp", 
    [Enum.KeyCode.NumLock] = "Num Lock", 
    [Enum.KeyCode.Delete] = "Del", 
    [Enum.KeyCode.End] = "End", 
    [Enum.KeyCode.PageDown] = "PgDn", 
    [Enum.KeyCode.CapsLock] = "Caps", 
    [Enum.KeyCode.Return] = "Enter", 
    [Enum.KeyCode.LeftShift] = "Shift", 
    [Enum.KeyCode.LeftControl] = "Ctrl", 
    [Enum.KeyCode.LeftAlt] = "Alt", 
    [Enum.KeyCode.Space] = "Space", 
    [Enum.KeyCode.LeftMeta] = "Fn", 
    [Enum.KeyCode.LeftSuper] = "Cmd", 
    [Enum.KeyCode.Tilde] = "~", 
    [Enum.KeyCode.Up] = v7["icons/controls/keys/arrowUp"], 
    [Enum.KeyCode.Down] = v7["icons/controls/keys/arrowDown"], 
    [Enum.KeyCode.Left] = v7["icons/controls/keys/arrowLeft"], 
    [Enum.KeyCode.Right] = v7["icons/controls/keys/arrowRight"]
};
local function v16(v14)
    if type(v14) == "table" then
        return {
            inputType = "gamepad", 
            content = l_DIRECTIONAL_GAMEPAD_ICONS_0[v14.key][v14.axis]
        };
    elseif not l_GAMEPAD_ICONS_0[v14] then
        local l_l_UserInputService_0_StringForKeyCode_0 = l_UserInputService_0:GetStringForKeyCode(v14);
        return {
            inputType = "keyboard", 
            content = v13[v14] or if l_l_UserInputService_0_StringForKeyCode_0 ~= "" then l_l_UserInputService_0_StringForKeyCode_0 else v14.Name
        };
    else
        return {
            inputType = "gamepad", 
            content = l_GAMEPAD_ICONS_0[v14]
        };
    end;
end;
local function v23(v17, v18)
    if v17.inputType == "keyboard" then
        if type(v17.content) == "string" then
            local l_BaseSize_0 = v18.BaseSize;
            local l_CaptionBody_0 = v18.CaptionBody;
            local l_X_0 = v8(v17.content, l_BaseSize_0 * l_CaptionBody_0.RelativeSize, l_CaptionBody_0.Font, Vector2.zero).X;
            if v5.PREFERRED_WIDTH < l_X_0 + 2 * v5.MIN_SIDE_PADDING then
                return l_X_0 + 2 * v5.SIDE_PADDING;
            end;
        end;
        return v5.PREFERRED_WIDTH;
    elseif v17.inputType == "gamepad" then
        local v22 = if typeof(v17.content) == "string" then v5.DEFAULT_GAMEPAD_ICON_SIZE else v17.content.ImageRectSize;
        return (v22.X * v5.HEIGHT) / v22.Y;
    else
        assert(false, string.format("Unreachable: Invalid inputType value: %q", v17.inputType));
        return ;
    end;
end;
getKeyLabelWidth = function(v24, v25)
    return v23(v16(v24), v25);
end;
return {
    getKeyLabelWidth = getKeyLabelWidth, 
    getKeyCodeContent = v16, 
    getWidthFromContent = v23
};

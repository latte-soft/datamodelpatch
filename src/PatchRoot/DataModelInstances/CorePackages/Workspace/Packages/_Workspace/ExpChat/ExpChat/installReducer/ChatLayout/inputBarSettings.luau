local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v4 = require(l_script_FirstAncestor_0.Config);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
return v2.createReducer({
    BackgroundTransparency = v4.ChatInputBarBackgroundTransparency, 
    BackgroundColor3 = v4.ChatInputBarBackgroundColor, 
    TextSize = v4.ChatInputBarTextSize, 
    TextColor3 = v4.ChatInputBarTextColor3, 
    TextStrokeColor3 = v4.ChatInputBarTextStrokeColor, 
    TextStrokeTransparency = v4.ChatInputBarTextStrokeTransparency, 
    FontFace = v4.ChatInputBarFontFace, 
    PlaceholderColor3 = v4.ChatInputBarPlaceholderColor, 
    KeyboardKeyCode = v4.ChatInputBarDefaultFocusKeyCode, 
    AutocompleteEnabled = v4.ChatInputBarDefaultAutocompleteEnabled
}, {
    [require(l_Actions_0.ConfigurationObjectsLoaded).name] = function(v6, v7)
        return l_Dictionary_0.join(v6, v7.chatInputBarSettings);
    end, 
    [require(l_Actions_0.ChatInputBarSettingsChanged).name] = function(v8, v9)
        if v8[v9.property] == nil then
            return v8;
        else
            return l_Dictionary_0.join(v8, {
                [v9.property] = v9.value
            });
        end;
    end
});

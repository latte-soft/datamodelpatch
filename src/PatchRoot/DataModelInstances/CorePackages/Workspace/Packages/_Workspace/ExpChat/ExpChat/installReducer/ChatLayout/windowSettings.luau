local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v4 = require(l_script_FirstAncestor_0.Config);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
return v2.createReducer({
    Font = v4.ChatWindowFont, 
    TextColor3 = v4.ChatWindowTextColor3, 
    TextSize = v4.ChatWindowTextSize, 
    TextStrokeColor3 = v4.ChatWindowTextStrokeColor, 
    TextStrokeTransparency = v4.ChatWindowTextStrokeTransparency, 
    BackgroundColor3 = v4.ChatWindowBackgroundColor3, 
    BackgroundTransparency = v4.ChatWindowBackgroundTransparency, 
    HeightScale = 1, 
    WidthScale = 1
}, {
    [require(l_Actions_0.ConfigurationObjectsLoaded).name] = function(v6, v7)
        return l_Dictionary_0.join(v6, v7.chatWindowSettings);
    end, 
    [require(l_Actions_0.ChatWindowSettingsChanged).name] = function(v8, v9)
        if v8[v9.property] then
            return l_Dictionary_0.join(v8, {
                [v9.property] = v9.value
            });
        else
            return v8;
        end;
    end
});

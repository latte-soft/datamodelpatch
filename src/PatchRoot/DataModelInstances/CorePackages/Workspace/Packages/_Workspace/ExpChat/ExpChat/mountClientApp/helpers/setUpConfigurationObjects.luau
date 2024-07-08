local l_TextChatService_0 = game:GetService("TextChatService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v4 = require(l_Flags_0.getEnableChatInputBarConfigurationStyleCustomizations);
local v5 = require(l_Flags_0.getTextChatServicePropertyTextBox);
local v6 = require(l_script_FirstAncestor_0.Analytics);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v8 = require(l_Actions_0.ConfigurationObjectsLoaded);
local v9 = require(l_Actions_0.ChatInputBarConfigurationEnabled);
local v10 = require(l_Actions_0.ChatWindowConfigurationEnabled);
local v11 = require(l_Actions_0.TargetTextChannelPropertyChanged);
local v12 = require(l_Actions_0.BubbleChatSettingsChanged);
local v13 = require(l_Actions_0.ChatLayoutVerticalAlignmentChanged);
local v14 = require(l_Actions_0.ChatLayoutHorizontalAlignmentChanged);
local v15 = require(l_Actions_0.ChatWindowSettingsChanged);
local v16 = require(l_Actions_0.ChatInputBarSettingsChanged);
local v17 = require(l_Actions_0.DevTextBoxEnabledChanged);
local v18 = require(script.Parent.setUpBubbleChatConfigurationChildren);
local v19 = require(l_script_FirstAncestor_0.Flags.getEnableChatInputBarConfigurationPropertyKeyboardKeyCode);
local v20 = require(l_script_FirstAncestor_0.Flags.getEnableBubbleChatConfigurationMaxBubbles);
local v21 = require(l_script_FirstAncestor_0.Flags.getEnableBubbleChatConfigurationTailVisible);
local v22 = require(l_script_FirstAncestor_0.Flags.getEnableChatInputBarConfigurationAutocompleteEnabled);
local function _(v23)
    local l_l_UserInputService_0_StringForKeyCode_0 = l_UserInputService_0:GetStringForKeyCode(v23);
    if not (l_l_UserInputService_0_StringForKeyCode_0 ~= nil) or l_l_UserInputService_0_StringForKeyCode_0 == "" then
        warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(v23));
        return false;
    else
        return true;
    end;
end;
return function(v26, v27)
    if v27.analytics then
        v6.with(v27.analytics);
    end;
    local function v32(v28, v29, v30)
        local v31 = nil;
        if not (type(v30) ~= "number" and type(v30) ~= "boolean") or typeof(v30) == "EnumItem" then
            v31 = tostring(v30);
        elseif typeof(v30) == "Color3" then
            v31 = v30:ToHex();
        elseif typeof(v30) == "Font" then
            v31 = tostring((string.gsub(v30.Family, "rbxasset://fonts/families/", ""))) .. " " .. tostring(v30.Weight) .. " " .. tostring(v30.Style);
        else
            return ;
        end;
        assert(v31, "should exist");
        v6.FireClientAnalyticsWithEventName(v28, {
            [v29] = v31
        });
    end;
    v26:dispatch(v8({
        bubbleChatSettings = (function()
            local l_BubbleChatConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("BubbleChatConfiguration");
            local v34 = {};
            if not l_BubbleChatConfiguration_0 then
                return {};
            else
                local v35 = {
                    "Enabled", 
                    "AdorneeName", 
                    "BubbleDuration", 
                    "BubblesSpacing", 
                    "VerticalStudsOffset", 
                    "LocalPlayerStudsOffset", 
                    "MinimizeDistance", 
                    "MaxDistance", 
                    "BackgroundColor3", 
                    "TextColor3", 
                    "TextSize", 
                    "FontFace"
                };
                if v4() then
                    table.insert(v35, "BackgroundTransparency");
                end;
                if v20() then
                    table.insert(v35, "MaxBubbles");
                end;
                if v21() then
                    table.insert(v35, "TailVisible");
                end;
                for _, v37 in ipairs(v35) do
                    if l_BubbleChatConfiguration_0[v37] then
                        local v38 = l_BubbleChatConfiguration_0[v37];
                        v34[v37] = v38;
                        v32("BubbleChatConfigurationLoaded", v37, v38);
                    end;
                end;
                l_BubbleChatConfiguration_0.Changed:Connect(function(v39)
                    local v40 = l_BubbleChatConfiguration_0[v39];
                    v26:dispatch(v12(v39, v40));
                    v32("BubbleChatConfigurationChanged", v39, v40);
                end);
                local v41 = v18(v26);
                for v42, v43 in pairs(v41) do
                    if v43 then
                        v34[v42] = v41[v42];
                    end;
                end;
                return v34;
            end;
        end)(), 
        chatWindowSettings = (function()
            local l_ChatWindowConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
            local v45 = {};
            if not l_ChatWindowConfiguration_0 then
                return {};
            else
                v26:dispatch(v10(l_ChatWindowConfiguration_0.Enabled));
                l_ChatWindowConfiguration_0:GetPropertyChangedSignal("Enabled"):Connect(function()
                    v26:dispatch(v10(l_ChatWindowConfiguration_0.Enabled));
                end);
                v26:dispatch(v14(l_ChatWindowConfiguration_0.HorizontalAlignment));
                l_ChatWindowConfiguration_0:GetPropertyChangedSignal("HorizontalAlignment"):Connect(function()
                    v26:dispatch(v14(l_ChatWindowConfiguration_0.HorizontalAlignment));
                end);
                v26:dispatch(v13(l_ChatWindowConfiguration_0.VerticalAlignment));
                l_ChatWindowConfiguration_0:GetPropertyChangedSignal("VerticalAlignment"):Connect(function()
                    v26:dispatch(v13(l_ChatWindowConfiguration_0.VerticalAlignment));
                end);
                for _, v47 in ipairs({
                    "BackgroundColor3", 
                    "BackgroundTransparency", 
                    "FontFace", 
                    "TextColor3", 
                    "TextSize", 
                    "TextStrokeColor3", 
                    "TextStrokeTransparency", 
                    "HeightScale", 
                    "WidthScale", 
                    "HorizontalAlignment", 
                    "VerticalAlignment"
                }) do
                    if l_ChatWindowConfiguration_0[v47] then
                        local v48 = l_ChatWindowConfiguration_0[v47];
                        v45[v47] = v48;
                        v32("ChatWindowConfigurationLoaded", v47, v48);
                    end;
                end;
                l_ChatWindowConfiguration_0.Changed:Connect(function(v49)
                    local v50 = l_ChatWindowConfiguration_0[v49];
                    v26:dispatch(v15(v49, v50));
                    v32("ChatWindowConfigurationChanged", v49, v50);
                end);
                return v45;
            end;
        end)(), 
        chatInputBarSettings = (function()
            local l_ChatInputBarConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
            local v52 = {};
            if not l_ChatInputBarConfiguration_0 then
                return {};
            else
                v26:dispatch(v9(l_ChatInputBarConfiguration_0.Enabled));
                l_ChatInputBarConfiguration_0:GetPropertyChangedSignal("Enabled"):Connect(function()
                    v26:dispatch(v9(l_ChatInputBarConfiguration_0.Enabled));
                end);
                l_ChatInputBarConfiguration_0:GetPropertyChangedSignal("TargetTextChannel"):Connect(function()
                    v26:dispatch(v11(l_ChatInputBarConfiguration_0.TargetTextChannel));
                end);
                if v27.defaultTargetTextChannel then
                    l_ChatInputBarConfiguration_0.TargetTextChannel = v27.defaultTargetTextChannel;
                end;
                if v5() then
                    v26:dispatch(v17(l_ChatInputBarConfiguration_0.TextBox ~= nil));
                    l_ChatInputBarConfiguration_0:GetPropertyChangedSignal("TextBox"):Connect(function()
                        v26:dispatch(v17(l_ChatInputBarConfiguration_0.TextBox ~= nil));
                    end);
                end;
                v26.changed:connect(function(v53, v54)
                    if v53.TextChannels ~= v54.TextChannels and v53.TextChannels.targetTextChannel ~= v54.TextChannels.targetTextChannel then
                        l_ChatInputBarConfiguration_0.TargetTextChannel = v53.TextChannels.targetTextChannel;
                    end;
                end);
                if v4() then
                    local v55 = {
                        "BackgroundTransparency", 
                        "BackgroundColor3", 
                        "TextSize", 
                        "TextColor3", 
                        "TextStrokeColor3", 
                        "TextStrokeTransparency", 
                        "FontFace", 
                        "PlaceholderColor3"
                    };
                    if v19() then
                        table.insert(v55, "KeyboardKeyCode");
                    end;
                    if v22() and l_ChatInputBarConfiguration_0.AutocompleteEnabled ~= nil then
                        table.insert(v55, "AutocompleteEnabled");
                    end;
                    for _, v57 in ipairs(v55) do
                        if l_ChatInputBarConfiguration_0[v57] then
                            local v58 = l_ChatInputBarConfiguration_0[v57];
                            if v19() and v57 == "KeyboardKeyCode" then
                                local l_l_UserInputService_0_StringForKeyCode_1 = l_UserInputService_0:GetStringForKeyCode(v58);
                                local v60;
                                if not (l_l_UserInputService_0_StringForKeyCode_1 ~= nil) or l_l_UserInputService_0_StringForKeyCode_1 == "" then
                                    warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(v58));
                                    v60 = false;
                                else
                                    v60 = true;
                                end;
                                if not v60 then
                                    l_ChatInputBarConfiguration_0.KeyboardKeyCode = Enum.KeyCode.Slash;
                                    v52[v57] = Enum.KeyCode.Slash;
                                    continue;
                                end;
                            end;
                            v52[v57] = v58;
                            v32("ChatInputBarConfigurationLoaded", v57, v58);
                        end;
                    end;
                    l_ChatInputBarConfiguration_0.Changed:Connect(function(v61)
                        local v62 = l_ChatInputBarConfiguration_0[v61];
                        if v19() and v61 == "KeyboardKeyCode" then
                            local l_l_UserInputService_0_StringForKeyCode_2 = l_UserInputService_0:GetStringForKeyCode(v62);
                            local v64;
                            if not (l_l_UserInputService_0_StringForKeyCode_2 ~= nil) or l_l_UserInputService_0_StringForKeyCode_2 == "" then
                                warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(v62));
                                v64 = false;
                            else
                                v64 = true;
                            end;
                            if not v64 then
                                l_ChatInputBarConfiguration_0.KeyboardKeyCode = v26:getState().ChatLayout.ChatInputBarSettings.KeyboardKeyCode;
                                return ;
                            end;
                        end;
                        v26:dispatch(v16(v61, v62));
                        v32("ChatInputBarConfigurationChanged", v61, v62);
                    end);
                end;
                return v52;
            end;
        end)()
    }));
end;

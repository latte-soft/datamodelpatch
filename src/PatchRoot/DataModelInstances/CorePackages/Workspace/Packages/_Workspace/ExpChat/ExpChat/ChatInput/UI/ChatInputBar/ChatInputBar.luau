local l_Players_0 = game:GetService("Players");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UIBlox);
local v6 = require(l_Parent_0.Promise);
local l_List_0 = require(l_Parent_0.llama).List;
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local v10 = require(l_script_FirstAncestor_0.ClientSettings.useInterpolatedClientSettings);
local v11 = require(l_script_FirstAncestor_0.Config);
local v12 = require(l_script_FirstAncestor_0.Logger):new("ExpChat/" .. script.Name);
local v13 = require(l_script_FirstAncestor_0.Commands.autoCastCommand);
local v14 = require(l_script_FirstAncestor_0.Commands.Whisper.RBXWhisperCommand);
local v15 = require(l_script_FirstAncestor_0.Commands.RBXTeamCommand);
local v16 = require(l_script_FirstAncestor_0.Localization);
local v17 = require(l_script_FirstAncestor_0.getOtherDisplayNameInWhisperChannel);
local v18 = require(script.Parent.ChannelChip);
local v19 = require(l_script_FirstAncestor_0.Autocomplete.AutocompleteText);
local v20 = require(l_script_FirstAncestor_0.Autocomplete.Initializations.initializeEmojis);
local v21 = require(l_script_FirstAncestor_0.Autocomplete.Initializations.initializeCommands);
local v22 = require(l_script_FirstAncestor_0.Autocomplete.SortingCallbacks.sortEmojiResultsCallback);
local v23 = require(l_script_FirstAncestor_0.Autocomplete.SortingCallbacks.sortCommandResultsCallback);
local v24 = require(script:FindFirstAncestor("ChatInput").UI.AutocompleteDropdown);
local v25 = require(l_script_FirstAncestor_0.Flags.GetFFlagFixChatInputFocus);
local v26 = require(l_script_FirstAncestor_0.Flags.getEnableChatInputBarConfigurationPropertyIsFocused);
local v27 = require(l_script_FirstAncestor_0.Flags.getEnableChatInputBarConfigurationAutocompleteEnabled);
local v28 = require(l_script_FirstAncestor_0.Flags.FFlagEnableCommandAutocomplete);
local v29 = game:DefineFastFlag("TriggerEmojiAutocompleteWithTwoCharacters", false);
local v30 = require(l_script_FirstAncestor_0.Flags.getTextChatServiceTextChatCommandAutocompleteVisible);
local function v34(v31, v32)
    return v32:map(function(v33)
        return v31 + v33 * (1 - v31);
    end);
end;
return v16.connect(function(v35)
    local v36 = nil;
    if v35.targetTextChannel then
        for v37, v38 in pairs({
            RBXTeam = "CoreScripts.TextChat.TeamChat.PrefixText", 
            RBXWhisper = "CoreScripts.TextChat.WhisperChat.PrefixText.Outgoing"
        }) do
            if string.match(v35.targetTextChannel.Name, v37) then
                if v37 == "RBXWhisper" then
                    local v39 = v17(v35.targetTextChannel, v35.localPlayer);
                    if v39 then
                        v36 = {
                            v38, 
                            {
                                RBX_NAME = v39
                            }
                        };
                    end;
                else
                    v36 = v38;
                end;
            end;
        end;
    end;
    return {
        targetTextChannelDisplayName = v36
    };
end)(function(v40)
    local v41, v42 = v4.useState("");
    local v43, v44 = v4.useState(false);
    local v45, v46 = v4.useState(0);
    local v47, v48 = v4.useBinding(0);
    local v49 = v4.useRef(false);
    local v50 = v4.useRef(nil);
    local v51 = v4.useRef(nil);
    local v52 = v4.useRef(nil);
    local v53 = v4.useRef(nil);
    local v54 = v4.useRef(false);
    local v55, v56 = v4.useState(0);
    local v57 = v19.new(v20);
    local v58 = v19.new(v21);
    v4.useEffect(function()
        if v28() then
            l_TextChatService_0.ChildAdded:Connect(function(v59)
                if v59.ClassName == "TextChatCommand" and string.sub(v59.PrimaryAlias, 1, 1) == "/" then
                    v58 = v19.new(v21);
                    if v30() then
                        v59:GetPropertyChangedSignal("AutocompleteVisible"):Connect(function()
                            v58 = v19.new(v21);
                        end);
                    end;
                end;
            end);
        end;
    end, {});
    local v61 = v4.useCallback(function()
        v12:trace("onSendActivated with input text: '{}'", v41);
        if v49.current and v40.canLocalUserChat then
            if not v50.current then
                v12:debug("onSendActivated could not send message because textBoxRef.current was nil");
            else
                local l_Text_0 = v50.current.Text;
                if v40.onSendChat and string.find(l_Text_0, "%S") ~= nil then
                    v40.onSendChat(l_Text_0);
                else
                    v12:debug("onSendActivated could not send message. text: '{}' canLocalUserChat: {}", l_Text_0, v40.canLocalUserChat);
                end;
                v50.current.Text = "";
                v50.current:ReleaseFocus();
                v42("");
                if v40.targetTextChannel and v40.targetTextChannelDisplayName ~= "" then
                    v54.current = true;
                    return ;
                end;
            end;
            return ;
        else
            v12:debug("onSendActivated could not send message. isMounted: {} canLocalUserChat: {}", tostring(v49.current), v40.canLocalUserChat);
            return ;
        end;
    end, {
        v41
    });
    local v68 = v4.useCallback(function(v62)
        v40.autocompleteDropdownActivated(false);
        v40.autocompleteDropdownResultsChanged({});
        local l_current_0 = v50.current;
        if not l_current_0 then
            v12:error("Could not find textBox");
            return ;
        else
            local l_Text_1 = l_current_0.Text;
            local v65 = string.sub(l_Text_1, 1, v45 - 1);
            local v66 = string.sub(l_Text_1, v45, #l_Text_1);
            local v67 = "";
            if v40.autocompleteDropdownReducer.autocompleteType == "emojis" then
                v67 = string.gsub(v65, ":[^:]*$", v62.EmojiLabel.Text);
            elseif v28() and v40.autocompleteDropdownReducer.autocompleteType == "commands" then
                v67 = string.gsub(v65, "(/.*)", v62.TextLabel.Text);
            end;
            if v66 ~= "" then
                v67 = v67 .. v66;
            end;
            l_current_0.Text = v67;
            v42(v67);
            if v49.current then
                l_current_0:CaptureFocus();
                if v66 ~= "" then
                    l_current_0.CursorPosition = (#v67 - #v66) + 1;
                end;
            end;
            v40.autocompleteDropdownDeactivated();
            return ;
        end;
    end);
    v4.useEffect(function()
        if v49.current then
            local l_current_1 = v50.current;
            if not l_current_1 then
                v12:error("Could not focus chat input bar because textBox not found");
            else
                l_current_1:CaptureFocus();
                return ;
            end;
        end;
    end, {
        v40.shouldFocusChatInputBar
    });
    v4.useEffect(function()
        v12:trace("Mounted");
        v49.current = true;
        return function()
            v12:trace("Unmounting");
            v49.current = false;
        end;
    end, {});
    v4.useEffect(function()
        if v40.autocompleteEnabled then
            local l_current_2 = v50.current;
            if l_current_2 then
                l_current_2:GetPropertyChangedSignal("CursorPosition"):Connect(function()
                    local l_CursorPosition_0 = l_current_2.CursorPosition;
                    if l_CursorPosition_0 and l_CursorPosition_0 ~= -1 then
                        v46(l_CursorPosition_0);
                    end;
                end);
            end;
        end;
    end, {});
    v4.useEffect(function()
        if not v40.autocompleteEnabled then
            return function()
            end;
        else
            v53.current = v40.userInputService.InputBegan:connect(function(v72, _)
                if v40.autocompleteDropdownReducer.activated and (Enum.KeyCode.Up or Enum.KeyCode.Down) then
                    if v72.KeyCode == Enum.KeyCode.Up and v40.autocompleteDropdownReducer.selectedIndex > 1 then
                        v40.autocompleteDropdownSelectionChanged(v40.autocompleteDropdownReducer.selectedIndex - 1);
                    end;
                    if v72.KeyCode == Enum.KeyCode.Down and v40.autocompleteDropdownReducer.selectedIndex < #v40.autocompleteDropdownReducer.results then
                        v40.autocompleteDropdownSelectionChanged(v40.autocompleteDropdownReducer.selectedIndex + 1);
                    end;
                end;
            end);
            return function()
                local l_current_3 = v53.current;
                if not (not l_current_3 or not l_current_3.Connected) then
                    l_current_3:Disconnect();
                end;
                v53.current = nil;
            end;
        end;
    end, {
        v40.userInputService, 
        v40.autocompleteDropdownReducer
    });
    v4.useEffect(function()
        v52.current = v40.userInputService.InputEnded:connect(function(v75, _)
            if (v50.current and v50.current:IsFocused()) and v75.KeyCode == Enum.KeyCode.Backspace then
                if not v54.current then
                    if v41 == "" and v40.targetTextChannelDisplayName ~= "" then
                        v54.current = true;
                    end;
                else
                    v40.resetTargetChannel();
                    v12:debug("ChatInputBar ChatInputBarResetTargetChannel()");
                    v54.current = false;
                    return ;
                end;
            end;
        end);
        return function()
            local l_current_4 = v52.current;
            if not (not l_current_4 or not l_current_4.Connected) then
                l_current_4:Disconnect();
            end;
            v52.current = nil;
        end;
    end, {
        v40.userInputService
    });
    v4.useEffect(function()
        v40.contextActionService:BindCoreAction("FocusChat", function(_, v79, v80)
            if v40.isChatHotkeyEnabled and (not (v80.KeyCode ~= v11.ChatInputBarDefaultFocusKeyCode) or v80.KeyCode == v40.devDefinedFocusKeyCode) then
                local l_current_5 = v50.current;
                if not ((not (l_current_5 and v79 == Enum.UserInputState.Begin) or not l_current_5) or l_current_5:IsFocused()) then
                    if not v25() then
                        task.defer(function()
                            l_current_5:CaptureFocus();
                        end);
                    else
                        task.delay(0, function()
                            l_current_5:CaptureFocus();
                        end);
                    end;
                    v40.focusChatHotKeyActivated();
                    return Enum.ContextActionResult.Sink;
                end;
            end;
            return Enum.ContextActionResult.Pass;
        end, false, Enum.UserInputType.Keyboard);
        return function()
            v40.contextActionService:UnbindCoreAction("FocusChat");
        end;
    end, {
        v40.isChatHotkeyEnabled, 
        v40.devDefinedFocusKeyCode
    });
    local function _(v82)
        local l_ChatInputBarConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
        if not (not l_ChatInputBarConfiguration_0 or not v26()) then
            l_ChatInputBarConfiguration_0.IsFocusedWrite = v82;
        end;
    end;
    local v86 = v4.useCallback(function()
        v44(true);
        v40.onFocus();
        local l_ChatInputBarConfiguration_1 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
        if not (not l_ChatInputBarConfiguration_1 or not v26()) then
            l_ChatInputBarConfiguration_1.IsFocusedWrite = true;
        end;
    end, {
        v40.onFocus
    });
    local v103 = v4.useCallback(function(_, v88, v89)
        v12:debug("Focus lost with enter: {}", (tostring(v88)));
        local l_current_6 = v51.current;
        if v88 then
            if not ((not v40.autocompleteEnabled or not l_current_6) or not v40.autocompleteDropdownReducer.activated) and #v40.autocompleteDropdownReducer.results > 0 then
                for _, v92 in ipairs(l_current_6.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame:GetChildren()) do
                    if v92.ClassName == "Frame" and v92.LayoutOrder == v40.autocompleteDropdownReducer.selectedIndex then
                        v68(v92.TextLabelButton);
                        return ;
                    end;
                end;
            else
                v61();
            end;
        end;
        if v49.current then
            if (not v40.autocompleteEnabled or not l_current_6) or not v40.autocompleteDropdownReducer.activated then
                v44(false);
            elseif v89.KeyCode == Enum.KeyCode.Escape then
                v40.autocompleteDropdownActivated(false);
                local l_current_7 = v50.current;
                if not l_current_7 then
                    v12:error("Could not focus chat input bar because textBox not found");
                else
                    local l_v45_0 = v45;
                    l_current_7:CaptureFocus();
                    l_current_7.CursorPosition = l_v45_0;
                    return ;
                end;
            else
                local l_X_0 = v89.Position.X;
                local l_Y_0 = v89.Position.Y;
                local l_X_1 = l_current_6.AbsolutePosition.X;
                local v98 = l_X_1 + l_current_6.AbsoluteSize.X;
                local l_Y_1 = l_current_6.AbsolutePosition.Y;
                local v100 = l_Y_1 + l_current_6.AbsoluteSize.Y;
                if not ((l_X_0 >= l_X_1 and v98 >= l_X_0) and l_Y_0 >= l_Y_1) or v100 < l_Y_0 then
                    v40.autocompleteDropdownActivated(false);
                end;
            end;
        end;
        v40.onUnfocus();
        local l_ChatInputBarConfiguration_2 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
        if not (not l_ChatInputBarConfiguration_2 or not v26()) then
            l_ChatInputBarConfiguration_2.IsFocusedWrite = false;
        end;
        l_ChatInputBarConfiguration_2 = l_Players_0.LocalPlayer;
        if l_ChatInputBarConfiguration_2 then
            local l_TextBox_0 = Instance.new("TextBox");
            l_TextBox_0.Visible = false;
            l_TextBox_0.Parent = l_ChatInputBarConfiguration_2:FindFirstChildOfClass("PlayerGui");
            l_TextBox_0:CaptureFocus();
            l_TextBox_0:ReleaseFocus();
            l_TextBox_0:Destroy();
        end;
    end);
    local function v120(v104, v105, v106)
        if v28() and (not (not (v106 == "/") or v104.CursorPosition ~= 2) or v40.autocompleteDropdownReducer.autocompleteType == "commands" and v106 ~= ":") then
            v40.autocompleteDropdownTypeChanged("commands");
            v40.autocompleteDropdownActivated(true);
            if v106 ~= "" and v106 ~= " " then
                local v107 = string.sub(v105, 1, v104.CursorPosition - 1):lower();
                local v108 = v58:getResults(v107, v23);
                v40.autocompleteDropdownResultsChanged(v108);
                if v107 == v108[1] then
                    v40.autocompleteDropdownActivated(false);
                    v40.autocompleteDropdownResultsChanged({});
                    return ;
                end;
            else
                v40.autocompleteDropdownDeactivated();
            end;
            return ;
        elseif (v40.autocompleteDropdownReducer.activated or #v40.autocompleteDropdownReducer.results > 0) and v40.autocompleteDropdownReducer.autocompleteType == "emojis" then
            v40.autocompleteDropdownActivated(true);
            local v109 = string.find(string.sub(v105, 1, v104.CursorPosition - 1), ":[^:]*$");
            if not ((v106 ~= "" and v106 ~= ":") and v106 ~= " ") or not v109 then
                if v106 == ":" then
                    if v109 ~= v55 then
                        local v110 = string.sub(v105, v55 + 1, v104.CursorPosition - 2):lower();
                        if not l_List_0.includes(v40.autocompleteDropdownReducer.results, v110) then
                            v40.autocompleteDropdownActivated(false);
                            v40.autocompleteDropdownResultsChanged({});
                        else
                            local v111 = string.sub(v105, 1, v104.CursorPosition - 2) .. string.sub(v105, v104.CursorPosition, #v105);
                            v104.Text = v111;
                            v42(v111);
                            v104.CursorPosition = v104.CursorPosition - 1;
                            local l_current_8 = v51.current;
                            if l_current_8 then
                                for _, v114 in ipairs(l_current_8.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame:GetChildren()) do
                                    if v114.ClassName == "Frame" then
                                        local l_TextLabelButton_0 = v114:FindFirstChild("TextLabelButton");
                                        if l_TextLabelButton_0 then
                                            local l_TextLabel_0 = l_TextLabelButton_0:FindFirstChild("TextLabel");
                                            if not (not l_TextLabel_0 or not l_TextLabel_0.Text) and l_TextLabel_0.Text == v110 then
                                                v68(l_TextLabelButton_0);
                                                return ;
                                            end;
                                        end;
                                    end;
                                end;
                                return ;
                            end;
                        end;
                        return ;
                    else
                        v40.autocompleteDropdownResultsChanged({});
                        return ;
                    end;
                elseif v106 == " " then
                    v40.autocompleteDropdownActivated(false);
                    v40.autocompleteDropdownResultsChanged({});
                    return ;
                else
                    v40.autocompleteDropdownDeactivated();
                    v56(0);
                    return ;
                end;
            elseif not v29 then
                v40.autocompleteDropdownResultsChanged((v57:getResults(string.sub(v105, v109 + 1, v104.CursorPosition - 1):lower(), v22)));
                return ;
            else
                local v117 = string.sub(v105, v109 + 1, v104.CursorPosition - 1):lower();
                local v118 = {};
                if v117 and string.len(v117) > 1 then
                    v118 = v57:getResults(v117, v22);
                end;
                v40.autocompleteDropdownResultsChanged(v118);
                return ;
            end;
        else
            local v119 = string.find(v105, ":[^:]*$");
            if v106 == ":" then
                v40.autocompleteDropdownTypeChanged("emojis");
                v40.autocompleteDropdownActivated(true);
                v40.autocompleteDropdownResultsChanged({});
                v56(v119);
            end;
            return ;
        end;
    end;
    local v131 = v4.useCallback(function(v121)
        local l_Text_2 = v121.Text;
        if v40.autocompleteEnabled then
            local v123 = string.find(l_Text_2, "\r");
            local v124 = v121.CursorPosition < #l_Text_2 + 1;
            if v123 then
                local v125 = string.gsub(l_Text_2, "\r", "");
                v121.Text = v125;
                v42(v125);
                if v124 then
                    v121.CursorPosition = v121.CursorPosition - 1;
                end;
                return ;
            end;
        end;
        local v126 = string.sub(l_Text_2, v121.CursorPosition - 1, v121.CursorPosition - 1);
        v12:trace("Input: {}", l_Text_2);
        local v127 = if not utf8.len(l_Text_2) then string.len(l_Text_2) else utf8.len(utf8.nfcnormalize(l_Text_2));
        if v127 and v40.messageCharacterLimit < v127 then
            v12:debug("Message is over the character limit of {}", (tostring(v40.messageCharacterLimit)));
            v121.Text = v41;
            return ;
        else
            v42(l_Text_2);
            if not (not v27() or not v40.autocompleteEnabled) then
                v120(v121, l_Text_2, v126);
            end;
            local l_v54_0 = v54;
            local v129 = false;
            if #l_Text_2 == 0 then
                v129 = v54.current;
            end;
            l_v54_0.current = v129;
            if v40.localPlayer then
                l_v54_0 = v40.localPlayer.UserId;
                v6.any({
                    v13(v15, l_v54_0, l_Text_2), 
                    v13(v14, l_v54_0, l_Text_2)
                }):andThen(function()
                    v121.Text = "";
                    v42("");
                    v54.current = true;
                end):catch(function(v130)
                    v12:trace("Could not send autoCastCommand. Error: {}", v130);
                end);
            end;
            return ;
        end;
    end);
    local v133 = v4.useCallback(function(v132)
        v48(not not v132.Visible and v132.AbsoluteSize.X or 0);
    end);
    local v135 = v4.useCallback(function(v134)
        v40.autocompleteDropdownSelectionChanged(v134.LayoutOrder);
    end);
    local v136 = v41 == "";
    local v137 = v136 and not v43;
    local l_chatInputBarSettings_0 = v40.chatInputBarSettings;
    local l_chatWindowSettings_0 = v40.chatWindowSettings;
    local l_BackgroundTransparency_0 = v10(l_chatInputBarSettings_0).BackgroundTransparency;
    local l_BackgroundTransparency_1 = v10(l_chatWindowSettings_0).BackgroundTransparency;
    local l_BackgroundColor3_0 = v10(l_chatWindowSettings_0).BackgroundColor3;
    local l_createElement_0 = v4.createElement;
    local v144 = "Frame";
    local v150 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = l_BackgroundColor3_0, 
        BackgroundTransparency = v40.transparencyValue:map(function(v145)
            return l_BackgroundTransparency_1 + v145 * (1 - l_BackgroundTransparency_1);
        end), 
        BorderSizePixel = 0, 
        LayoutOrder = v40.LayoutOrder, 
        Size = v40.size, 
        Visible = v40.visible, 
        [v4.Event.MouseEnter] = v40.onHovered, 
        [v4.Event.MouseLeave] = v40.onUnhovered, 
        [v4.Change.AbsoluteSize] = v4.useCallback(function(v146)
            local l_ChatInputBarConfiguration_3 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
            if not (not l_ChatInputBarConfiguration_3 or not v40.onAbsoluteSizeChanged) then
                v40.onAbsoluteSizeChanged(v146, l_ChatInputBarConfiguration_3);
            end;
        end), 
        [v4.Change.AbsolutePosition] = v4.useCallback(function(v148)
            local l_ChatInputBarConfiguration_4 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
            if not (not l_ChatInputBarConfiguration_4 or not v40.onAbsolutePositionChanged) then
                v40.onAbsolutePositionChanged(v148, l_ChatInputBarConfiguration_4);
            end;
        end)
    };
    local v151 = {
        AutocompleteDropdown = (not not v27() and v40.autocompleteEnabled) and v4.createElement(v24, {
            chatInputBarSettings = l_chatInputBarSettings_0, 
            chatWindowSettings = l_chatWindowSettings_0, 
            setTransparency = v34, 
            transparencyValue = v40.transparencyValue, 
            activated = v40.autocompleteDropdownReducer.activated and v43, 
            results = v40.autocompleteDropdownReducer.results, 
            selectedIndex = v40.autocompleteDropdownReducer.selectedIndex, 
            autocompleteType = v40.autocompleteDropdownReducer.autocompleteType, 
            onAutocompleteDropdownHover = v135, 
            onAutocompleteSelected = v68, 
            autocompleteDropdownRef = v51, 
            textBoxRef = v50
        }) or nil, 
        UISizeConstraint = v4.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(v11.ChatWindowMaxWidth, math.huge)
        }), 
        UIPadding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 8), 
            PaddingRight = UDim.new(0, 8), 
            PaddingTop = not not v40.addTopPadding and UDim.new(0, 8) or UDim.new(0, 0), 
            PaddingBottom = UDim.new(0, 1)
        })
    };
    local l_createElement_1 = v4.createElement;
    local v153 = "Frame";
    local v155 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundColor3 = l_chatInputBarSettings_0.BackgroundColor3, 
        BackgroundTransparency = v40.transparencyValue:map(function(v154)
            return l_BackgroundTransparency_0 + v154 * (1 - l_BackgroundTransparency_0);
        end), 
        Size = UDim2.new(1, 0, 0, 0)
    };
    local v156 = {};
    local l_createElement_2 = v4.createElement;
    local v158 = "UIStroke";
    local v159 = {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
        Color = v11.ChatInputBarBorderColor3
    };
    local l_ChatInputBarBorderTransparency_0 = v11.ChatInputBarBorderTransparency;
    local l_l_ChatInputBarBorderTransparency_0_0 = l_ChatInputBarBorderTransparency_0 --[[ copy: 47 -> 60 ]];
    v159.Transparency = v40.transparencyValue:map(function(v162)
        return l_l_ChatInputBarBorderTransparency_0_0 + v162 * (1 - l_l_ChatInputBarBorderTransparency_0_0);
    end);
    v156.Border = l_createElement_2(v158, v159);
    v156.Corner = v4.createElement("UICorner", {
        CornerRadius = UDim.new(0, 3)
    });
    l_createElement_2 = v4.createElement;
    v158 = "Frame";
    v159 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1
    };
    local v163 = {};
    l_ChatInputBarBorderTransparency_0 = v4.createElement;
    local v164 = "Frame";
    local v165 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, -v40.sendButtonContainerWidth, 0, 0)
    };
    local v166 = {};
    local l_createElement_3 = v4.createElement;
    local l_v18_0 = v18;
    local v169 = {};
    local l_transparencyValue_0 = v40.transparencyValue;
    local v171 = 0;
    local l_v171_0 = v171 --[[ copy: 59 -> 61 ]];
    v169.transparency = l_transparencyValue_0:map(function(v173)
        return l_v171_0 + v173 * (1 - l_v171_0);
    end);
    v169.onAbsoluteSizeChanged = v133;
    v169.onChannelChipActivated = v40.resetTargetChannel;
    v169.targetTextChannelDisplayName = v40.targetTextChannelDisplayName or "";
    v166.TargetChannelChip = l_createElement_3(l_v18_0, v169);
    l_createElement_3 = not v40.canLocalUserChat;
    if l_createElement_3 then
        l_createElement_3 = v4.createElement;
        l_v18_0 = "TextLabel";
        v169 = {
            AnchorPoint = Vector2.new(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Font = v11.ChatInputBarFont, 
            Text = v40.disabledChatPlaceholderText, 
            Position = UDim2.fromScale(1, 0), 
            Size = v47:map(function(v174)
                return UDim2.new(1, -(v174 + 8), 0, 0);
            end), 
            TextColor3 = not not v137 and l_chatInputBarSettings_0.PlaceholderColor3 or l_chatInputBarSettings_0.TextColor3, 
            TextSize = l_chatInputBarSettings_0.TextSize
        };
        l_transparencyValue_0 = not v137 and 0 or 0.5;
        local l_l_transparencyValue_0_0 = l_transparencyValue_0 --[[ copy: 55 -> 62 ]];
        v169.TextTransparency = v40.transparencyValue:map(function(v176)
            return l_l_transparencyValue_0_0 + v176 * (1 - l_l_transparencyValue_0_0);
        end);
        v169.TextWrapped = true;
        v169.TextXAlignment = Enum.TextXAlignment.Left;
        v169.TextYAlignment = Enum.TextYAlignment.Top;
        l_createElement_3 = l_createElement_3(l_v18_0, v169);
    end;
    v166.DisabledPlaceholderLabel = l_createElement_3;
    l_createElement_3 = v40.canLocalUserChat;
    if l_createElement_3 then
        l_createElement_3 = v4.createElement;
        l_v18_0 = "Frame";
        v169 = {
            AnchorPoint = Vector2.new(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(1, 0), 
            Size = v47:map(function(v177)
                return UDim2.new(1, -(v177 + 8), 0, 0);
            end)
        };
        local v178 = {};
        l_transparencyValue_0 = v40.canLocalUserChat;
        if l_transparencyValue_0 then
            l_transparencyValue_0 = v4.createElement;
            local v179 = "TextBox";
            local v180 = {
                AnchorPoint = Vector2.new(0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                ClearTextOnFocus = false, 
                FontFace = l_chatInputBarSettings_0.FontFace, 
                PlaceholderText = not not v137 and v40.placeholderText or "", 
                Size = UDim2.fromScale(1, 0), 
                Text = "", 
                PlaceholderColor3 = l_chatInputBarSettings_0.PlaceholderColor3, 
                TextColor3 = l_chatInputBarSettings_0.TextColor3, 
                TextSize = l_chatInputBarSettings_0.TextSize
            };
            v171 = not v137 and 0 or 0.5;
            local l_v171_1 = v171 --[[ copy: 59 -> 63 ]];
            v180.TextTransparency = v40.transparencyValue:map(function(v182)
                return l_v171_1 + v182 * (1 - l_v171_1);
            end);
            v171 = l_chatInputBarSettings_0.TextStrokeTransparency;
            v180.TextStrokeTransparency = v40.transparencyValue:map(function(v183)
                return v171 + v183 * (1 - v171);
            end);
            v180.TextStrokeColor3 = l_chatInputBarSettings_0.TextStrokeColor3;
            v180.TextWrapped = true;
            v180.TextXAlignment = Enum.TextXAlignment.Left;
            v180.TextYAlignment = Enum.TextYAlignment.Top;
            v180[v4.Event.Focused] = v86;
            v180[v4.Event.FocusLost] = v103;
            v180[v4.Change.Text] = v131;
            v180.ref = v50;
            l_transparencyValue_0 = l_transparencyValue_0(v179, v180);
        end;
        v178.TextBox = l_transparencyValue_0;
        l_createElement_3 = l_createElement_3(l_v18_0, v169, v178);
    end;
    v166.TextBoxContainer = l_createElement_3;
    v166.UIPadding = v4.createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 10), 
        PaddingLeft = UDim.new(0, 10), 
        PaddingRight = UDim.new(0, 10), 
        PaddingTop = UDim.new(0, 10)
    });
    v163.TextContainer = l_ChatInputBarBorderTransparency_0(v164, v165, v166);
    l_ChatInputBarBorderTransparency_0 = v4.createElement;
    v164 = "TextButton";
    v165 = {
        AnchorPoint = Vector2.new(1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = 2, 
        Position = UDim2.fromScale(1, 0), 
        Size = UDim2.new(0, v40.sendButtonContainerWidth, 1, 0), 
        Text = "", 
        [v4.Event.Activated] = v61
    };
    v166 = {
        Layout = v4.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        })
    };
    l_createElement_3 = v4.createElement;
    l_v18_0 = l_ImageSetLabel_0;
    v169 = {
        BackgroundTransparency = 1, 
        ImageColor3 = not not v136 and l_chatInputBarSettings_0.PlaceholderColor3 or l_chatInputBarSettings_0.TextColor3
    };
    l_transparencyValue_0 = not v136 and 0 or 0.5;
    v169.ImageTransparency = v40.transparencyValue:map(function(v184)
        return l_transparencyValue_0 + v184 * (1 - l_transparencyValue_0);
    end);
    v169.Image = l_Images_0["icons/actions/send"];
    v169.Size = UDim2.new(0, 30, 0, 30);
    v166.SendIcon = l_createElement_3(l_v18_0, v169);
    v163.SendButton = l_ChatInputBarBorderTransparency_0(v164, v165, v166);
    v156.Container = l_createElement_2(v158, v159, v163);
    v151.Background = l_createElement_1(v153, v155, v156);
    return l_createElement_0(v144, v150, v151);
end);

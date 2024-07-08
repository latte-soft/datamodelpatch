local l_Util_0 = require(script.Parent:WaitForChild("Util"));
local l_ChatSettings_0 = require(script.Parent.Parent:WaitForChild("ChatSettings"));
local l_Players_0 = game:GetService("Players");
local v3 = nil;
pcall(function()
    v3 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while l_LocalPlayer_0 == nil do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v5 = {};
v5.__index = v5;
local v6 = {};
v5.TrimWhisperCommand = function(_, v8)
    if string.sub(v8, 1, 3):lower() == "/w " then
        return (string.sub(v8, 4));
    elseif string.sub(v8, 1, 9):lower() == "/whisper " then
        return (string.sub(v8, 10));
    else
        return nil;
    end;
end;
v5.TrimWhiteSpace = function(_, v10)
    return string.gsub(v10, "%s+", ""), v10[#v10] == " ";
end;
v5.ShouldAutoCompleteNames = function(_)
    if l_ChatSettings_0.WhisperCommandAutoCompletePlayerNames ~= nil then
        return l_ChatSettings_0.WhisperCommandAutoCompletePlayerNames;
    else
        return true;
    end;
end;
v5.GetWhisperingPlayer = function(v12, v13)
    local v14 = v12:TrimWhisperCommand((v13:lower()));
    if v14 then
        local v15, v16 = v12:TrimWhiteSpace(v14);
        local v17 = {};
        local v18 = {};
        local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
        for v20 = 1, #l_l_Players_0_Players_0 do
            if l_l_Players_0_Players_0[v20] ~= l_LocalPlayer_0 then
                if string.sub(l_l_Players_0_Players_0[v20].Name:lower(), 1, (string.len(v15))) == v15 then
                    v17[l_l_Players_0_Players_0[v20]] = l_l_Players_0_Players_0[v20].Name:lower();
                end;
                if l_ChatSettings_0.WhisperByDisplayName then
                    local v21 = l_l_Players_0_Players_0[v20].DisplayName:lower();
                    if string.sub(v21, 1, (string.len(v15))) == v15 then
                        v18[l_l_Players_0_Players_0[v20]] = v21;
                    end;
                end;
            end;
        end;
        local v22 = 0;
        local v23 = nil;
        local v24 = nil;
        for v25, v26 in pairs(v17) do
            v22 = v22 + 1;
            v23 = v25;
            v24 = v26;
            if not (not (v26 == v15) or not v16) then
                return v25;
            end;
        end;
        if l_ChatSettings_0.WhisperByDisplayName then
            for v27, v28 in pairs(v18) do
                if v23 ~= v27 then
                    v22 = v22 + 1;
                    v23 = v27;
                    v24 = v28;
                end;
            end;
        end;
        if v22 == 1 then
            if not v12:ShouldAutoCompleteNames() then
                if v24 == v15 then
                    return v23;
                end;
            else
                return v23;
            end;
        end;
    end;
    return nil;
end;
v5.GetWhisperChanneNameColor = function(v29)
    if not v29.ChatSettings.WhisperChannelNameColor then
        return Color3.fromRGB(102, 14, 102);
    else
        return v29.ChatSettings.WhisperChannelNameColor;
    end;
end;
v5.EnterWhisperState = function(v30, v31)
    v30.PlayerNameEntered = true;
    v30.PlayerName = v31.Name;
    v30.PlayerDisplayName = v31.DisplayName;
    v30.MessageModeButton.Size = UDim2.new(0, 1000, 1, 0);
    local v32 = nil;
    v32 = if not not l_ChatSettings_0.PlayerDisplayNamesEnabled and l_ChatSettings_0.WhisperByDisplayName then string.format("[To %s]", v31.DisplayName) else string.format("[To %s]", v31.Name);
    if v3.tryLocalize then
        v32 = v3:tryLocalize(v32);
    end;
    v30.MessageModeButton.Text = v32;
    v30.MessageModeButton.TextColor3 = v30:GetWhisperChanneNameColor();
    local v33 = math.ceil(v30.MessageModeButton.TextBounds.X);
    v30.MessageModeButton.Size = UDim2.new(0, v33, 1, 0);
    v30.TextBox.Size = UDim2.new(1, -v33, 1, 0);
    v30.TextBox.Position = UDim2.new(0, v33, 0, 0);
    v30.TextBox.Text = " ";
end;
v5.TextUpdated = function(v34)
    local l_Text_0 = v34.TextBox.Text;
    if v34.PlayerNameEntered then
        if l_Text_0 == "" then
            v34.MessageModeButton.Text = "";
            v34.MessageModeButton.Size = UDim2.new(0, 0, 0, 0);
            v34.TextBox.Size = UDim2.new(1, 0, 1, 0);
            v34.TextBox.Position = UDim2.new(0, 0, 0, 0);
            v34.TextBox.Text = "";
            v34.PlayerNameEntered = false;
            v34.ChatBar:ResetCustomState();
            v34.ChatBar:CaptureFocus();
        end;
    else
        local l_v34_WhisperingPlayer_0 = v34:GetWhisperingPlayer(l_Text_0);
        if l_v34_WhisperingPlayer_0 then
            v34:EnterWhisperState(l_v34_WhisperingPlayer_0);
            return ;
        end;
    end;
end;
v5.GetMessage = function(v37)
    if not v37.PlayerNameEntered then
        return v37.TextBox.Text;
    else
        return "/w " .. v37.PlayerName .. " " .. v37.TextBox.Text;
    end;
end;
v5.ProcessCompletedMessage = function(_)
    return false;
end;
v5.Destroy = function(v39)
    v39.MessageModeConnection:disconnect();
    v39.Destroyed = true;
end;
v6.new = function(v40, v41, v42, v43)
    local v44 = setmetatable({}, v5);
    v44.Destroyed = false;
    v44.ChatWindow = v40;
    v44.ChatBar = v41;
    v44.ChatSettings = v42;
    v44.TextBox = v41:GetTextBox();
    v44.MessageModeButton = v41:GetMessageModeTextButton();
    v44.OriginalWhisperText = "";
    v44.PlayerNameEntered = false;
    v44.MessageModeConnection = v44.MessageModeButton.MouseButton1Click:connect(function()
        local l_Text_1 = v44.TextBox.Text;
        if string.sub(l_Text_1, 1, 1) == " " then
            l_Text_1 = string.sub(l_Text_1, 2);
        end;
        v44.ChatBar:ResetCustomState();
        v44.ChatBar:SetTextBoxText(l_Text_1);
        v44.ChatBar:CaptureFocus();
    end);
    if not v43 then
        v44:TextUpdated();
        return v44;
    else
        v44:EnterWhisperState(v43);
        return v44;
    end;
end;
ProcessMessage = function(v46, v47, v48, v49)
    if not (string.sub(v46, 1, 3):lower() ~= "/w ") or string.sub(v46, 1, 9):lower() == "/whisper " then
        return v6.new(v47, v48, v49);
    else
        return nil;
    end;
end;
CreateCustomState = function(v50, v51, v52, v53)
    return v6.new(v51, v52, v53, v50);
end;
return {
    [l_Util_0.KEY_COMMAND_PROCESSOR_TYPE] = l_Util_0.IN_PROGRESS_MESSAGE_PROCESSOR, 
    [l_Util_0.KEY_PROCESSOR_FUNCTION] = ProcessMessage, 
    CustomStateCreator = CreateCustomState
};

local l_Players_0 = game:GetService("Players");
local v1 = {
    "/team ", 
    "/t ", 
    "% "
};
IsTeamCommand = function(v2)
    for v3 = 1, #v1 do
        local v4 = v1[v3];
        if string.sub(v2, 1, v4:len()):lower() == v4 then
            return true;
        end;
    end;
    return false;
end;
local v5 = {};
v5.__index = v5;
local l_Util_0 = require(script.Parent:WaitForChild("Util"));
local v7 = {};
v5.EnterTeamChat = function(v8)
    v8.TeamChatEntered = true;
    v8.MessageModeButton.Size = UDim2.new(0, 1000, 1, 0);
    v8.MessageModeButton.Text = "[Team]";
    v8.MessageModeButton.TextColor3 = v8:GetTeamChatColor();
    local l_X_0 = v8.MessageModeButton.TextBounds.X;
    v8.MessageModeButton.Size = UDim2.new(0, l_X_0, 1, 0);
    v8.TextBox.Size = UDim2.new(1, -l_X_0, 1, 0);
    v8.TextBox.Position = UDim2.new(0, l_X_0, 0, 0);
    v8.OriginalTeamText = v8.TextBox.Text;
    v8.TextBox.Text = " ";
end;
v5.TextUpdated = function(v10)
    local l_Text_0 = v10.TextBox.Text;
    if v10.TeamChatEntered then
        if l_Text_0 == "" then
            v10.MessageModeButton.Text = "";
            v10.MessageModeButton.Size = UDim2.new(0, 0, 0, 0);
            v10.TextBox.Size = UDim2.new(1, 0, 1, 0);
            v10.TextBox.Position = UDim2.new(0, 0, 0, 0);
            v10.TextBox.Text = "";
            v10.TeamChatEntered = false;
            v10.ChatBar:ResetCustomState();
            v10.ChatBar:CaptureFocus();
        end;
    elseif IsTeamCommand(l_Text_0) then
        v10:EnterTeamChat();
        return ;
    end;
end;
v5.GetMessage = function(v12)
    if not v12.TeamChatEntered then
        return v12.TextBox.Text;
    else
        return "/t " .. v12.TextBox.Text;
    end;
end;
v5.ProcessCompletedMessage = function(_)
    return false;
end;
v5.Destroy = function(v14)
    v14.MessageModeConnection:disconnect();
    v14.Destroyed = true;
end;
v5.GetTeamChatColor = function(v15)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if not l_LocalPlayer_0.Team then
        if not v15.ChatSettings.DefaultChannelNameColor then
            return Color3.fromRGB(35, 76, 142);
        else
            return v15.ChatSettings.DefaultChannelNameColor;
        end;
    else
        return l_LocalPlayer_0.Team.TeamColor.Color;
    end;
end;
v7.new = function(v17, v18, v19)
    local v20 = setmetatable({}, v5);
    v20.Destroyed = false;
    v20.ChatWindow = v17;
    v20.ChatBar = v18;
    v20.ChatSettings = v19;
    v20.TextBox = v18:GetTextBox();
    v20.MessageModeButton = v18:GetMessageModeTextButton();
    v20.OriginalTeamText = "";
    v20.TeamChatEntered = false;
    v20.MessageModeConnection = v20.MessageModeButton.MouseButton1Click:connect(function()
        local l_Text_1 = v20.TextBox.Text;
        if string.sub(l_Text_1, 1, 1) == " " then
            l_Text_1 = string.sub(l_Text_1, 2);
        end;
        v20.ChatBar:ResetCustomState();
        v20.ChatBar:SetTextBoxText(l_Text_1);
        v20.ChatBar:CaptureFocus();
    end);
    v20:EnterTeamChat();
    return v20;
end;
ProcessMessage = function(v22, v23, v24, v25)
    if v24.TargetChannel == "Team" then
        return ;
    elseif not IsTeamCommand(v22) then
        return nil;
    else
        return v7.new(v23, v24, v25);
    end;
end;
return {
    [l_Util_0.KEY_COMMAND_PROCESSOR_TYPE] = l_Util_0.IN_PROGRESS_MESSAGE_PROCESSOR, 
    [l_Util_0.KEY_PROCESSOR_FUNCTION] = ProcessMessage
};

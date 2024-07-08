local v0 = false;
local l_status_0, l_result_0 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserFixOverlappingRtlChatMessages2");
end);
if l_status_0 then
    v0 = l_result_0;
end;
l_status_0 = game:GetService("TextService");
l_result_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_result_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_result_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_result_0.LocalPlayer;
end;
local l_Parent_0 = script.Parent.Parent;
local l_ChatSettings_0 = require(l_Parent_0:WaitForChild("ChatSettings"));
local l_ChatConstants_0 = require(l_Parent_0:WaitForChild("ChatConstants"));
local v7 = {};
local v8 = {};
v8.__index = v8;
v8.GetStringTextBounds = function(_, v10, v11, v12, v13)
    return l_status_0:GetTextSize(v10, v12, v11, v13 or Vector2.new(10000, 10000));
end;
v8.GetMessageHeight = function(v14, v15, v16, v17)
    local l_v14_StringTextBounds_0 = v14:GetStringTextBounds(if not v0 then v15.Text else v15.ContentText, v15.Font, v15.TextSize, Vector2.new(v17 or v16.AbsoluteSize.X, 1000));
    if l_v14_StringTextBounds_0.Y ~= math.floor(l_v14_StringTextBounds_0.Y) then
        return l_v14_StringTextBounds_0.Y + 1;
    else
        return l_v14_StringTextBounds_0.Y;
    end;
end;
v8.GetNumberOfSpaces = function(v19, v20, v21, v22)
    return (math.ceil(v19:GetStringTextBounds(v20, v21, v22).X / v19:GetStringTextBounds(" ", v21, v22).X));
end;
v8.CreateLeadingSpaces = function(_, v24)
    if not v0 then
        return string.rep(" ", v24);
    else
        return "<font dir=\"ltr\">" .. string.rep(" ", v24) .. "</font>";
    end;
end;
v8.SanitizeForRichText = function(_, v26)
    if not v0 then
        return v26;
    else
        return string.gsub(v26, "%p", {
            ["<"] = "&lt;", 
            [">"] = "&gt;", 
            ["&"] = "&amp;"
        });
    end;
end;
v8.CreateBaseMessage = function(v27, v28, v29, v30, v31)
    local l_v27_FromObjectPool_0 = v27:GetFromObjectPool("Frame");
    l_v27_FromObjectPool_0.Selectable = false;
    l_v27_FromObjectPool_0.Size = UDim2.new(1, 0, 0, 18);
    l_v27_FromObjectPool_0.Visible = true;
    l_v27_FromObjectPool_0.BackgroundTransparency = 1;
    local l_v27_FromObjectPool_1 = v27:GetFromObjectPool("TextLabel");
    l_v27_FromObjectPool_1.Selectable = false;
    l_v27_FromObjectPool_1.Size = UDim2.new(1, -14, 1, 0);
    l_v27_FromObjectPool_1.Position = UDim2.new(0, 8, 0, 0);
    l_v27_FromObjectPool_1.BackgroundTransparency = 1;
    l_v27_FromObjectPool_1.Font = v29;
    l_v27_FromObjectPool_1.TextSize = v30;
    l_v27_FromObjectPool_1.TextXAlignment = Enum.TextXAlignment.Left;
    l_v27_FromObjectPool_1.TextYAlignment = Enum.TextYAlignment.Top;
    l_v27_FromObjectPool_1.TextTransparency = 0;
    l_v27_FromObjectPool_1.TextStrokeTransparency = 0.75;
    l_v27_FromObjectPool_1.TextColor3 = v31;
    l_v27_FromObjectPool_1.TextWrapped = true;
    l_v27_FromObjectPool_1.ClipsDescendants = true;
    l_v27_FromObjectPool_1.Text = v28;
    l_v27_FromObjectPool_1.Visible = true;
    l_v27_FromObjectPool_1.RichText = not not v0 or false;
    l_v27_FromObjectPool_1.Parent = l_v27_FromObjectPool_0;
    return l_v27_FromObjectPool_0, l_v27_FromObjectPool_1;
end;
v8.AddNameButtonToBaseMessage = function(v34, v35, v36, v37, v38)
    local l_v34_StringTextBounds_0 = v34:GetStringTextBounds(v37, v35.Font, v35.TextSize);
    local l_v34_FromObjectPool_0 = v34:GetFromObjectPool("TextButton");
    l_v34_FromObjectPool_0.Selectable = false;
    l_v34_FromObjectPool_0.Size = UDim2.new(0, l_v34_StringTextBounds_0.X, 0, l_v34_StringTextBounds_0.Y);
    l_v34_FromObjectPool_0.Position = UDim2.new(0, 0, 0, 0);
    l_v34_FromObjectPool_0.BackgroundTransparency = 1;
    l_v34_FromObjectPool_0.Font = v35.Font;
    l_v34_FromObjectPool_0.TextSize = v35.TextSize;
    l_v34_FromObjectPool_0.TextXAlignment = v35.TextXAlignment;
    l_v34_FromObjectPool_0.TextYAlignment = v35.TextYAlignment;
    l_v34_FromObjectPool_0.TextTransparency = v35.TextTransparency;
    l_v34_FromObjectPool_0.TextStrokeTransparency = v35.TextStrokeTransparency;
    l_v34_FromObjectPool_0.TextColor3 = v36;
    l_v34_FromObjectPool_0.Text = v37;
    l_v34_FromObjectPool_0.Visible = true;
    l_v34_FromObjectPool_0.Parent = v35;
    local v41 = l_v34_FromObjectPool_0.MouseButton1Click:connect(function()
        v34:NameButtonClicked(l_v34_FromObjectPool_0, v38);
    end);
    local v42 = nil;
    v42 = l_v34_FromObjectPool_0.Changed:connect(function(v43)
        if v43 == "Parent" then
            v41:Disconnect();
            v42:Disconnect();
        end;
    end);
    return l_v34_FromObjectPool_0;
end;
v8.AddTranslationButtonToBaseMessage = function(v44, v45)
    local v46 = math.floor(v45.TextSize * 0.9);
    local v47 = Vector2.new(v46, v46);
    local l_v44_FromObjectPool_0 = v44:GetFromObjectPool("ImageButton");
    l_v44_FromObjectPool_0.Selectable = false;
    l_v44_FromObjectPool_0.Size = UDim2.new(0, v47.X, 0, v47.Y);
    l_v44_FromObjectPool_0.Position = UDim2.new(0, 0, 0, 0);
    l_v44_FromObjectPool_0.BackgroundTransparency = 1;
    l_v44_FromObjectPool_0.Visible = false;
    l_v44_FromObjectPool_0.Parent = v45;
    l_v44_FromObjectPool_0.Image = "rbxasset://textures/translateIcon.png";
    l_v44_FromObjectPool_0.HoverImage = "rbxasset://textures/translateIconDark.png";
    l_v44_FromObjectPool_0.PressedImage = "rbxasset://textures/translateIconDark.png";
    return l_v44_FromObjectPool_0;
end;
v8.AddChannelButtonToBaseMessage = function(v49, v50, v51, v52, v53)
    local l_v49_StringTextBounds_0 = v49:GetStringTextBounds(v52, v50.Font, v50.TextSize);
    local l_v49_FromObjectPool_0 = v49:GetFromObjectPool("TextButton");
    l_v49_FromObjectPool_0.Selectable = false;
    l_v49_FromObjectPool_0.Size = UDim2.new(0, l_v49_StringTextBounds_0.X, 0, l_v49_StringTextBounds_0.Y);
    l_v49_FromObjectPool_0.Position = UDim2.new(0, 0, 0, 0);
    l_v49_FromObjectPool_0.BackgroundTransparency = 1;
    l_v49_FromObjectPool_0.Font = v50.Font;
    l_v49_FromObjectPool_0.TextSize = v50.TextSize;
    l_v49_FromObjectPool_0.TextXAlignment = v50.TextXAlignment;
    l_v49_FromObjectPool_0.TextYAlignment = v50.TextYAlignment;
    l_v49_FromObjectPool_0.TextTransparency = v50.TextTransparency;
    l_v49_FromObjectPool_0.TextStrokeTransparency = v50.TextStrokeTransparency;
    l_v49_FromObjectPool_0.TextColor3 = v51;
    l_v49_FromObjectPool_0.Text = v52;
    l_v49_FromObjectPool_0.Visible = true;
    l_v49_FromObjectPool_0.Parent = v50;
    local v56 = l_v49_FromObjectPool_0.MouseButton1Click:connect(function()
        v49:ChannelButtonClicked(l_v49_FromObjectPool_0, v53);
    end);
    local v57 = nil;
    v57 = l_v49_FromObjectPool_0.Changed:connect(function(v58)
        if v58 == "Parent" then
            v56:Disconnect();
            v57:Disconnect();
        end;
    end);
    return l_v49_FromObjectPool_0;
end;
v8.AddTagLabelToBaseMessage = function(v59, v60, v61, v62)
    local l_v59_StringTextBounds_0 = v59:GetStringTextBounds(v62, v60.Font, v60.TextSize);
    local l_v59_FromObjectPool_0 = v59:GetFromObjectPool("TextLabel");
    l_v59_FromObjectPool_0.Selectable = false;
    l_v59_FromObjectPool_0.Size = UDim2.new(0, l_v59_StringTextBounds_0.X, 0, l_v59_StringTextBounds_0.Y);
    l_v59_FromObjectPool_0.Position = UDim2.new(0, 0, 0, 0);
    l_v59_FromObjectPool_0.BackgroundTransparency = 1;
    l_v59_FromObjectPool_0.Font = v60.Font;
    l_v59_FromObjectPool_0.TextSize = v60.TextSize;
    l_v59_FromObjectPool_0.TextXAlignment = v60.TextXAlignment;
    l_v59_FromObjectPool_0.TextYAlignment = v60.TextYAlignment;
    l_v59_FromObjectPool_0.TextTransparency = v60.TextTransparency;
    l_v59_FromObjectPool_0.TextStrokeTransparency = v60.TextStrokeTransparency;
    l_v59_FromObjectPool_0.TextColor3 = v61;
    l_v59_FromObjectPool_0.Text = v62;
    l_v59_FromObjectPool_0.Visible = true;
    l_v59_FromObjectPool_0.Parent = v60;
    return l_v59_FromObjectPool_0;
end;
GetWhisperChannelPrefix = function()
    if not l_ChatConstants_0.WhisperChannelPrefix then
        return "To ";
    else
        return l_ChatConstants_0.WhisperChannelPrefix;
    end;
end;
v8.NameButtonClicked = function(v65, _, v67)
    if v65.ChatWindow then
        if l_ChatSettings_0.ClickOnPlayerNameToWhisper then
            local l_l_result_0_FirstChild_0 = l_result_0:FindFirstChild(v67);
            if l_l_result_0_FirstChild_0 and l_l_result_0_FirstChild_0 ~= l_LocalPlayer_0 then
                local v69 = GetWhisperChannelPrefix() .. v67;
                if not v65.ChatWindow:GetChannel(v69) then
                    if not v65.ChatBar:IsInCustomState() then
                        v65.ChatBar:SetText("/w " .. v67);
                        v65.ChatBar:CaptureFocus();
                    end;
                else
                    v65.ChatBar:ResetCustomState();
                    if v65.ChatWindow:GetTargetMessageChannel() ~= v69 then
                        v65.ChatWindow:SwitchCurrentChannel(v69);
                    end;
                    v65.ChatBar:SetText("/w " .. v67);
                    v65.ChatBar:CaptureFocus();
                    return ;
                end;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v8.ChannelButtonClicked = function(v70, _, v72)
    if v70.ChatWindow then
        if not (not l_ChatSettings_0.ClickOnChannelNameToSetMainChannel or not v70.ChatWindow:GetChannel(v72)) then
            v70.ChatBar:ResetCustomState();
            if v70.ChatWindow:GetTargetMessageChannel() ~= v72 then
                v70.ChatWindow:SwitchCurrentChannel(v72);
            end;
            v70.ChatBar:ResetText();
            v70.ChatBar:CaptureFocus();
        end;
        return ;
    else
        return ;
    end;
end;
v8.RegisterChatWindow = function(v73, v74)
    v73.ChatWindow = v74;
    v73.ChatBar = v74:GetChatBar();
end;
v8.GetFromObjectPool = function(v75, v76)
    if v75.ObjectPool == nil then
        return Instance.new(v76);
    else
        return v75.ObjectPool:GetInstance(v76);
    end;
end;
v8.RegisterObjectPool = function(v77, v78)
    v77.ObjectPool = v78;
end;
v8.CreateFadeFunctions = function(_, v80)
    local v81 = {};
    for v82, v83 in pairs(v80) do
        v81[v82] = {};
        for v84, v85 in pairs(v83) do
            v81[v82][v84] = {
                Target = v85.FadedIn, 
                Current = v82[v84], 
                NormalizedExptValue = 1
            };
        end;
    end;
    local function v92(v86, v87)
        for v88, v89 in pairs(v81) do
            for v90, v91 in pairs(v89) do
                v91.Target = v80[v88][v90].FadedIn;
                v91.NormalizedExptValue = v87:NormalizedDefaultExptValueInSeconds(v86);
            end;
        end;
    end;
    local function v99(v93, v94)
        for v95, v96 in pairs(v81) do
            for v97, v98 in pairs(v96) do
                v98.Target = v80[v95][v97].FadedOut;
                v98.NormalizedExptValue = v94:NormalizedDefaultExptValueInSeconds(v93);
            end;
        end;
    end;
    local function v104()
        for v100, v101 in pairs(v81) do
            for v102, v103 in pairs(v101) do
                v100[v102] = v103.Current;
            end;
        end;
    end;
    return v92, v99, function(v105, v106)
        for _, v108 in pairs(v81) do
            for _, v110 in pairs(v108) do
                v110.Current = v106:Expt(v110.Current, v110.Target, v110.NormalizedExptValue, v105);
            end;
        end;
        v104();
    end;
end;
v8.NewBindableEvent = function(_, v112)
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    l_BindableEvent_0.Name = v112;
    return l_BindableEvent_0;
end;
v8.RegisterGuiRoot = function(_)
end;
v7.new = function()
    local v115 = setmetatable({}, v8);
    v115.ObjectPool = nil;
    v115.ChatWindow = nil;
    v115.DEFAULT_MESSAGE_CREATOR = "UnknownMessage";
    v115.MESSAGE_CREATOR_MODULES_VERSION = 1;
    v115.KEY_MESSAGE_TYPE = "MessageType";
    v115.KEY_CREATOR_FUNCTION = "MessageCreatorFunc";
    v115.KEY_BASE_FRAME = "BaseFrame";
    v115.KEY_BASE_MESSAGE = "BaseMessage";
    v115.KEY_UPDATE_TEXT_FUNC = "UpdateTextFunction";
    v115.KEY_GET_HEIGHT = "GetHeightFunction";
    v115.KEY_FADE_IN = "FadeInFunction";
    v115.KEY_FADE_OUT = "FadeOutFunction";
    v115.KEY_UPDATE_ANIMATION = "UpdateAnimFunction";
    return v115;
end;
return v7.new();

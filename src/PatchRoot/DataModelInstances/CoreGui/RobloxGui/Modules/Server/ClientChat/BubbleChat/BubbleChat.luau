local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Chat_0 = game:GetService("Chat");
local l_TextService_0 = game:GetService("TextService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while l_LocalPlayer_0 == nil do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local l_status_0, l_result_0 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserShouldLocalizeGameChatBubble");
end);
local v8 = l_status_0 and l_result_0;
local v9 = nil;
local l_status_1, l_result_1 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserFixBubbleChatText");
end);
v9 = l_status_1 and l_result_1;
l_status_1 = nil;
local v12;
l_result_1, v12 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserRoactBubbleChatBeta");
end);
l_status_1 = l_result_1 and v12;
l_result_1 = nil;
local v13;
v12, v13 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserPreventOldBubbleChatOverlap");
end);
l_result_1 = v12 and v13;
v12 = function(v14)
    return utf8.len(utf8.nfcnormalize(v14));
end;
v13 = Enum.Font.SourceSans;
local l_Size24_0 = Enum.FontSize.Size24;
local v16 = (128 - utf8.len(utf8.nfcnormalize("..."))) - 1;
local v17 = {
    WHITE = "dub", 
    BLUE = "blu", 
    GREEN = "gre", 
    RED = "red"
};
local l_ScreenGui_0 = Instance.new("ScreenGui");
l_ScreenGui_0.Name = "BubbleChat";
l_ScreenGui_0.ResetOnSpawn = false;
l_ScreenGui_0.Parent = l_PlayerGui_0;
local function _(v19, v20, v21)
    return v20 + (v21 - v20) * math.min(utf8.len(utf8.nfcnormalize(v19)) / 75, 1);
end;
local function v34()
    local v23 = {
        data = {}
    };
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    v23.Emptied = l_BindableEvent_0.Event;
    v23.Size = function(_)
        return #v23.data;
    end;
    v23.Empty = function(_)
        return v23:Size() <= 0;
    end;
    v23.PopFront = function(_)
        table.remove(v23.data, 1);
        if v23:Empty() then
            l_BindableEvent_0:Fire();
        end;
    end;
    v23.Front = function(_)
        return v23.data[1];
    end;
    v23.Get = function(_, v30)
        return v23.data[v30];
    end;
    v23.PushBack = function(_, v32)
        table.insert(v23.data, v32);
    end;
    v23.GetData = function(_)
        return v23.data;
    end;
    return v23;
end;
local function _()
    return {
        Fifo = v34(), 
        BillboardGui = nil
    };
end;
local function v49()
    local v36 = {
        data = {}
    };
    local v37 = 0;
    v36.Size = function(_)
        return v37;
    end;
    v36.Erase = function(_, v40)
        if v36.data[v40] then
            v37 = v37 - 1;
        end;
        v36.data[v40] = nil;
    end;
    v36.Set = function(_, v42, v43)
        v36.data[v42] = v43;
        if v43 then
            v37 = v37 + 1;
        end;
    end;
    v36.Get = function(_, v45)
        if v45 then
            if not v36.data[v45] then
                v36.data[v45] = {
                    Fifo = v34(), 
                    BillboardGui = nil
                };
                local v46 = nil;
                do
                    local l_v46_0 = v46;
                    l_v46_0 = v36.data[v45].Fifo.Emptied:connect(function()
                        l_v46_0:disconnect();
                        v36:Erase(v45);
                    end);
                end;
            end;
            return v36.data[v45];
        else
            return ;
        end;
    end;
    v36.GetData = function(_)
        return v36.data;
    end;
    return v36;
end;
local function v57(v50, v51, v52)
    local v56 = {
        ComputeBubbleLifetime = function(_, v54, v55)
            if not v55 then
                return 12 + 8 * math.min(utf8.len(utf8.nfcnormalize(v54)) / 75, 1);
            else
                return 8 + 7 * math.min(utf8.len(utf8.nfcnormalize(v54)) / 75, 1);
            end;
        end, 
        Origin = nil, 
        RenderBubble = nil, 
        Message = v50
    };
    v56.BubbleDieDelay = v56:ComputeBubbleLifetime(v50, v52);
    v56.BubbleColor = v51;
    v56.IsLocalPlayer = v52;
    return v56;
end;
local function _(v58, v59, v60)
    local v61 = v57(v59, v17.WHITE, v60);
    if v58 then
        v61.User = v58.Name;
        v61.Origin = v58.Character;
    end;
    return v61;
end;
local function _(v63, v64, v65, v66)
    local v67 = v57(v64, v66, v65);
    v67.Origin = v63;
    return v67;
end;
createChatBubbleMain = function(v69, v70)
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = "ChatBubble";
    l_ImageLabel_0.ScaleType = Enum.ScaleType.Slice;
    l_ImageLabel_0.SliceCenter = v70;
    l_ImageLabel_0.Image = "rbxasset://textures/" .. tostring(v69) .. ".png";
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.BorderSizePixel = 0;
    l_ImageLabel_0.Size = UDim2.new(1, 0, 1, 0);
    l_ImageLabel_0.Position = UDim2.new(0, 0, 0, 0);
    return l_ImageLabel_0;
end;
createChatBubbleTail = function(v72, v73)
    local l_ImageLabel_1 = Instance.new("ImageLabel");
    l_ImageLabel_1.Name = "ChatBubbleTail";
    l_ImageLabel_1.Image = "rbxasset://textures/ui/dialog_tail.png";
    l_ImageLabel_1.BackgroundTransparency = 1;
    l_ImageLabel_1.BorderSizePixel = 0;
    l_ImageLabel_1.Position = v72;
    l_ImageLabel_1.Size = v73;
    return l_ImageLabel_1;
end;
createChatBubbleWithTail = function(v75, v76, v77, v78)
    local v79 = createChatBubbleMain(v75, v78);
    createChatBubbleTail(v76, v77).Parent = v79;
    return v79;
end;
createScaledChatBubbleWithTail = function(v80, v81, v82, v83)
    local v84 = createChatBubbleMain(v80, v83);
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "ChatBubbleTailFrame";
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.SizeConstraint = Enum.SizeConstraint.RelativeXX;
    l_Frame_0.Position = UDim2.new(0.5, 0, 1, 0);
    l_Frame_0.Size = UDim2.new(v81, 0, v81, 0);
    l_Frame_0.Parent = v84;
    createChatBubbleTail(v82, UDim2.new(1, 0, 0.5, 0)).Parent = l_Frame_0;
    return v84;
end;
createChatImposter = function(v86, v87, v88)
    local l_ImageLabel_2 = Instance.new("ImageLabel");
    l_ImageLabel_2.Name = "DialogPlaceholder";
    l_ImageLabel_2.Image = "rbxasset://textures/" .. tostring(v86) .. ".png";
    l_ImageLabel_2.BackgroundTransparency = 1;
    l_ImageLabel_2.BorderSizePixel = 0;
    l_ImageLabel_2.Position = UDim2.new(0, 0, -1.25, 0);
    l_ImageLabel_2.Size = UDim2.new(1, 0, 1, 0);
    local l_ImageLabel_3 = Instance.new("ImageLabel");
    l_ImageLabel_3.Name = "DotDotDot";
    l_ImageLabel_3.Image = "rbxasset://textures/" .. tostring(v87) .. ".png";
    l_ImageLabel_3.BackgroundTransparency = 1;
    l_ImageLabel_3.BorderSizePixel = 0;
    l_ImageLabel_3.Position = UDim2.new(0.001, 0, v88, 0);
    l_ImageLabel_3.Size = UDim2.new(1, 0, 0.7, 0);
    l_ImageLabel_3.Parent = l_ImageLabel_2;
    return l_ImageLabel_2;
end;
local v91 = {
    ChatBubble = {}, 
    ChatBubbleWithTail = {}, 
    ScalingChatBubbleWithTail = {}, 
    CharacterSortedMsg = v49()
};
local function v97(v92, v93, _, v95, v96)
    v91.ChatBubble[v92] = createChatBubbleMain(v93, v96);
    v91.ChatBubbleWithTail[v92] = createChatBubbleWithTail(v93, UDim2.new(0.5, -14, 1, not v95 and 0 or -1), UDim2.new(0, 30, 0, 14), v96);
    v91.ScalingChatBubbleWithTail[v92] = createScaledChatBubbleWithTail(v93, 0.5, UDim2.new(-0.5, 0, 0, not v95 and 0 or -1), v96);
end;
v97(v17.WHITE, "ui/dialog_white", "ui/chatBubble_white_notify_bkg", false, Rect.new(5, 5, 15, 15));
v97(v17.BLUE, "ui/dialog_blue", "ui/chatBubble_blue_notify_bkg", true, Rect.new(7, 7, 33, 33));
v97(v17.RED, "ui/dialog_red", "ui/chatBubble_red_notify_bkg", true, Rect.new(7, 7, 33, 33));
v97(v17.GREEN, "ui/dialog_green", "ui/chatBubble_green_notify_bkg", true, Rect.new(7, 7, 33, 33));
v91.SanitizeChatLine = function(_, v99)
    if v16 < utf8.len(utf8.nfcnormalize(v99)) then
        return (string.sub(v99, 1, utf8.offset(v99, (v16 + utf8.len(utf8.nfcnormalize("..."))) + 1) - 1));
    else
        return v99;
    end;
end;
local function v104(v100)
    local l_BillboardGui_0 = Instance.new("BillboardGui");
    l_BillboardGui_0.Adornee = v100;
    l_BillboardGui_0.Size = UDim2.new(0, 400, 0, 250);
    l_BillboardGui_0.StudsOffset = Vector3.new(0, 1.5, 2);
    l_BillboardGui_0.Parent = l_ScreenGui_0;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = "BillboardFrame";
    l_Frame_1.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_1.Position = UDim2.new(0, 0, -0.5, 0);
    l_Frame_1.BackgroundTransparency = 1;
    l_Frame_1.Parent = l_BillboardGui_0;
    local v103 = nil;
    v103 = l_Frame_1.ChildRemoved:connect(function()
        if #l_Frame_1:GetChildren() <= 1 then
            v103:disconnect();
            l_BillboardGui_0:Destroy();
        end;
    end);
    v91:CreateSmallTalkBubble(v17.WHITE).Parent = l_Frame_1;
    return l_BillboardGui_0;
end;
v91.CreateBillboardGuiHelper = function(_, v106, v107)
    if not (not v106 or v91.CharacterSortedMsg:Get(v106).BillboardGui) then
        if v107 or not v106:IsA("BasePart") then
            if v106:IsA("Model") then
                local l_Head_0 = v106:FindFirstChild("Head");
                if not (not l_Head_0 or not l_Head_0:IsA("BasePart")) then
                    v91.CharacterSortedMsg:Get(v106).BillboardGui = v104(l_Head_0);
                end;
            end;
        else
            v91.CharacterSortedMsg:Get(v106).BillboardGui = v104(v106);
            return ;
        end;
    end;
end;
local function _(v109)
    if v109 then
        return (v109.Position - game.Workspace.CurrentCamera.CoordinateFrame.Position).magnitude;
    else
        return 100000;
    end;
end;
local function _(v111)
    if not v111 or not l_Players_0.LocalPlayer.Character then
        return ;
    else
        return v111:IsDescendantOf(l_Players_0.LocalPlayer.Character);
    end;
end;
v91.SetBillboardLODNear = function(_, v114)
    local l_Adornee_0 = v114.Adornee;
    local v116 = if not not l_Adornee_0 and l_Players_0.LocalPlayer.Character then l_Adornee_0:IsDescendantOf(l_Players_0.LocalPlayer.Character) else nil;
    v114.Size = UDim2.new(0, 400, 0, 250);
    v114.StudsOffset = Vector3.new(0, not v116 and 2.5 or 1.5, not v116 and 0.1 or 2);
    v114.Enabled = true;
    l_Adornee_0 = v114.BillboardFrame:GetChildren();
    for v117 = 1, #l_Adornee_0 do
        l_Adornee_0[v117].Visible = true;
    end;
    v114.BillboardFrame.SmallTalkBubble.Visible = false;
end;
v91.SetBillboardLODDistant = function(_, v119)
    local l_Adornee_1 = v119.Adornee;
    local v121 = if not not l_Adornee_1 and l_Players_0.LocalPlayer.Character then l_Adornee_1:IsDescendantOf(l_Players_0.LocalPlayer.Character) else nil;
    v119.Size = UDim2.new(4, 0, 3, 0);
    v119.StudsOffset = Vector3.new(0, 3, not v121 and 0.1 or 2);
    v119.Enabled = true;
    l_Adornee_1 = v119.BillboardFrame:GetChildren();
    for v122 = 1, #l_Adornee_1 do
        l_Adornee_1[v122].Visible = false;
    end;
    v119.BillboardFrame.SmallTalkBubble.Visible = true;
end;
v91.SetBillboardLODVeryFar = function(_, v124)
    v124.Enabled = false;
end;
v91.SetBillboardGuiLOD = function(_, v126, v127)
    if v127 then
        if v127:IsA("Model") then
            v127 = v127:FindFirstChild("Head") or v127.PrimaryPart;
        end;
        local l_v127_0 = v127;
        local v129 = if l_v127_0 then (l_v127_0.Position - game.Workspace.CurrentCamera.CoordinateFrame.Position).magnitude else 100000;
        if v129 < 65 then
            v91:SetBillboardLODNear(v126);
            return ;
        elseif v129 >= 65 and v129 < 100 then
            v91:SetBillboardLODDistant(v126);
            return ;
        else
            v91:SetBillboardLODVeryFar(v126);
            return ;
        end;
    else
        return ;
    end;
end;
v91.CameraCFrameChanged = function(_)
    for v131, v132 in pairs(v91.CharacterSortedMsg:GetData()) do
        local l_BillboardGui_1 = v132.BillboardGui;
        if l_BillboardGui_1 then
            v91:SetBillboardGuiLOD(l_BillboardGui_1, v131);
        end;
    end;
end;
v91.CreateBubbleText = function(_, v135, v136)
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "BubbleText";
    l_TextLabel_0.BackgroundTransparency = 1;
    if not v9 then
        l_TextLabel_0.Position = UDim2.new(0, 15, 0, 0);
        l_TextLabel_0.Size = UDim2.new(1, -30, 1, 0);
    else
        l_TextLabel_0.Size = UDim2.fromScale(1, 1);
    end;
    l_TextLabel_0.Font = v13;
    l_TextLabel_0.ClipsDescendants = true;
    l_TextLabel_0.TextWrapped = true;
    l_TextLabel_0.FontSize = l_Size24_0;
    l_TextLabel_0.Text = v135;
    l_TextLabel_0.Visible = false;
    l_TextLabel_0.AutoLocalize = v136;
    if v9 then
        local l_UIPadding_0 = Instance.new("UIPadding");
        l_UIPadding_0.PaddingTop = UDim.new(0, 12);
        l_UIPadding_0.PaddingRight = UDim.new(0, 12);
        l_UIPadding_0.PaddingBottom = UDim.new(0, 12);
        l_UIPadding_0.PaddingLeft = UDim.new(0, 12);
        l_UIPadding_0.Parent = l_TextLabel_0;
    end;
    return l_TextLabel_0;
end;
v91.CreateSmallTalkBubble = function(_, v140)
    local v141 = v91.ScalingChatBubbleWithTail[v140]:Clone();
    v141.Name = "SmallTalkBubble";
    v141.AnchorPoint = Vector2.new(0, 0.5);
    v141.Position = UDim2.new(0, 0, 0.5, 0);
    v141.Visible = false;
    local l_v91_BubbleText_0 = v91:CreateBubbleText("...");
    l_v91_BubbleText_0.TextScaled = true;
    l_v91_BubbleText_0.TextWrapped = false;
    l_v91_BubbleText_0.Visible = true;
    l_v91_BubbleText_0.Parent = v141;
    return v141;
end;
v91.UpdateChatLinesForOrigin = function(_, v144, v145)
    local l_Fifo_0 = v91.CharacterSortedMsg:Get(v144).Fifo;
    local v147 = l_Fifo_0:Size();
    local l_l_Fifo_0_Data_0 = l_Fifo_0:GetData();
    if #l_l_Fifo_0_Data_0 <= 1 then
        return ;
    else
        for v149 = #l_l_Fifo_0_Data_0 - 1, 1, -1 do
            local l_RenderBubble_0 = l_l_Fifo_0_Data_0[v149].RenderBubble;
            if l_RenderBubble_0 then
                if (v147 - v149) + 1 > 1 then
                    local l_ChatBubbleTail_0 = l_RenderBubble_0:FindFirstChild("ChatBubbleTail");
                    if l_ChatBubbleTail_0 then
                        l_ChatBubbleTail_0:Destroy();
                    end;
                    local l_BubbleText_0 = l_RenderBubble_0:FindFirstChild("BubbleText");
                    if l_BubbleText_0 then
                        l_BubbleText_0.TextTransparency = 0.5;
                    end;
                end;
                l_RenderBubble_0:TweenPosition(UDim2.new(l_RenderBubble_0.Position.X.Scale, l_RenderBubble_0.Position.X.Offset, 1, (v145 - l_RenderBubble_0.Size.Y.Offset) - 14), Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 0.1, true);
                v145 = (v145 - l_RenderBubble_0.Size.Y.Offset) - 14;
            else
                return ;
            end;
        end;
        return ;
    end;
end;
v91.DestroyBubble = function(_, v154, v155)
    if v154 then
        if not v154:Empty() then
            local l_RenderBubble_1 = v154:Front().RenderBubble;
            if l_RenderBubble_1 then
                spawn(function()
                    while v154:Front().RenderBubble ~= v155 do
                        wait();
                    end;
                    l_RenderBubble_1 = v154:Front().RenderBubble;
                    local v157 = 0;
                    local l_BubbleText_1 = l_RenderBubble_1:FindFirstChild("BubbleText");
                    local l_ChatBubbleTail_1 = l_RenderBubble_1:FindFirstChild("ChatBubbleTail");
                    while l_RenderBubble_1 and l_RenderBubble_1.ImageTransparency < 1 do
                        v157 = wait();
                        if l_RenderBubble_1 then
                            local v160 = v157 * 1.5;
                            l_RenderBubble_1.ImageTransparency = l_RenderBubble_1.ImageTransparency + v160;
                            if l_BubbleText_1 then
                                l_BubbleText_1.TextTransparency = l_BubbleText_1.TextTransparency + v160;
                            end;
                            if l_ChatBubbleTail_1 then
                                l_ChatBubbleTail_1.ImageTransparency = l_ChatBubbleTail_1.ImageTransparency + v160;
                            end;
                        end;
                    end;
                    if l_RenderBubble_1 then
                        l_RenderBubble_1:Destroy();
                        v154:PopFront();
                    end;
                end);
                return ;
            else
                v154:PopFront();
                return ;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v91.CreateChatLineRender = function(_, v162, v163, v164, v165, v166)
    if v162 then
        if not v91.CharacterSortedMsg:Get(v162).BillboardGui then
            v91:CreateBillboardGuiHelper(v162, v164);
        end;
        local l_BillboardGui_2 = v91.CharacterSortedMsg:Get(v162).BillboardGui;
        if l_BillboardGui_2 then
            local v168 = v91.ChatBubbleWithTail[v163.BubbleColor]:Clone();
            v168.Visible = false;
            local l_v91_BubbleText_1 = v91:CreateBubbleText(v163.Message, v166);
            l_v91_BubbleText_1.Parent = v168;
            v168.Parent = l_BillboardGui_2.BillboardFrame;
            v163.RenderBubble = v168;
            local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(l_v91_BubbleText_1.Text, 24, v13, Vector2.new(400, 250));
            local v171 = l_l_TextService_0_TextSize_0.Y / 24;
            if not v9 then
                local v172 = math.max((l_l_TextService_0_TextSize_0.X + 30) / 400, 0.1);
                v168.Size = UDim2.new(0, 0, 0, 0);
                v168.Position = UDim2.new(0.5, 0, 1, 0);
                local v173 = v171 * 34;
                v168:TweenSizeAndPosition(UDim2.new(v172, 0, 0, v173), UDim2.new((1 - v172) / 2, 0, 1, -v173), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 0.1, true, function()
                    l_v91_BubbleText_1.Visible = true;
                end);
                v91:SetBillboardGuiLOD(l_BillboardGui_2, v163.Origin);
                v91:UpdateChatLinesForOrigin(v163.Origin, -v173);
            else
                local v174 = math.ceil(l_l_TextService_0_TextSize_0.X + 24);
                local v175 = v171 * 34;
                v168.Size = UDim2.fromOffset(0, 0);
                v168.Position = UDim2.fromScale(0.5, 1);
                v168:TweenSizeAndPosition(UDim2.fromOffset(v174, v175), UDim2.new(0.5, -v174 / 2, 1, -v175), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 0.1, true, function()
                    l_v91_BubbleText_1.Visible = true;
                end);
                v91:SetBillboardGuiLOD(l_BillboardGui_2, v163.Origin);
                v91:UpdateChatLinesForOrigin(v163.Origin, -v175);
            end;
            delay(v163.BubbleDieDelay, function()
                v91:DestroyBubble(v165, v168);
            end);
        end;
        return ;
    else
        return ;
    end;
end;
v91.OnPlayerChatMessage = function(_, v177, v178, _)
    if v91:BubbleChatEnabled() then
        local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
        local v181 = false;
        if l_LocalPlayer_1 ~= nil then
            v181 = v177 ~= l_LocalPlayer_1;
        end;
        local v182 = v57(v91:SanitizeChatLine(v178), v17.WHITE, not v181);
        if v177 then
            v182.User = v177.Name;
            v182.Origin = v177.Character;
        end;
        local l_v182_0 = v182;
        if not (not v177 or not l_v182_0.Origin) then
            local l_Fifo_1 = v91.CharacterSortedMsg:Get(l_v182_0.Origin).Fifo;
            l_Fifo_1:PushBack(l_v182_0);
            v91:CreateChatLineRender(v177.Character, l_v182_0, true, l_Fifo_1, false);
        end;
        return ;
    else
        return ;
    end;
end;
v91.OnGameChatMessage = function(_, v186, v187, v188)
    if not l_status_1 and (not l_result_1 or not l_Chat_0.BubbleChatEnabled) then
        local l_LocalPlayer_2 = l_Players_0.LocalPlayer;
        local v190 = false;
        if l_LocalPlayer_2 ~= nil then
            v190 = l_LocalPlayer_2.Character ~= v186;
        end;
        local l_WHITE_0 = v17.WHITE;
        if v188 == Enum.ChatColor.Blue then
            l_WHITE_0 = v17.BLUE;
        elseif v188 == Enum.ChatColor.Green then
            l_WHITE_0 = v17.GREEN;
        elseif v188 == Enum.ChatColor.Red then
            l_WHITE_0 = v17.RED;
        end;
        local v192 = v57(v91:SanitizeChatLine(v187), l_WHITE_0, not v190);
        v192.Origin = v186;
        local l_v192_0 = v192;
        v91.CharacterSortedMsg:Get(l_v192_0.Origin).Fifo:PushBack(l_v192_0);
        if not v8 then
            v91:CreateChatLineRender(v186, l_v192_0, false, v91.CharacterSortedMsg:Get(l_v192_0.Origin).Fifo, false);
            return ;
        else
            v91:CreateChatLineRender(v186, l_v192_0, false, v91.CharacterSortedMsg:Get(l_v192_0.Origin).Fifo, true);
            return ;
        end;
    else
        return ;
    end;
end;
v91.BubbleChatEnabled = function(_)
    if not l_status_1 and (not l_result_1 or not l_Chat_0.BubbleChatEnabled) then
        local l_ClientChatModules_0 = l_Chat_0:FindFirstChild("ClientChatModules");
        if l_ClientChatModules_0 then
            local l_ChatSettings_0 = l_ClientChatModules_0:FindFirstChild("ChatSettings");
            if l_ChatSettings_0 then
                l_ChatSettings_0 = require(l_ChatSettings_0);
                if l_ChatSettings_0.BubbleChatEnabled ~= nil then
                    return l_ChatSettings_0.BubbleChatEnabled;
                end;
            end;
        end;
        return l_Players_0.BubbleChat;
    else
        return false;
    end;
end;
v91.ShowOwnFilteredMessage = function(_)
    local l_ClientChatModules_1 = l_Chat_0:FindFirstChild("ClientChatModules");
    if l_ClientChatModules_1 then
        local l_ChatSettings_1 = l_ClientChatModules_1:FindFirstChild("ChatSettings");
        if l_ChatSettings_1 then
            return require(l_ChatSettings_1).ShowUserOwnFilteredMessage;
        end;
    end;
    return false;
end;
findPlayer = function(v200)
    for _, v202 in pairs(l_Players_0:GetPlayers()) do
        if v202.Name == v200 then
            return v202;
        end;
    end;
end;
l_Chat_0.Chatted:connect(function(v203, v204, v205)
    v91:OnGameChatMessage(v203, v204, v205);
end);
local v206 = nil;
if game.Workspace.CurrentCamera then
    v206 = game.Workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function(_)
        v91:CameraCFrameChanged();
    end);
end;
game.Workspace.Changed:Connect(function(v208)
    if v208 == "CurrentCamera" then
        if v206 then
            v206:disconnect();
        end;
        if game.Workspace.CurrentCamera then
            v206 = game.Workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function(_)
                v91:CameraCFrameChanged();
            end);
        end;
    end;
end);
local v210 = nil;
getAllowedMessageTypes = function()
    if not v210 then
        local l_ClientChatModules_2 = l_Chat_0:FindFirstChild("ClientChatModules");
        if not l_ClientChatModules_2 then
            return {
                "Message", 
                "Whisper"
            };
        else
            local l_ChatSettings_2 = l_ClientChatModules_2:FindFirstChild("ChatSettings");
            if l_ChatSettings_2 then
                l_ChatSettings_2 = require(l_ChatSettings_2);
                if l_ChatSettings_2.BubbleChatMessageTypes then
                    v210 = l_ChatSettings_2.BubbleChatMessageTypes;
                    return v210;
                end;
            end;
            local l_ChatConstants_0 = l_ClientChatModules_2:FindFirstChild("ChatConstants");
            if l_ChatConstants_0 then
                l_ChatConstants_0 = require(l_ChatConstants_0);
                v210 = {
                    l_ChatConstants_0.MessageTypeDefault, 
                    l_ChatConstants_0.MessageTypeWhisper
                };
            end;
            return v210;
        end;
    else
        return v210;
    end;
end;
checkAllowedMessageType = function(v214)
    local v215 = getAllowedMessageTypes();
    for v216 = 1, #v215 do
        if v215[v216] == v214.MessageType then
            return true;
        end;
    end;
    return false;
end;
local l_DefaultChatSystemChatEvents_0 = l_ReplicatedStorage_0:WaitForChild("DefaultChatSystemChatEvents");
local l_OnMessageDoneFiltering_0 = l_DefaultChatSystemChatEvents_0:WaitForChild("OnMessageDoneFiltering");
l_DefaultChatSystemChatEvents_0:WaitForChild("OnNewMessage").OnClientEvent:connect(function(v219, _)
    if checkAllowedMessageType(v219) then
        local v221 = findPlayer(v219.FromSpeaker);
        if v221 then
            if not (not v219.IsFiltered or v219.FromSpeaker == l_LocalPlayer_0.Name) or v219.FromSpeaker == l_LocalPlayer_0.Name and not v91:ShowOwnFilteredMessage() then
                v91:OnPlayerChatMessage(v221, v219.Message, nil);
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end);
l_OnMessageDoneFiltering_0.OnClientEvent:connect(function(v222, _)
    if checkAllowedMessageType(v222) then
        local v224 = findPlayer(v222.FromSpeaker);
        if v224 then
            if not (v222.FromSpeaker == l_LocalPlayer_0.Name) or v91:ShowOwnFilteredMessage() then
                v91:OnPlayerChatMessage(v224, v222.Message, nil);
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end);

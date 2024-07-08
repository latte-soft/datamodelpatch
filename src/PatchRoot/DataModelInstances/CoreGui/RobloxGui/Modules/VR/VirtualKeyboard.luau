local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("UserInputService");
local _ = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local _ = game:GetService("Players");
local l_SoundService_0 = game:GetService("SoundService");
local l_TextService_0 = game:GetService("TextService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v10 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v11 = Color3.new(0.19215686274509805, 0.19215686274509805, 0.19215686274509805);
local v12 = Color3.new(0.19215686274509805, 0.19215686274509805, 0.19215686274509805);
local v13 = Color3.new(0, 0.6352941176470588, 1);
local v14 = Color3.new(0, 0.6352941176470588, 1);
local v15 = Color3.new(1, 1, 1);
local v16 = l_HttpService_0:JSONDecode("[\n  [\n    {\n      \"a\": 7,\n      \"w\": 0.8\n    },\n    \"*\",\n    \"Q\",\n    \"W\",\n    \"E\",\n    \"R\",\n    \"T\",\n    \"Y\",\n    \"U\",\n    \"I\",\n    \"O\",\n    \"P\",\n    {\n      \"w\": 1.8\n    },\n    \"Delete\"\n  ],\n  [\n    {\n      \"w\": 1.6\n    },\n    \"Caps\",\n    \"A\",\n    \"S\",\n    \"D\",\n    \"F\",\n    \"G\",\n    \"H\",\n    \"J\",\n    \"K\",\n    \"L\",\n    \"?\",\n    {\n      \"h\": 2,\n      \"w2\": 2.4,\n      \"h2\": 1,\n      \"x2\": -1.4,\n      \"y2\": 1\n    },\n    \"Enter\"\n  ],\n  [\n    {\n      \"w\": 2.2\n    },\n    \"Shift\",\n    \"Z\",\n    \"X\",\n    \"C\",\n    \"V\",\n    \"B\",\n    \"N\",\n    \"M\",\n    \".\"\n  ],\n  [\n    {\n      \"w\": 2.2\n    },\n    \"123/sym\",\n    {\n      \"w\": 8\n    },\n    \"\",\n    {\n      \"w\": 2.4\n    },\n    \"<Speaker>\"\n  ]\n]\n");
local v17 = l_HttpService_0:JSONDecode("[\n  [\n    {\n      \"a\": 7,\n      \"w\": 0.8\n    },\n    \"*\",\n    \"1\",\n    \"2\",\n    \"3\",\n    \"4\",\n    \"5\",\n    \"6\",\n    \"7\",\n    \"8\",\n    \"9\",\n    \"0\",\n    {\n      \"w\": 1.8\n    },\n    \"Delete\"\n  ],\n  [\n    {\n      \"w\": 1.6\n    },\n    \" 2,\n      \"w2\": 2.4,\n      \"h2\": 1,\n      \"x2\": -1.4,\n      \"y2\": 1\n    },\n    \"Enter\"\n  ],\n  [\n    {\n      \"w\": 1.2\n    },\n    \"/\",\n    \"-\",\n    \"+\",\n    \"_\",\n    \":\",\n    \";\",\n    \"'\",\n    \"\\\"\",\n    \",\",\n    \".\"\n  ],\n  [\n    {\n      \"w\": 2.2\n    },\n    \"abc\",\n    {\n      \"w\": 8\n    },\n    \"\",\n    {\n      \"w\": 2.4\n    },\n    \"<Speaker>\"\n  ]\n]\n");
local v18 = {};
for v19, v20 in pairs({
    "ASR_STATUS_OK", 
    "ASR_STATUS_CANCELLED", 
    "ASR_STATUS_UNKNOWN", 
    "ASR_STATUS_INVALID_ARGUMENTS", 
    "ASR_STATUS_DEADLINE_EXCEEDED", 
    "ASR_STATUS_NOT_FOUND", 
    "ASR_STATUS_ALREADY_EXISTS", 
    "ASR_STATUS_PERMISSION_DENIED", 
    "ASR_STATUS_UNAUTHENTICATED", 
    "ASR_STATUS_RESOURCE_EXHAUSTED", 
    "ASR_STATUS_FAILED_PRECONDITION", 
    "ASR_STATUS_ABORTED", 
    "ASR_STATUS_OUT_OF_RANGE", 
    "ASR_STATUS_UNIMPLEMENTED", 
    "ASR_STATUS_INTERNAL", 
    "ASR_STATUS_UNAVAILABLE", 
    "ASR_STATUS_DATA_LOSS", 
    "ASR_STATUS_NOT_ENABLED", 
    "ASR_STATUS_LOW_CONFIDENCE", 
    "ASR_STATUS_INVALID_JSON"
}) do
    v18[v20] = v19 - 1;
end;
local function _(v21, v22)
    local v23 = {};
    for v24 in string.gmatch(v21, "([^" .. v22 .. "]+)") do
        table.insert(v23, v24);
    end;
    return v23;
end;
local function _(v26)
    local v27 = string.match(v26.Name, "%d+");
    return not not v27 and tostring(v27) or 12;
end;
local function _(v29, v30, v31)
    v30 = v30.unit;
    v29 = v29.Unit;
    local v32 = v30:Dot(v29.Direction);
    if v32 == 0 then
        return nil;
    else
        local v33 = v30:Dot(v31 - v29.Origin) / v32;
        if v33 < 0 then
            return nil;
        else
            return v29.Origin + v29.Direction * v33;
        end;
    end;
end;
Clamp = function(v35, v36, v37)
    return (math.max(v35, (math.min(v36, v37))));
end;
local function _(v38, v39, v40)
    local l_AbsolutePosition_0 = v38.AbsolutePosition;
    local v42 = v38.AbsolutePosition + v38.AbsoluteSize;
    if ((l_AbsolutePosition_0.X <= v39 and v39 <= v42.X) and l_AbsolutePosition_0.Y <= v40) and v40 <= v42.Y then
        return true;
    else
        return false;
    end;
end;
local function v44(v45, v46)
    if v45 then
        local l_Parent_0 = v45.Parent;
        if not l_Parent_0 or not l_Parent_0:IsA(v46) then
            return v44(l_Parent_0, v46);
        else
            return l_Parent_0;
        end;
    else
        return nil;
    end;
end;
local function v55(v48)
    local v49 = {};
    setmetatable(v49, {
        __index = function(_, v51)
            return v48[v51];
        end, 
        __newindex = function(_, v53, v54)
            v48[v53] = v54;
        end
    });
    return v49;
end;
local function v69(v56)
    local v57 = v55(v56);
    rawset(v57, "OnEnter", function(_)
    end);
    rawset(v57, "OnLeave", function(_)
    end);
    rawset(v57, "OnDown", function(_)
    end);
    rawset(v57, "OnUp", function(_)
    end);
    rawset(v57, "ContainsPoint", function(_, v63, v64)
        local l_v56_0 = v56;
        local l_AbsolutePosition_1 = l_v56_0.AbsolutePosition;
        local v67 = l_v56_0.AbsolutePosition + l_v56_0.AbsoluteSize;
        if ((l_AbsolutePosition_1.X <= v63 and v63 <= v67.X) and l_AbsolutePosition_1.Y <= v64) and v64 <= v67.Y then
            return true;
        else
            return false;
        end;
    end);
    rawset(v57, "Update", function(_)
    end);
    return v57;
end;
local _ = v10:Create("ImageLabel")({
    Name = "SelectionRing", 
    Size = UDim2.new(1, -6, 1, -6), 
    Position = UDim2.new(0, 4, 0, 3), 
    Image = "rbxasset://textures/ui/menu/buttonHover.png", 
    ScaleType = Enum.ScaleType.Slice, 
    SliceCenter = Rect.new(47, 47, 47, 47), 
    BackgroundTransparency = 1
});
local v71 = {
    ["<Speaker>"] = {
        Asset = "rbxasset://textures/ui/Keyboard/mic_icon.png", 
        AspectRatio = 0.615
    }
};
local function v121(v72, v73, v74)
    local v75 = ((v73.width2 and v73.height2) and v73.x2) and v73.y2;
    local v76 = v10:Create("ImageButton")({
        Name = v74[1], 
        Position = UDim2.new(v73.x, 0, v73.y, 0), 
        Size = UDim2.new(v73.width, 0, v73.height, 0), 
        BorderSizePixel = 0, 
        Image = "", 
        BackgroundTransparency = 1, 
        ZIndex = 1
    });
    local v77 = v10:Create("TextLabel")({
        Name = "KeyText", 
        Text = v74[#v74], 
        Position = UDim2.new(0, -10, 0, -10), 
        Size = UDim2.new(1, 0, 1, 0), 
        Font = Enum.Font.SourceSansBold, 
        FontSize = Enum.FontSize.Size96, 
        TextColor3 = v15, 
        BackgroundTransparency = 1, 
        Selectable = true, 
        ZIndex = 2, 
        Parent = v76
    });
    local v78 = v10:Create("Frame")({
        Name = "KeyBackground", 
        Size = UDim2.new(1, -10, 1, -10), 
        Position = UDim2.new(0, -5, 0, -5), 
        BackgroundColor3 = v11, 
        BackgroundTransparency = 0.3, 
        BorderSizePixel = 0, 
        Parent = v76
    });
    local v79 = v10:Create("ImageLabel")({
        Name = "SelectionObject", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png", 
        ImageTransparency = 0, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(12, 12, 52, 52), 
        BorderSizePixel = 0
    });
    v76.SelectionImageObject = v10:Create("ImageLabel")({
        Visible = false
    });
    local v80 = nil;
    local v81 = nil;
    local v82 = nil;
    local v83 = nil;
    if v75 then
        v80 = v10:Create("ImageButton")({
            Name = "KeyBackground", 
            Position = UDim2.new(v73.x2 / v73.width, -5, v73.y2 / v73.height, -5), 
            Size = UDim2.new(v73.width2 / v73.width, 0, v73.height2 / v73.height, -10), 
            BackgroundColor3 = v11, 
            BackgroundTransparency = 0.3, 
            BorderSizePixel = 0, 
            AutoButtonColor = false, 
            SelectionImageObject = v76.SelectionImageObject, 
            Parent = v76
        });
        if v73.x2 <= 0 then
            v77.Size = v80.Size - UDim2.new(0, 10, 0, 0);
            v77.Position = v80.Position;
            v80.Size = v80.Size - UDim2.new(1, 0, 0, 0);
        end;
        v81 = v10:Create("Frame")({
            Name = "SpecialSelectionObject", 
            Size = UDim2.new(1, 0, 0.5, 0), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true; 
            v10:Create("ImageLabel")({
                Name = "Borders", 
                Position = UDim2.new(-1, 0, -1, 0), 
                Size = UDim2.new(2, 0, 2, 0), 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png", 
                ImageTransparency = 0, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(12, 12, 52, 52)
            })
        });
        v82 = v81:Clone();
        v82.Size = UDim2.new(1, 0, 0.5, 5);
        v82.Position = UDim2.new(0, 0, 0, 0);
        v82.Borders.Size = UDim2.new(1, 0, 1, 30);
        v82.Borders.Position = UDim2.new(0, 0, 0, 0);
        v83 = v81:Clone();
        v83.Size = UDim2.new(1, 5, 1, 0);
        v83.Position = UDim2.new(0, 0, 0, 0);
        v83.Borders.Size = UDim2.new(1, 30, 1, 0);
        v83.Borders.Position = UDim2.new(0, 0, 0, 0);
    end;
    local v84 = v69(v76);
    local v85 = false;
    local v86 = false;
    local v87 = false;
    if #v74 == 1 then
        v87 = false;
        if type(v74[1]) == "string" then
            v87 = false;
            if #v74[1] == 1 then
                v87 = false;
                if string.byte(v74[1]) >= 65 then
                    v87 = string.byte(v74[1]) <= 122;
                end;
            end;
        end;
    end;
    local v88 = nil;
    if not (not v74[1] or not v71[v74[1]]) then
        v77.Visible = false;
        v88 = v10:Create("ImageLabel")({
            Name = "KeyIcon", 
            Size = UDim2.new(v71[v74[1]].AspectRatio, -20, 1, -20), 
            SizeConstraint = Enum.SizeConstraint.RelativeYY, 
            BackgroundTransparency = 1, 
            Image = v71[v74[1]].Asset, 
            Parent = v78
        });
        v88.Changed:connect(function(v89)
            if v89 == "AbsoluteSize" then
                v88.Position = UDim2.new(0.5, -v88.AbsoluteSize.X / 2, 0.5, -v88.AbsoluteSize.Y / 2);
            end;
        end);
        v88.Position = UDim2.new(0.5, -v88.AbsoluteSize.X / 2, 0.5, -v88.AbsoluteSize.Y / 2);
    end;
    local function v92()
        local v90 = nil;
        local l_v84_CurrentKeyValue_0 = v84:GetCurrentKeyValue();
        if l_v84_CurrentKeyValue_0 == "Shift" then
            v72:SetShift(not v72:GetShift());
        elseif l_v84_CurrentKeyValue_0 == "Caps" then
            v72:SetCaps(not v72:GetCaps());
        elseif l_v84_CurrentKeyValue_0 == "Enter" then
            v72:SubmitText(true, true);
        elseif l_v84_CurrentKeyValue_0 == "Delete" then
            v72:BackspaceAtCursor();
        elseif l_v84_CurrentKeyValue_0 == "123/sym" then
            v72:SetCurrentKeyset(2);
        elseif l_v84_CurrentKeyValue_0 == "abc" then
            v72:SetCurrentKeyset(1);
        elseif l_v84_CurrentKeyValue_0 == "<Speaker>" then
            v72:SetVoiceMode(true);
        else
            v90 = l_v84_CurrentKeyValue_0 == "Tab" and "\t" or l_v84_CurrentKeyValue_0;
        end;
        if v90 ~= nil then
            v72:SubmitCharacter(v90, v87);
        end;
    end;
    local function _(v93, v94)
        v78.BackgroundColor3 = v93;
        if v80 then
            v80.BackgroundColor3 = v93;
        end;
        if not v75 then
            v79.Parent = not not v94 and v78 or nil;
            return ;
        else
            v81.Parent = not not v94 and v78 or nil;
            v82.Parent = not not v94 and v78 or nil;
            v83.Parent = not not v94 and v80 or nil;
            return ;
        end;
    end;
    local function v103()
        local l_v84_CurrentKeyValue_1 = v84:GetCurrentKeyValue();
        if not v86 then
            if not v85 then
                if not (l_v84_CurrentKeyValue_1 == "Caps") or not v72:GetCaps() then
                    if not (l_v84_CurrentKeyValue_1 == "Shift") or not v72:GetShift() then
                        if l_v84_CurrentKeyValue_1 == "abc" then
                            local l_v14_0 = v14;
                            v78.BackgroundColor3 = l_v14_0;
                            if v80 then
                                v80.BackgroundColor3 = l_v14_0;
                            end;
                            if not v75 then
                                v79.Parent = nil;
                            else
                                v81.Parent = nil;
                                v82.Parent = nil;
                                v83.Parent = nil;
                            end;
                        else
                            local l_v11_0 = v11;
                            v78.BackgroundColor3 = l_v11_0;
                            if v80 then
                                v80.BackgroundColor3 = l_v11_0;
                            end;
                            if not v75 then
                                v79.Parent = nil;
                            else
                                v81.Parent = nil;
                                v82.Parent = nil;
                                v83.Parent = nil;
                            end;
                        end;
                    else
                        local l_v14_1 = v14;
                        v78.BackgroundColor3 = l_v14_1;
                        if v80 then
                            v80.BackgroundColor3 = l_v14_1;
                        end;
                        if not v75 then
                            v79.Parent = nil;
                        else
                            v81.Parent = nil;
                            v82.Parent = nil;
                            v83.Parent = nil;
                        end;
                    end;
                else
                    local l_v14_2 = v14;
                    v78.BackgroundColor3 = l_v14_2;
                    if v80 then
                        v80.BackgroundColor3 = l_v14_2;
                    end;
                    if not v75 then
                        v79.Parent = nil;
                    else
                        v81.Parent = nil;
                        v82.Parent = nil;
                        v83.Parent = nil;
                    end;
                end;
            else
                local l_v12_0 = v12;
                v78.BackgroundColor3 = l_v12_0;
                if v80 then
                    v80.BackgroundColor3 = l_v12_0;
                end;
                if not v75 then
                    v79.Parent = v78 or nil;
                else
                    v81.Parent = v78 or nil;
                    v82.Parent = v78 or nil;
                    v83.Parent = v80 or nil;
                end;
            end;
        else
            local l_v13_0 = v13;
            v78.BackgroundColor3 = l_v13_0;
            if v80 then
                v80.BackgroundColor3 = l_v13_0;
            end;
            if not v75 then
                v79.Parent = nil;
            else
                v81.Parent = nil;
                v82.Parent = nil;
                v83.Parent = nil;
            end;
        end;
        if v88 then
            v88.ImageTransparency = 0.5;
        end;
        v77.Text = v84:GetCurrentKeyValue();
    end;
    local v104 = {};
    rawset(v84, "OnEnter", function(_)
        v85 = true;
        v103();
    end);
    rawset(v84, "OnLeave", function(_)
        if not next(v104) then
            v85 = false;
            v86 = false;
            v103();
        end;
    end);
    rawset(v84, "OnDown", function(_)
        v86 = true;
        v103();
        v92();
    end);
    rawset(v84, "OnUp", function(_)
        v86 = false;
        v103();
    end);
    rawset(v84, "GetCurrentKeyValue", function(_)
        local l_v72_Shift_0 = v72:GetShift();
        local l_v72_Caps_0 = v72:GetCaps();
        if not v87 then
            if not l_v72_Shift_0 then
                return v74[#v74];
            else
                return v74[1];
            end;
        elseif not l_v72_Caps_0 or not l_v72_Shift_0 then
            if not l_v72_Caps_0 and not l_v72_Shift_0 then
                return string.lower(v74[#v74]);
            else
                return v74[1];
            end;
        else
            return string.lower(v74[#v74]);
        end;
    end);
    rawset(v84, "ContainsPoint", function(_, v113, v114)
        local l_v78_0 = v78;
        local l_AbsolutePosition_2 = l_v78_0.AbsolutePosition;
        local v117 = l_v78_0.AbsolutePosition + l_v78_0.AbsoluteSize;
        local v118 = ((l_AbsolutePosition_2.X <= v113 and v113 <= v117.X) and l_AbsolutePosition_2.Y <= v114) and v114 <= v117.Y;
        if not v118 then
            v118 = v80;
            if v118 then
                l_v78_0 = v80;
                l_AbsolutePosition_2 = l_v78_0.AbsolutePosition;
                v117 = l_v78_0.AbsolutePosition + l_v78_0.AbsoluteSize;
                if ((l_AbsolutePosition_2.X <= v113 and v113 <= v117.X) and l_AbsolutePosition_2.Y <= v114) and v114 <= v117.Y then
                    return true;
                else
                    v118 = false;
                end;
            end;
        end;
        return v118;
    end);
    rawset(v84, "Update", function(_)
        v103();
    end);
    rawset(v84, "GetInstance", function(_)
        return v76;
    end);
    v76.MouseButton1Down:connect(function()
        v84:OnDown();
    end);
    v76.MouseButton1Up:connect(function()
        v84:OnUp();
    end);
    v76.SelectionGained:connect(function()
        v104[v76] = true;
        v84:OnEnter();
    end);
    v76.SelectionLost:connect(function()
        v104[v76] = nil;
        v84:OnLeave();
    end);
    if v80 then
        v80.MouseButton1Down:connect(function()
            v84:OnDown();
        end);
        v80.MouseButton1Up:connect(function()
            v84:OnUp();
        end);
        v80.SelectionGained:connect(function()
            v104[v80] = true;
            v84:OnEnter();
        end);
        v80.SelectionLost:connect(function()
            v104[v80] = nil;
            v84:OnLeave();
        end);
    end;
    v103();
    return v84;
end;
local function v124()
    return {
        Name = "Base", 
        TransitionFrom = function(_)
        end, 
        TransitionTo = function(_)
        end
    };
end;
local _ = function()
    local v125 = v124();
    v125.Name = "Listening";
    v125.TransitionTo = function(_)
        pcall(function()
            l_SoundService_0:BeginRecording();
        end);
    end;
    return v125;
end;
local _ = function()
    local v128 = v124();
    v128.Name = "Processing";
    local v129 = false;
    local v130 = nil;
    v128.TransitionTo = function(_)
        coroutine.wrap(function()
            pcall(function()
                v130 = l_SoundService_0:EndRecording();
            end);
            v129 = true;
        end)();
    end;
    v128.GetResultAsync = function(_)
        while not v129 do
            wait();
        end;
        return v130;
    end;
    return v128;
end;
local function _()
    local v134 = v124();
    v134.Name = "Waiting";
    return v134;
end;
local v136 = {
    Listening = {
        Processing = true
    }, 
    Processing = {
        Waiting = true
    }, 
    Waiting = {
        Listening = true
    }
};
local v137 = {};
local v138 = v124();
v138.Name = "Waiting";
v137.CurrentState = v138;
local l_BindableEvent_0 = Instance.new("BindableEvent");
local l_l_BindableEvent_0_0 = l_BindableEvent_0 --[[ copy: 35 -> 39 ]];
v137.TransitionState = function(v141, v142)
    if not v136[v141.CurrentState.Name][v142.Name] then
        return false;
    else
        v141.CurrentState:TransitionFrom();
        v141.CurrentState = v142;
        v141.CurrentState:TransitionTo();
        l_l_BindableEvent_0_0:Fire(v141.CurrentState);
        return true;
    end;
end;
v137.GetCurrentState = function(v143)
    return v143.CurrentState;
end;
v137.StateTransitionedEvent = l_BindableEvent_0.Event;
l_BindableEvent_0 = function(v144)
    local v145 = require(l_RobloxGui_0.Modules.VR.Panel3D);
    local v146 = v145.Get("Keyboard");
    v146:SetVisible(false);
    local v147 = {};
    local v148 = v10:Create("Frame")({
        Name = "VirtualKeyboard", 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        Active = true, 
        Visible = false
    });
    local v149 = v10:Create("TextButton")({
        Name = "TextEntryField", 
        Text = "", 
        Position = UDim2.new(0, 4, 0, 4), 
        Size = UDim2.new(1, -8, 1, -8), 
        Font = Enum.Font.SourceSans, 
        FontSize = Enum.FontSize.Size60, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Parent = v10:Create("Frame")({
            Name = "TextfieldBackground", 
            Position = UDim2.new(0, 2, 0, 2), 
            Size = UDim2.new(1, -4, 1, -4), 
            BackgroundTransparency = 0, 
            BackgroundColor3 = Color3.new(0.8196078431372549, 0.8470588235294118, 0.8666666666666667), 
            BorderSizePixel = 0, 
            Visible = true, 
            Parent = v10:Create("ImageLabel")({
                Name = "TextEntryBackground", 
                Size = UDim2.new(0.5, 0, 0.125, 0), 
                Position = UDim2.new(0.25, 0, 0, 0), 
                Image = "", 
                BackgroundTransparency = 0.5, 
                BackgroundColor3 = Color3.new(0.12156862745098039, 0.12156862745098039, 0.12156862745098039), 
                BorderSizePixel = 0, 
                ClipsDescendants = true, 
                Parent = v148
            })
        })
    });
    local v150 = v10:Create("Frame")({
        Name = "TextfieldCursor", 
        Size = UDim2.new(0, 5, 0.9, 0), 
        Position = UDim2.new(0, 0, 0.05, 0), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = v14, 
        BorderSizePixel = 0, 
        Visible = true, 
        ZIndex = 2, 
        Parent = v149
    });
    local v151 = v10:Create("ImageButton")({
        Name = "CloseButton", 
        Size = UDim2.new(0.075, -10, 0.198, -10), 
        Position = UDim2.new(0, -5, 0, -35), 
        Image = "rbxasset://textures/ui/Keyboard/close_button_background.png", 
        BackgroundTransparency = 1, 
        AutoButtonColor = false, 
        Parent = v148
    });
    v151.SelectionImageObject = v10:Create("ImageLabel")({
        Name = "Selection", 
        Size = UDim2.new(0.9, 0, 0.9, 0), 
        Position = UDim2.new(0.05, 0, 0.05, 0), 
        Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png", 
        BackgroundTransparency = 1
    });
    v10:Create("ImageLabel")({
        Name = "Icon", 
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        Position = UDim2.new(0.25, 0, 0.25, 0), 
        Image = "rbxasset://textures/ui/Keyboard/close_button_icon.png", 
        BackgroundTransparency = 1, 
        Parent = v151
    });
    local v152 = v69(v151);
    table.insert(v147, v152);
    local v153 = v10:Create("Frame")({
        Name = "VoiceRecognitionContainer", 
        Size = UDim2.new(1, 0, 0.85, 0), 
        Position = UDim2.new(0, 0, 0.15, 0), 
        BackgroundTransparency = 1, 
        Active = true, 
        Visible = false, 
        Parent = v148
    });
    local v154 = v10:Create("Frame")({
        Name = "voiceRecognitionBackground1", 
        Size = UDim2.new(1, 0, 0.75, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundColor3 = v11, 
        BackgroundTransparency = 0.3, 
        BorderSizePixel = 0, 
        Active = true, 
        Parent = v153
    }):Clone();
    v154.Size = UDim2.new(0.8, 0, 0.25, 0);
    v154.Position = UDim2.new(0, 0, 0.75, 0);
    v154.Parent = v153;
    local v155 = v69(v10:Create("TextButton")({
        Name = "DoneButton", 
        Size = UDim2.new(0.2, -5, 0.25, -5), 
        Position = UDim2.new(0.8, 5, 0.75, 5), 
        Text = "Done", 
        BackgroundColor3 = v14, 
        Font = Enum.Font.SourceSansBold, 
        FontSize = Enum.FontSize.Size96, 
        TextColor3 = v15, 
        BackgroundTransparency = 0, 
        AutoButtonColor = false, 
        BorderSizePixel = 0, 
        Parent = v153
    }));
    table.insert(v147, v155);
    v154 = v10:Create("TextLabel")({
        Name = "VoiceProcessingStatus", 
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(0.5, 0, 0.33, 0), 
        Text = "", 
        Font = Enum.Font.SourceSansBold, 
        FontSize = Enum.FontSize.Size96, 
        TextColor3 = v15, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Parent = v153
    });
    local v165 = (function()
        local v156 = {};
        local v157 = {};
        local v158 = v10:Create("Frame")({
            Name = "VoiceVisualizerContainer", 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        });
        v156.Container = v158;
        for v159 = 1, 50 do
            table.insert(v157, (v10:Create("Frame")({
                Name = "Bar", 
                Size = UDim2.new(0.02, -4, 1, 0), 
                Position = UDim2.new(v159 / 50, 0, 0, 0), 
                BackgroundTransparency = 0, 
                BackgroundColor3 = v15, 
                Parent = v158
            })));
        end;
        v156.StartAnimation = function(_)
            l_RunService_0:UnbindFromRenderStep("VoiceVisualizerWidget");
            l_RunService_0:BindToRenderStep("VoiceVisualizerWidget", Enum.RenderPriority.First.Value, function()
                for v161, v162 in pairs(v157) do
                    local v163 = ((math.abs((math.sin(tick() * 2.5 + v161 * 0.5026548245743669))) + math.abs((math.cos(tick() * 2.5 + v161 * 0.5026548245743669)))) / 2 - 0.3) * 1.4285714285714286;
                    v162.Size = UDim2.new(0.02, -4, v163, 0);
                    v162.Position = UDim2.new(v161 / 50, 0, (1 - v163) / 2, 0);
                end;
            end);
        end;
        v156.StopAnimation = function(_)
            l_RunService_0:UnbindFromRenderStep("VoiceVisualizerWidget");
        end;
        return v156;
    end)();
    v165.Container.Parent = v153;
    v165.Container.Size = UDim2.new(0.5, 0, 0.4, 0);
    v165.Container.Position = UDim2.new(0.25, 0, 0.4, 0);
    local v166 = v55(v148);
    local v167 = nil;
    local v168 = {};
    local v169 = false;
    local v170 = false;
    local v171 = 0;
    local l_BindableEvent_1 = Instance.new("BindableEvent");
    local l_BindableEvent_2 = Instance.new("BindableEvent");
    local v174 = false;
    local function v179(v175)
        v171 = Clamp(0, #v149.Text, v175);
        if not v149.TextFits then
            v171 = #v149.Text;
        end;
        local l_l_TextService_0_0 = l_TextService_0;
        local v177 = string.sub(v149.Text, 1, v171);
        local v178 = string.match(v149.FontSize.Name, "%d+");
        v150.Position = UDim2.new(0, l_l_TextService_0_0:GetTextSize(v177, not not v178 and tostring(v178) or 12, v149.Font, v149.AbsoluteSize).x, v150.Position.Y.Scale, v150.Position.Y.Offset);
    end;
    local function _(v180)
        v149:SetTextFromInput(v180);
        v179(v171);
    end;
    local v182 = "";
    local function _()
        if not v167 or not v167.TextBox then
            return v182;
        else
            return v167.TextBox.Text;
        end;
    end;
    local function _(v184)
        if not v167 or not v167.TextBox then
            if v182 ~= v184 then
                v182 = v184;
                v149:SetTextFromInput(v182);
                v179(v171);
            end;
            return ;
        else
            v167.TextBox.Text = v184;
            return ;
        end;
    end;
    local function v192(v186, v187)
        v186 = v186 - v149.AbsolutePosition.x;
        v187 = v187 - v149.AbsolutePosition.y;
        for v188 = 1, #v149.Text do
            local l_l_TextService_0_1 = l_TextService_0;
            local v190 = string.sub(v149.Text, 1, v188);
            local v191 = string.match(v149.FontSize.Name, "%d+");
            if v186 < l_l_TextService_0_1:GetTextSize(v190, not not v191 and tostring(v191) or 12, v149.Font, v149.AbsoluteSize).x then
                return v188 - 1;
            end;
        end;
        return #v149.Text;
    end;
    local v193 = nil;
    rawset(v166, "OpenedEvent", l_BindableEvent_1.Event);
    rawset(v166, "ClosedEvent", l_BindableEvent_2.Event);
    rawset(v166, "GetCurrentKeyset", function(_)
        return v168[v193];
    end);
    rawset(v166, "SetCurrentKeyset", function(_, v196)
        if v196 ~= v193 and v168[v196] ~= nil then
            if not (not v168[v193] or not v168[v193].container) then
                v168[v193].container.Visible = false;
            end;
            v193 = v196;
            if not (not v168[v193] or not v168[v193].container) then
                v168[v193].container.Visible = true;
            end;
        end;
    end);
    rawset(v166, "SetVoiceMode", function(v197, v198)
        v198 = false;
        local l_v197_CurrentKeyset_0 = v197:GetCurrentKeyset();
        if not (not l_v197_CurrentKeyset_0 or not l_v197_CurrentKeyset_0.container) then
            l_v197_CurrentKeyset_0.container.Visible = not v198;
        end;
        v153.Visible = v198;
        if v198 then
            local l_v137_0 = v137;
            local v201 = v124();
            v201.Name = "Listening";
            v201.TransitionTo = function(_)
                pcall(function()
                    l_SoundService_0:BeginRecording();
                end);
            end;
            l_v137_0:TransitionState(v201);
        end;
    end);
    rawset(v166, "GetCaps", function(_)
        return v169;
    end);
    rawset(v166, "SetCaps", function(v204, v205)
        v169 = v205;
        for _, v207 in pairs(v204:GetCurrentKeyset().keys) do
            v207:Update();
        end;
    end);
    rawset(v166, "GetShift", function(_)
        return v170;
    end);
    rawset(v166, "SetShift", function(v209, v210)
        v170 = v210;
        for _, v212 in pairs(v209:GetCurrentKeyset().keys) do
            v212:Update();
        end;
    end);
    local v213 = false;
    local v214 = nil;
    local v215 = nil;
    local v216 = nil;
    local function _()
        if v214 then
            v214:disconnect();
        end;
        v214 = nil;
        if v215 then
            v215:disconnect();
        end;
        v215 = nil;
        if v216 then
            v216:disconnect();
        end;
        v216 = nil;
    end;
    rawset(v166, "Open", function(v218, v219)
        if not v174 then
            v174 = true;
            v167 = v219;
            v218:SetCurrentKeyset(1);
            v218:SetVoiceMode(false);
            v148.Visible = true;
            v146:ResizeStuds(5.9, 2.25, 320);
            local v220 = CFrame.new();
            if v214 then
                v214:disconnect();
            end;
            v214 = nil;
            if v215 then
                v215:disconnect();
            end;
            v215 = nil;
            if v216 then
                v216:disconnect();
            end;
            v216 = nil;
            if not v219.TextBox then
                if not v167 or not v167.TextBox then
                    if v182 ~= "" then
                        v182 = "";
                        v149:SetTextFromInput(v182);
                        v179(v171);
                    end;
                else
                    v167.TextBox.Text = "";
                end;
            else
                v214 = v219.TextBox.Changed:connect(function(v221)
                    if v221 == "Text" then
                        v149:SetTextFromInput(v219.TextBox.Text);
                        v179(v171);
                    end;
                end);
                v215 = v219.TextBox.FocusLost:connect(function(v222)
                    if not v213 then
                        v218:Close(v222);
                    end;
                end);
                if not v219.TextBox.ClearTextOnFocus then
                    v149:SetTextFromInput(v219.TextBox.Text);
                    v179(v171);
                elseif not v167 or not v167.TextBox then
                    if v182 ~= "" then
                        v182 = "";
                        v149:SetTextFromInput(v182);
                        v179(v171);
                    end;
                else
                    v167.TextBox.Text = "";
                end;
                local v223 = v145.FindContainerOf(v219.TextBox);
                if not v223 then
                    v220 = (v145.GetHeadLookXZ(true) * CFrame.Angles(0.39269908169872414, 0, 0)) * CFrame.new(0, -1, -5);
                else
                    v216 = v145.OnPanelClosed.Event:connect(function(v224)
                        if v224 == v223.name then
                            v218:Close(false);
                        end;
                    end);
                    v220 = ((v223:GetCFrameInCameraSpace() * CFrame.new(v223:GetGuiPositionInPanelSpace(v219.TextBox.AbsolutePosition + Vector2.new(0.5, 1) * v219.TextBox.AbsoluteSize))) * CFrame.new(0, -v146.height * 0.65, 0.5)) * CFrame.Angles(-0.39269908169872414, 0, 0);
                end;
            end;
            l_ContextActionService_0:BindCoreAction("VirtualKeyboardControllerInput", function(_, v226, v227)
                if v226 == Enum.UserInputState.End then
                    if v227.KeyCode == Enum.KeyCode.ButtonL1 then
                        v179(v171 - 1);
                        return ;
                    elseif v227.KeyCode == Enum.KeyCode.ButtonR1 then
                        v179(v171 + 1);
                        return ;
                    elseif v227.KeyCode == Enum.KeyCode.ButtonX then
                        v218:BackspaceAtCursor();
                        return ;
                    elseif v227.KeyCode == Enum.KeyCode.ButtonY then
                        v218:SubmitCharacter(" ", false);
                        return ;
                    elseif v227.KeyCode == Enum.KeyCode.ButtonL2 then
                        if v193 then
                            v218:SetCurrentKeyset(v193 % #v168 + 1);
                            return ;
                        end;
                    elseif v227.KeyCode == Enum.KeyCode.ButtonL3 then
                        v218:SetCaps(not v218:GetCaps());
                        return ;
                    elseif v227.KeyCode == Enum.KeyCode.ButtonB then
                        v218:Close(false);
                    end;
                end;
            end, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL2, Enum.KeyCode.ButtonL3, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonB);
            v218.Parent = v146:GetGUI();
            v146:SetType(v145.Type.Fixed, {
                CFrame = v220
            });
            v146:SetCanFade(false);
            v146:SetVisible(true, true);
            v146:ForceShowUntilLookedAt();
            v146.OnUpdate = function(_)
            end;
            l_BindableEvent_1:Fire();
            return ;
        else
            return ;
        end;
    end);
    rawset(v166, "Close", function(v229, v230)
        v230 = v230 == true;
        if v174 then
            v174 = false;
            if v214 then
                v214:disconnect();
            end;
            v214 = nil;
            if v215 then
                v215:disconnect();
            end;
            v215 = nil;
            if v216 then
                v216:disconnect();
            end;
            v216 = nil;
            l_ContextActionService_0:UnbindCoreAction("VirtualKeyboardControllerInput");
            v146:OnMouseLeave();
            v146:SetVisible(false, true);
            v148.Visible = false;
            v145.Get("Topbar3D"):SetVisible(true);
            v229:SubmitText(v230, false);
            l_BindableEvent_2:Fire();
            return ;
        else
            return ;
        end;
    end);
    rawset(v166, "SubmitText", function(_, v232, v233)
        local v234 = v167 and v167.TextBox;
        if v234 then
            if v232 then
                v234.Text = if not not v167 and v167.TextBox then v167.TextBox.Text else v182;
            end;
            local v235 = v145.FindContainerOf(v234);
            local v236 = (v233 and v235) and v235.linkedTo == v146;
            if v236 then
                v213 = true;
            end;
            v234:ReleaseFocus(v232);
            if v236 then
                v234:CaptureFocus();
                v213 = false;
            end;
        end;
    end);
    rawset(v166, "GetCurrentOptions", function(_)
        return v167;
    end);
    rawset(v166, "BackspaceAtCursor", function(_)
        if v171 >= 1 then
            local v239 = if not not v167 and v167.TextBox then v167.TextBox.Text else v182;
            local v240 = string.sub(v239, 1, v171 - 1) .. string.sub(v239, v171 + 1, #v239);
            local v241 = v171 - 1;
            if not v167 or not v167.TextBox then
                if v182 ~= v240 then
                    v182 = v240;
                    v149:SetTextFromInput(v182);
                    v179(v171);
                end;
            else
                v167.TextBox.Text = v240;
            end;
            v179(v241);
        end;
    end);
    rawset(v166, "SubmitCharacter", function(v242, v243, v244)
        local v245 = if not not v167 and v167.TextBox then v167.TextBox.Text else v182;
        local v246 = string.sub(v245, 1, v171) .. v243 .. string.sub(v245, v171 + 1, #v245);
        if not v167 or not v167.TextBox then
            if v182 ~= v246 then
                v182 = v246;
                v149:SetTextFromInput(v182);
                v179(v171);
            end;
        else
            v167.TextBox.Text = v246;
        end;
        v179(v171 + #v243);
        if not (not v244 or not v242:GetShift()) then
            v242:SetShift(false);
        end;
    end);
    for _, v248 in pairs(v144) do
        local v249 = {};
        local v250 = v10:Create("Frame")({
            Name = "KeyboardSizeConstrainer", 
            Size = UDim2.new(1, 0, 1, -20), 
            Position = UDim2.new(0, 0, 0, 20), 
            BackgroundTransparency = 1, 
            Parent = v148
        });
        local v251 = 0;
        local v252 = 0;
        local v253 = 0;
        for _, v255 in pairs(v248) do
            local v256 = 0;
            local v257 = 1;
            local v258 = 1;
            local v259 = nil;
            local v260 = nil;
            local v261 = nil;
            local v262 = nil;
            for _, v264 in pairs(v255) do
                if type(v264) == "table" then
                    if v264.w then
                        v257 = v264.w;
                    end;
                    if v264.h then
                        v258 = v264.h;
                    end;
                    if v264.x then
                        v256 = v256 + v264.x;
                    end;
                    if v264.y then
                        v253 = v253 + v264.y;
                    end;
                    if v264.x2 then
                        v261 = v264.x2;
                    end;
                    if v264.y2 then
                        v262 = v264.y2;
                    end;
                    if v264.w2 then
                        v259 = v264.w2;
                    end;
                    if v264.h2 then
                        v260 = v264.h2;
                    end;
                elseif type(v264) == "string" then
                    if v264 == "" then
                        v264 = " ";
                    end;
                    local l_v121_0 = v121;
                    local l_v166_0 = v166;
                    local v267 = {
                        x = v256, 
                        y = v253, 
                        width = v257, 
                        height = v258, 
                        x2 = v261, 
                        y2 = v262, 
                        width2 = v259, 
                        height2 = v260
                    };
                    local l_v264_0 = v264;
                    local v269 = {};
                    for v270 in string.gmatch(l_v264_0, "([^" .. "\n" .. "]+)") do
                        table.insert(v269, v270);
                    end;
                    table.insert(v249, (l_v121_0(l_v166_0, v267, v269)));
                    v256 = v256 + v257;
                    v251 = math.max(v251, v256);
                    v252 = math.max(v252, v253 + v258);
                    v257 = 1;
                    v258 = 1;
                    v259 = nil;
                    v260 = nil;
                    v261 = nil;
                    v262 = nil;
                end;
            end;
            v253 = v253 + 1;
        end;
        for _, v272 in pairs(v249) do
            v272.Position = UDim2.new(v272.Position.X.Scale / v251, 0, v272.Position.Y.Scale / v252, 0);
            v272.Size = UDim2.new(v272.Size.X.Scale / v251, 0, v272.Size.Y.Scale / v252, 0);
            v272.Parent = v250;
        end;
        v250.SizeConstraint = Enum.SizeConstraint.RelativeXX;
        v250.Size = UDim2.new(1, 0, -v252 / v251, 0);
        v250.Position = UDim2.new(0, 0, 1, 0);
        v250.Visible = false;
        table.insert(v168, {
            keys = v249, 
            container = v250
        });
    end;
    v166:SetCurrentKeyset(1);
    v149.MouseButton1Click:connect(function()
        v179((v192(v146.lookAtPixel.X, v146.lookAtPixel.Y)));
    end);
    v152.MouseButton1Click:connect(function()
        v166:Close(false);
    end);
    v155.MouseButton1Click:connect(function()
        if v137:GetCurrentState().Name == "Listening" then
            local l_v137_1 = v137;
            local v274 = v124();
            v274.Name = "Processing";
            local v275 = false;
            local v276 = nil;
            local v277;
            do
                local l_v275_0, l_v276_0 = v275, v276;
                v274.TransitionTo = function(_)
                    coroutine.wrap(function()
                        pcall(function()
                            l_v276_0 = l_SoundService_0:EndRecording();
                        end);
                        l_v275_0 = true;
                    end)();
                end;
                v274.GetResultAsync = function(_)
                    while not l_v275_0 do
                        wait();
                    end;
                    return l_v276_0;
                end;
                v277 = v274;
            end;
            l_v137_1:TransitionState(v277);
        end;
    end);
    local function v287(v282)
        if v282.Name == "Listening" then
            v154.Text = "Listening...";
        elseif v282.Name == "Processing" then
            v154.Text = "Processing...";
        elseif v282.Name == "Waiting" then
            v154.Text = "Done";
        end;
        if v282.Name == "Processing" then
            coroutine.wrap(function()
                v165:StopAnimation();
                local l_v282_ResultAsync_0 = v282:GetResultAsync();
                if l_v282_ResultAsync_0 and l_v282_ResultAsync_0.Status == v18.ASR_STATUS_OK then
                    local l_Response_0 = l_v282_ResultAsync_0.Response;
                    if not v167 or not v167.TextBox then
                        if v182 ~= l_Response_0 then
                            v182 = l_Response_0;
                            v149:SetTextFromInput(v182);
                            v179(v171);
                        end;
                    else
                        v167.TextBox.Text = l_Response_0;
                    end;
                else
                    v154.Text = "An error occurred, please try again.";
                    wait(2);
                end;
                local l_v137_2 = v137;
                local v286 = v124();
                v286.Name = "Waiting";
                l_v137_2:TransitionState(v286);
            end)();
            return ;
        elseif v282.Name == "Listening" then
            v165:StartAnimation();
            return ;
        else
            if v282.Name == "Waiting" then
                v166:SetVoiceMode(false);
            end;
            return ;
        end;
    end;
    v137.StateTransitionedEvent:connect(v287);
    v287(v137:GetCurrentState());
    return v166;
end;
v138 = nil;
local function _()
    if v138 == nil then
        v138 = l_BindableEvent_0({
            v16, 
            v17
        });
    end;
    return v138;
end;
local v294 = {
    CreateVirtualKeyboardOptions = function(_, v290)
        return {
            TextBox = v290
        };
    end, 
    ShowVirtualKeyboard = function(_, _)
    end, 
    CloseVirtualKeyboard = function(_)
    end
};
if v138 == nil then
    v138 = l_BindableEvent_0({
        v16, 
        v17
    });
end;
v294.OpenedEvent = v138.OpenedEvent;
if v138 == nil then
    v138 = l_BindableEvent_0({
        v16, 
        v17
    });
end;
v294.ClosedEvent = v138.ClosedEvent;
return v294;

local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = game:DefineFastFlag("VRBackpackImproved", false);
local v3 = {
    OpenClose = nil, 
    IsHotbarVisible = false, 
    IsOpen = false, 
    StateChanged = Instance.new("BindableEvent"), 
    ModuleName = "Backpack", 
    KeepVRTopbarOpen = true, 
    VRIsExclusive = true, 
    VRClosesNonExclusive = true
};
local v4 = 60;
local l_Size14_0 = Enum.FontSize.Size14;
local v6 = 0.5 * l_UserGameSettings_0.PreferredTransparency;
local v7 = Color3.new(0.12156862745098039, 0.12156862745098039, 0.12156862745098039);
local v8 = Color3.new(0.19215686274509805, 0.19215686274509805, 0.19215686274509805);
local v9 = Color3.new(0.35294117647058826, 0.5568627450980392, 0.9137254901960784);
local v10 = 0.5 * l_UserGameSettings_0.PreferredTransparency;
local v11 = Color3.new(1, 1, 1);
local _ = UDim2.new(0, 14, 0, 9);
local l_Value_0 = Enum.KeyCode.Backquote.Value;
local v14 = Color3.new(0, 0.6352941176470588, 1);
local v15 = "   Search";
local v16 = Color3.new(0.37, 0.37, 0.37);
local v17 = 0.15 * l_UserGameSettings_0.PreferredTransparency;
local l_Value_1 = Enum.KeyCode.Zero.Value;
local l_Value_2 = Enum.KeyCode.Backspace.Value;
local v20 = {
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true, 
    [Enum.UserInputType.Gamepad5] = true, 
    [Enum.UserInputType.Gamepad6] = true, 
    [Enum.UserInputType.Gamepad7] = true, 
    [Enum.UserInputType.Gamepad8] = true
};
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_VRService_0 = game:GetService("VRService");
local l_GamepadService_0 = game:GetService("GamepadService");
local l_RobloxGui_1 = l_CoreGui_0:WaitForChild("RobloxGui");
l_RobloxGui_1:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local v30 = require(l_RobloxGui_1.Modules.TenFootInterface):IsEnabled();
local v31 = require(l_RobloxGui_1.Modules.Settings.Utility);
local v32 = require(l_RobloxGui_1.Modules.GameTranslator);
local v33 = require(l_RobloxGui_1.Modules.Settings.Utility);
pcall(function()
    local l_LocalizationService_0 = game:GetService("LocalizationService");
    v15 = l_LocalizationService_0:GetCorescriptLocalizations()[1]:GetString(l_LocalizationService_0.RobloxLocaleId, "BACKPACK_SEARCH");
end);
local v35 = true;
if v30 then
    v4 = 100;
    l_Size14_0 = Enum.FontSize.Size24;
end;
local v36 = false;
local v37 = l_UserInputService_0.TouchEnabled and l_GuiService_0:GetScreenResolution().X < 1024;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v39 = nil;
local v40 = nil;
local v41 = nil;
local v42 = nil;
local v43 = nil;
local v44 = nil;
local v45 = nil;
local v46 = nil;
local v47 = nil;
local v48 = nil;
local v49 = nil;
local v50 = nil;
local v51 = nil;
local v52 = nil;
local v53 = {};
local v54 = nil;
local v55 = {};
local v56 = {};
local v57 = {};
local v58 = 0;
local v59 = nil;
local v60 = false;
local v61 = false;
local v62 = false;
local v63 = false;
local v64 = {};
local v65 = {};
local v66 = false;
local v67 = 0;
local v68 = l_VRService_0.VREnabled and not v2;
local function _()
    return l_VRService_0.VREnabled and not v2;
end;
local v70 = if not v68 then v37 and 3 or 10 else 6;
local v71 = if not v68 then v37 and 2 or 4 else 3;
local v72 = nil;
local function _(v73)
    return (((v73 and l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack)) and v35) and l_VRService_0.VREnabled) and not v2;
end;
local function _()
end;
v3.BackpackEmpty = v33:Create("BindableEvent")({
    Name = "BackpackEmpty"
});
v3.BackpackItemAdded = v33:Create("BindableEvent")({
    Name = "BackpackAdded"
});
v3.BackpackItemRemoved = v33:Create("BindableEvent")({
    Name = "BackpackRemoved"
});
local function v79(v76, v77)
    local v78 = Instance.new(v76);
    v78.Name = v77;
    v78.BackgroundColor3 = Color3.new(0, 0, 0);
    v78.BackgroundTransparency = 1;
    v78.BorderColor3 = Color3.new(0, 0, 0);
    v78.BorderSizePixel = 0;
    v78.Size = UDim2.new(1, 0, 1, 0);
    if v76:match("Text") then
        v78.TextColor3 = Color3.new(1, 1, 1);
        v78.Text = "";
        v78.Font = Enum.Font.SourceSans;
        v78.FontSize = l_Size14_0;
        v78.TextWrapped = true;
        if v76 == "TextButton" then
            v78.Font = Enum.Font.SourceSansBold;
            v78.BorderSizePixel = 1;
        end;
    end;
    return v78;
end;
local function _()
    for v80 = 1, v70 do
        local v81 = v53[v80];
        if not v81.Tool then
            return v81;
        end;
    end;
    return nil;
end;
v3.IsInventoryEmpty = function()
    for v83 = v70 + 1, #v53 do
        local v84 = v53[v83];
        if not (not v84 or not v84.Tool) then
            return false;
        end;
    end;
    return true;
end;
local function _()
    return false;
end;
local function v97()
    local l_Visible_0 = v43.Visible;
    local v87 = not not l_Visible_0 and v70 or v58;
    local v88 = 0;
    local v89 = v87 >= 1;
    for v90 = 1, v70 do
        local v91 = v53[v90];
        if not v91.Tool and not l_Visible_0 then
            v91.Frame.Visible = false;
        else
            v88 = v88 + 1;
            v91:Readjust(v88, v87);
            v91.Frame.Visible = true;
        end;
    end;
    local l_v41_0 = v41;
    local v93 = not l_Visible_0;
    if v93 then
        if not v89 then
            local v94;
            for v95 = v70 + 1, #v53 do
                local v96 = v53[v95];
                if not (not v96 or not v96.Tool) then
                    v94 = false;
                    goto label1 --[[  true, false  ]];
                end;
            end;
            v94 = true;
            ::label1::;
            v93 = not v94;
            if not v93 then
                goto label0;
            end;
        end;
        v93 = not (l_VRService_0.VREnabled and not v2);
    end;
    ::label0::;
    l_v41_0.Visible = v93;
    v41.Position = UDim2.new(0.5, -15, 1, not v89 and -50 or -110);
    v3.IsHotbarVisible = v89;
end;
local function v98()
    v45.CanvasSize = UDim2.new(0, 0, 0, math.ceil((#v46:GetChildren() - 1) / math.floor(v45.AbsoluteSize.X / (v4 + 5))) * (v4 + 5) + 5);
end;
local function v101()
    for v99 = v70 + 1, #v53 do
        local v100 = v53[v99];
        v100.Frame.LayoutOrder = v100.Index;
        v100.Frame.Visible = v100.Tool ~= nil;
    end;
    v98();
end;
local function v102()
    v40.Size = UDim2.new(0, 5 + v70 * (v4 + 5), 0, (5 + v4) + 5);
    v40.Position = UDim2.new(0.5, -v40.Size.X.Offset / 2, 1, -v40.Size.Y.Offset);
    v43.Size = UDim2.new(0, v40.Size.X.Offset, 0, (v40.Size.Y.Offset * v71 + 40) + (not v68 and 0 or 80));
    v43.Position = UDim2.new(0.5, -v43.Size.X.Offset / 2, 1, v40.Position.Y.Offset - v43.Size.Y.Offset);
    v45.Size = UDim2.new(1, v45.ScrollBarThickness + 1, 1, -40 - (not v68 and 0 or 80));
    v45.Position = UDim2.new(0, 0, 0, 40 + (not v68 and 0 or 40));
    v97();
    v101();
end;
local function _(v103, v104, v105)
    return (math.min(v104, (math.max(v103, v105))));
end;
local function _(v107, v108, v109)
    local l_AbsolutePosition_0 = v107.AbsolutePosition;
    local l_AbsoluteSize_0 = v107.AbsoluteSize;
    local v112 = false;
    if l_AbsolutePosition_0.X < v108 then
        v112 = false;
        if v108 <= l_AbsolutePosition_0.X + l_AbsoluteSize_0.X then
            v112 = false;
            if l_AbsolutePosition_0.Y < v109 then
                v112 = v109 <= l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y;
            end;
        end;
    end;
    return v112;
end;
local function _(v114, v115)
    return ((v114.AbsolutePosition + v114.AbsoluteSize / 2) - v115).magnitude;
end;
local function _()
    v59:ToggleSelect();
    v55[v59]:UpdateEquipView();
    v59 = nil;
end;
local function _()
    if v51 then
        v51:UnequipTools();
        if v59 then
            v59:ToggleSelect();
            v55[v59]:UpdateEquipView();
            v59 = nil;
        end;
    end;
end;
local function _(v119)
    if v51 then
        v51:UnequipTools();
        if v59 then
            v59:ToggleSelect();
            v55[v59]:UpdateEquipView();
            v59 = nil;
        end;
    end;
    if not v119:IsA("HopperBin") then
        v119.Parent = v50;
        return ;
    else
        v119:ToggleSelect();
        v55[v119]:UpdateEquipView();
        v59 = v119;
        return ;
    end;
end;
local function _(v121)
    return v121 and (v121:IsA("HopperBin") and v121.Active or v121.Parent == v50);
end;
local function v123(v124, v125)
    v125 = v125 or #v53 + 1;
    local v126 = {
        Tool = nil, 
        Index = v125, 
        Frame = nil
    };
    local v127 = nil;
    local v128 = nil;
    local v129 = nil;
    local v130 = nil;
    local v131 = nil;
    local v132 = nil;
    local v133 = nil;
    local v134 = nil;
    local v135 = nil;
    local function v137()
        if l_VRService_0.VREnabled then
            local _ = not v2;
        end;
        v127.SelectionImageObject = nil;
        v127.BackgroundTransparency = if not v127.Draggable then v10 else 0;
        v127.BackgroundColor3 = not not v127.Draggable and v8 or v7;
    end;
    v126.Readjust = function(_, v139, v140)
        v127.Position = UDim2.new(0, (v40.Size.X.Offset / 2 - v4 / 2) + (5 + v4) * (v139 - (v140 / 2 + 0.5)), 0, 5);
    end;
    v126.Fill = function(v141, v142)
        if v142 then
            v141.Tool = v142;
            local function v145()
                local l_TextureId_0 = v142.TextureId;
                v129.Image = l_TextureId_0;
                if l_TextureId_0 ~= "" then
                    v130.Visible = false;
                else
                    v130.Visible = true;
                end;
                v32:TranslateAndRegister(v130, v142, v142.Name);
                if not (not v134 or not v142:IsA("Tool")) then
                    v32:TranslateAndRegister(v134, v142, v142.ToolTip);
                    local v144 = v134.TextBounds.X + 6;
                    v134.Size = UDim2.new(0, v144, 0, 16);
                    v134.Position = UDim2.new(0.5, -v144 / 2, 0, -25);
                end;
            end;
            v145();
            if v131 then
                v131:disconnect();
                v131 = nil;
            end;
            v131 = v142.Changed:connect(function(v146)
                if not (v146 ~= "TextureId" and v146 ~= "Name") or v146 == "ToolTip" then
                    v145();
                end;
            end);
            local v147 = v141.Index <= v70;
            local l_Visible_1 = v43.Visible;
            if not (v147 and not l_Visible_1 or l_VRService_0.VREnabled and not v2) then
                v127.Draggable = true;
            end;
            v141:UpdateEquipView();
            if v147 then
                v58 = v58 + 1;
                if not (not (v61 and v58 >= 1) or v36) then
                    v36 = true;
                    l_ContextActionService_0:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
                end;
            end;
            v55[v142] = v141;
            local v149;
            for v150 = 1, v70 do
                local v151 = v53[v150];
                if not v151.Tool then
                    v149 = v151;
                    goto label2 --[[  true, false  ]];
                end;
            end;
            v149 = nil;
            ::label2::;
            v54 = v149;
            return ;
        else
            return v141:Clear();
        end;
    end;
    v126.Clear = function(v152)
        if v152.Tool then
            if v131 then
                v131:disconnect();
                v131 = nil;
            end;
            v129.Image = "";
            v130.Text = "";
            if v134 then
                v134.Text = "";
                v134.Visible = false;
            end;
            v127.Draggable = false;
            v152:UpdateEquipView(true);
            if v152.Index <= v70 then
                v58 = v58 - 1;
                if v58 < 1 then
                    v36 = false;
                    l_ContextActionService_0:UnbindAction("RBXHotbarEquip");
                end;
            end;
            v55[v152.Tool] = nil;
            v152.Tool = nil;
            local v153;
            for v154 = 1, v70 do
                local v155 = v53[v154];
                if not v155.Tool then
                    v153 = v155;
                    goto label3 --[[  true, false  ]];
                end;
            end;
            v153 = nil;
            ::label3::;
            v54 = v153;
            return ;
        else
            return ;
        end;
    end;
    v126.UpdateEquipView = function(v156, v157)
        if not v157 then
            local l_Tool_0 = v156.Tool;
            if l_Tool_0 and (l_Tool_0:IsA("HopperBin") and l_Tool_0.Active or l_Tool_0.Parent == v50) then
                v72 = v126;
                if not v132 then
                    v132 = v79("Frame", "Equipped");
                    v132.ZIndex = v127.ZIndex;
                    for _, v160 in pairs({
                        {
                            0.1, 
                            1, 
                            0, 
                            0
                        }, 
                        {
                            0.8, 
                            0.1, 
                            0.1, 
                            0
                        }, 
                        {
                            0.1, 
                            1, 
                            0.9, 
                            0
                        }, 
                        {
                            0.8, 
                            0.1, 
                            0.1, 
                            0.9
                        }
                    }) do
                        local v161 = v79("Frame", "Edge");
                        v161.BackgroundTransparency = 0;
                        v161.BackgroundColor3 = v9;
                        v161.Size = UDim2.new(v160[1], 0, v160[2], 0);
                        v161.Position = UDim2.new(v160[3], 0, v160[4], 0);
                        v161.ZIndex = v132.ZIndex;
                        v161.Parent = v132;
                    end;
                end;
                v132.Parent = v127;
                goto label4 --[[  true, true  ]];
            end;
        end;
        if v132 then
            v132.Parent = nil;
        end;
        ::label4::;
        v137();
    end;
    v126.IsEquipped = function(v162)
        local l_Tool_1 = v162.Tool;
        return l_Tool_1 and (l_Tool_1:IsA("HopperBin") and l_Tool_1.Active or l_Tool_1.Parent == v50);
    end;
    v126.Delete = function(v164)
        v57[v127] = nil;
        v127:Destroy();
        table.remove(v53, v164.Index);
        for v165 = v164.Index, #v53 do
            v53[v165]:SlideBack();
        end;
        v98();
    end;
    v126.Swap = function(v166, v167)
        local l_Tool_2 = v166.Tool;
        local l_Tool_3 = v167.Tool;
        v166:Clear();
        if l_Tool_3 then
            v167:Clear();
            v166:Fill(l_Tool_3);
        end;
        if not l_Tool_2 then
            v167:Clear();
            return ;
        else
            v167:Fill(l_Tool_2);
            return ;
        end;
    end;
    v126.SlideBack = function(v170)
        v170.Index = v170.Index - 1;
        v127.Name = v170.Index;
        v127.LayoutOrder = v170.Index;
    end;
    v126.TurnNumber = function(_, v172)
        if v135 then
            v135.Visible = v172;
        end;
    end;
    v126.SetClickability = function(v173, v174)
        if v173.Tool then
            if not (l_VRService_0.VREnabled and not v2) then
                v127.Draggable = not v174;
            else
                v127.Draggable = false;
            end;
            v137();
        end;
    end;
    v126.CheckTerms = function(v175, v176)
        local v177 = 0;
        local _ = function(v178, v179)
            local _, v181 = v178:lower():gsub(v179, "");
            v177 = v177 + v181;
        end;
        local l_Tool_4 = v175.Tool;
        if l_Tool_4 then
            for v184 in pairs(v176) do
                local v185, v186 = v130.Text:lower():gsub(v184, "");
                v177 = v177 + v186;
                if l_Tool_4:IsA("Tool") then
                    v185, v186 = (not not v134 and v134.Text or ""):lower():gsub(v184, "");
                    v177 = v177 + v186;
                end;
            end;
        end;
        return v177;
    end;
    v126.Select = function(_, v188)
        if not v188 then
            local l_Tool_5 = v126.Tool;
            if l_Tool_5 then
                if not (l_Tool_5 and (l_Tool_5:IsA("HopperBin") and l_Tool_5.Active or l_Tool_5.Parent == v50)) then
                    if l_Tool_5.Parent == v52 then
                        if v51 then
                            v51:UnequipTools();
                            if v59 then
                                v59:ToggleSelect();
                                v55[v59]:UpdateEquipView();
                                v59 = nil;
                            end;
                        end;
                        if not l_Tool_5:IsA("HopperBin") then
                            l_Tool_5.Parent = v50;
                        else
                            l_Tool_5:ToggleSelect();
                            v55[l_Tool_5]:UpdateEquipView();
                            v59 = l_Tool_5;
                            return ;
                        end;
                    end;
                elseif v51 then
                    v51:UnequipTools();
                    if v59 then
                        v59:ToggleSelect();
                        v55[v59]:UpdateEquipView();
                        v59 = nil;
                        return ;
                    end;
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
    v127 = v79("TextButton", v125);
    v127.BackgroundColor3 = v7;
    v127.BorderColor3 = v11;
    v127.Text = "";
    v127.AutoButtonColor = false;
    v127.BorderSizePixel = 0;
    v127.Size = UDim2.new(0, v4, 0, v4);
    v127.Active = true;
    v127.Draggable = false;
    v127.BackgroundTransparency = v10;
    v127.MouseButton1Click:connect(function()
        changeSlot(v126);
    end);
    v126.Frame = v127;
    local v190 = v79("Frame", "SelectionObjectClipper");
    v190.Visible = false;
    v190.Parent = v127;
    v133 = v79("ImageLabel", "Selector");
    v133.Size = UDim2.new(1, 0, 1, 0);
    v133.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png";
    v133.ScaleType = Enum.ScaleType.Slice;
    v133.SliceCenter = Rect.new(12, 12, 52, 52);
    v133.Parent = v190;
    v129 = v79("ImageLabel", "Icon");
    v129.Size = UDim2.new(0.8, 0, 0.8, 0);
    v129.Position = UDim2.new(0.1, 0, 0.1, 0);
    v129.Parent = v127;
    v130 = v79("TextLabel", "ToolName");
    v130.Size = UDim2.new(1, -2, 1, -2);
    v130.Position = UDim2.new(0, 1, 0, 1);
    v130.Parent = v127;
    v126.Frame.LayoutOrder = v126.Index;
    if v125 <= v70 then
        v134 = v79("TextLabel", "ToolTip");
        v134.TextWrapped = false;
        v134.TextYAlignment = Enum.TextYAlignment.Top;
        v134.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4);
        v134.BackgroundTransparency = 0;
        v134.Visible = false;
        v134.Parent = v127;
        v127.MouseEnter:connect(function()
            if v134.Text ~= "" then
                v134.Visible = true;
            end;
        end);
        v127.MouseLeave:connect(function()
            v134.Visible = false;
        end);
        v126.MoveToInventory = function(v191)
            if v126.Index <= v70 then
                local l_Tool_6 = v126.Tool;
                v191:Clear();
                local v193 = v123(v46);
                v193:Fill(l_Tool_6);
                if not (not (l_Tool_6 and (l_Tool_6:IsA("HopperBin") and l_Tool_6.Active or l_Tool_6.Parent == v50)) or not v51) then
                    v51:UnequipTools();
                    if v59 then
                        v59:ToggleSelect();
                        v55[v59]:UpdateEquipView();
                        v59 = nil;
                    end;
                end;
                if v63 then
                    v193.Frame.Visible = false;
                    v193.Parent = v43;
                end;
            end;
        end;
        if not (v125 >= 10) or v125 == v70 then
            v190 = v125 < 10 and v125 or 0;
            v135 = v79("TextLabel", "Number");
            v135.Text = v190;
            v135.Size = UDim2.new(0.15, 0, 0.15, 0);
            v135.Visible = false;
            v135.Parent = v127;
            v56[l_Value_1 + v190] = function(v194)
                v126:Select(v194);
            end;
        end;
    end;
    v190 = v127.Position;
    local v195 = 0;
    local v196 = nil;
    do
        local l_v190_0, l_v195_0, l_v196_0 = v190, v195, v196;
        v127.DragBegin:connect(function(v200)
            if not (l_VRService_0.VREnabled and not v2) then
                v57[v127] = true;
                l_v190_0 = v200;
                v127.BorderSizePixel = 2;
                v127.ZIndex = 2;
                v129.ZIndex = 2;
                v130.ZIndex = 2;
                v127.Parent.ZIndex = 2;
                if v135 then
                    v135.ZIndex = 2;
                end;
                if v132 then
                    v132.ZIndex = 2;
                    for _, v202 in pairs(v132:GetChildren()) do
                        v202.ZIndex = 2;
                    end;
                end;
                l_v196_0 = v127.Parent;
                if l_v196_0 == v46 then
                    local _ = v127.AbsolutePosition;
                    local v204 = UDim2.new(0, v127.AbsolutePosition.X - v43.AbsolutePosition.X, 0, v127.AbsolutePosition.Y - v43.AbsolutePosition.Y);
                    v127.Parent = v43;
                    v127.Position = v204;
                    v128 = v79("Frame", "FakeSlot");
                    v128.LayoutOrder = v127.LayoutOrder;
                    v128.Size = v127.Size;
                    v128.BackgroundTransparency = 1;
                    v128.Parent = v46;
                end;
                return ;
            else
                return ;
            end;
        end);
        v127.DragStopped:connect(function(v205, v206)
            if v128 then
                v128:Destroy();
            end;
            if not (l_VRService_0.VREnabled and not v2) then
                local v207 = tick();
                v127.Position = l_v190_0;
                v127.Parent = l_v196_0;
                v127.BorderSizePixel = 0;
                v127.ZIndex = 1;
                v129.ZIndex = 1;
                v130.ZIndex = 1;
                l_v196_0.ZIndex = 1;
                if v135 then
                    v135.ZIndex = 1;
                end;
                if v132 then
                    v132.ZIndex = 1;
                    for _, v209 in pairs(v132:GetChildren()) do
                        v209.ZIndex = 1;
                    end;
                end;
                v57[v127] = nil;
                if v126.Tool then
                    local l_v43_0 = v43;
                    local l_AbsolutePosition_2 = l_v43_0.AbsolutePosition;
                    local l_AbsoluteSize_1 = l_v43_0.AbsoluteSize;
                    local v213 = false;
                    if l_AbsolutePosition_2.X < v205 then
                        v213 = false;
                        if v205 <= l_AbsolutePosition_2.X + l_AbsoluteSize_1.X then
                            v213 = false;
                            if l_AbsolutePosition_2.Y < v206 then
                                v213 = v206 <= l_AbsolutePosition_2.Y + l_AbsoluteSize_1.Y;
                            end;
                        end;
                    end;
                    if not v213 then
                        l_v43_0 = v40;
                        l_AbsolutePosition_2 = l_v43_0.AbsolutePosition;
                        l_AbsoluteSize_1 = l_v43_0.AbsoluteSize;
                        v213 = false;
                        if l_AbsolutePosition_2.X < v205 then
                            v213 = false;
                            if v205 <= l_AbsolutePosition_2.X + l_AbsoluteSize_1.X then
                                v213 = false;
                                if l_AbsolutePosition_2.Y < v206 then
                                    v213 = v206 <= l_AbsolutePosition_2.Y + l_AbsoluteSize_1.Y;
                                end;
                            end;
                        end;
                        if not v213 then
                            if v126.Index <= v70 then
                                v126:MoveToInventory();
                            end;
                        else
                            v213 = {
                                math.huge, 
                                nil
                            };
                            for v214 = 1, v70 do
                                local v215 = v53[v214];
                                local l_Frame_0 = v215.Frame;
                                local l_magnitude_0 = ((l_Frame_0.AbsolutePosition + l_Frame_0.AbsoluteSize / 2) - Vector2.new(v205, v206)).magnitude;
                                if l_magnitude_0 < v213[1] then
                                    v213 = {
                                        l_magnitude_0, 
                                        v215
                                    };
                                end;
                            end;
                            l_v43_0 = v213[2];
                            if l_v43_0 ~= v126 then
                                v126:Swap(l_v43_0);
                                if v70 < v126.Index then
                                    l_AbsolutePosition_2 = v126.Tool;
                                    if l_AbsolutePosition_2 then
                                        if not (not (l_AbsolutePosition_2 and (l_AbsolutePosition_2:IsA("HopperBin") and l_AbsolutePosition_2.Active or l_AbsolutePosition_2.Parent == v50)) or not v51) then
                                            v51:UnequipTools();
                                            if v59 then
                                                v59:ToggleSelect();
                                                v55[v59]:UpdateEquipView();
                                                v59 = nil;
                                            end;
                                        end;
                                        if v63 then
                                            v126.Frame.Visible = false;
                                            v126.Frame.Parent = v43;
                                        end;
                                    else
                                        v126:Delete();
                                    end;
                                end;
                            end;
                        end;
                    else
                        if v126.Index <= v70 then
                            v126:MoveToInventory();
                        end;
                        if v70 < v126.Index and v207 - l_v195_0 < 0.5 then
                            if v54 then
                                v213 = v126.Tool;
                                v126:Clear();
                                v54:Fill(v213);
                                v126:Delete();
                            end;
                            v207 = 0;
                        end;
                    end;
                    l_v195_0 = v207;
                    return ;
                else
                    return ;
                end;
            else
                v126:Select(false);
                return ;
            end;
        end);
    end;
    v127.Parent = v124;
    v53[v125] = v126;
    if v70 < v125 then
        v98();
        if not (not v43.Visible or v63) then
            v45.CanvasPosition = Vector2.new(0, (math.max(0, v45.CanvasSize.Y.Offset - v45.AbsoluteSize.Y)));
        end;
    end;
    return v126;
end;
local function v230(v218)
    if v70 ~= v218 then
        local l_v70_0 = v70;
        if v218 < l_v70_0 then
            for v220 = l_v70_0, v218 + 1, -1 do
                local v221 = v53[v220];
                if v221 then
                    v221:MoveToInventory();
                    v221:Delete();
                end;
            end;
            for v222 = l_v70_0, v218 + 1, -1 do
                local v223 = v53[v222];
                if not v223.Tool then
                    v223:Delete();
                end;
            end;
        else
            for v224 = l_v70_0, v218 do
                v70 = v224;
                if not v53[v224] then
                    local v225 = v123(v40, v224);
                    v225.Frame.Visible = false;
                    if not v54 then
                        v54 = v225;
                    end;
                else
                    local _ = v53[v224];
                    local l_Tool_7 = v53[v224].Tool;
                    local v228 = v123(v40, v224);
                    if not l_Tool_7 then
                        if not v54 then
                            v54 = v228;
                        end;
                    else
                        v228:Fill(l_Tool_7);
                    end;
                end;
            end;
        end;
        v70 = v218;
        v58 = 0;
        for v229 = 1, v70 do
            if not (not v53[v229] or not v53[v229].Tool) then
                v58 = v58 + 1;
            end;
        end;
        v102();
    end;
end;
local function v240(v231)
    if v231:IsA("Tool") or v231:IsA("HopperBin") then
        if v231.Parent == v50 then
            v67 = tick();
        end;
        if v59 and v231.Parent == v50 then
            v59:ToggleSelect();
            v55[v59]:UpdateEquipView();
            v59 = nil;
        end;
        if not (not (not v60 and v231.Parent == v50) or v55[v231]) then
            local l_StarterGear_0 = l_LocalPlayer_0:FindFirstChild("StarterGear");
            if not (not l_StarterGear_0 or not l_StarterGear_0:FindFirstChild(v231.Name)) then
                v60 = true;
                local v233 = v54 or v123(v46);
                for v234 = v233.Index, 1, -1 do
                    local v235 = v53[v234];
                    local v236 = v234 - 1;
                    if v236 > 0 then
                        v53[v236]:Swap(v235);
                    else
                        v235:Fill(v231);
                    end;
                end;
                for _, v238 in pairs(v50:GetChildren()) do
                    if v238:IsA("Tool") and v238 ~= v231 then
                        v238.Parent = v52;
                    end;
                end;
                v97();
                return ;
            end;
        end;
        local v239 = v55[v231];
        if not v239 then
            v239 = v54 or v123(v46);
            v239:Fill(v231);
            if not (not (v239.Index <= v70) or v43.Visible) then
                v97();
            end;
            if not (not v231:IsA("HopperBin") or not v231.Active) then
                if v51 then
                    v51:UnequipTools();
                    if v59 then
                        v59:ToggleSelect();
                        v55[v59]:UpdateEquipView();
                        v59 = nil;
                    end;
                end;
                v59 = v231;
            end;
        else
            v239:UpdateEquipView();
        end;
        v3.BackpackItemAdded:Fire();
        return ;
    else
        if v231:IsA("Humanoid") and v231.Parent == v50 then
            v51 = v231;
        end;
        return ;
    end;
end;
local function v247(v241)
    if v241:IsA("Tool") or v241:IsA("HopperBin") then
        v67 = tick();
        local l_Parent_0 = v241.Parent;
        if not (l_Parent_0 ~= v50) or l_Parent_0 == v52 then
            return ;
        else
            local v243 = v55[v241];
            if v243 then
                v243:Clear();
                if v70 < v243.Index then
                    v243:Delete();
                elseif not v43.Visible then
                    v97();
                end;
            end;
            if v241 == v59 then
                v59 = nil;
            end;
            v3.BackpackItemRemoved:Fire();
            local v244;
            for v245 = v70 + 1, #v53 do
                local v246 = v53[v245];
                if not (not v246 or not v246.Tool) then
                    v244 = false;
                    goto label5 --[[  true, false  ]];
                end;
            end;
            v244 = true;
            ::label5::;
            if v244 then
                v3.BackpackEmpty:Fire();
            end;
            return ;
        end;
    else
        return ;
    end;
end;
local function v257(v248)
    for v249 = #v53, 1, -1 do
        local v250 = v53[v249];
        if v250.Tool then
            v250:Clear();
        end;
        if v70 < v249 then
            v250:Delete();
        end;
    end;
    v59 = nil;
    for _, v252 in pairs(v65) do
        v252:disconnect();
    end;
    v65 = {};
    v50 = v248;
    table.insert(v65, v248.ChildRemoved:connect(v247));
    table.insert(v65, v248.ChildAdded:connect(v240));
    for _, v254 in pairs(v248:GetChildren()) do
        v240(v254);
    end;
    v52 = l_LocalPlayer_0:WaitForChild("Backpack");
    table.insert(v65, v52.ChildRemoved:connect(v247));
    table.insert(v65, v52.ChildAdded:connect(v240));
    for _, v256 in pairs(v52:GetChildren()) do
        v240(v256);
    end;
    v97();
end;
local function v262(v258, v259)
    if not (not (v258.UserInputType == Enum.UserInputType.Keyboard) or v62) and (v61 or v258.KeyCode.Value == l_Value_2) then
        local v260 = v56[v258.KeyCode.Value];
        if v260 then
            v260(v259);
        end;
    end;
    local l_UserInputType_0 = v258.UserInputType;
    if not (not (not v259 and (not (l_UserInputType_0 ~= Enum.UserInputType.MouseButton1) or l_UserInputType_0 == Enum.UserInputType.Touch)) or not v43.Visible) then
        v3.OpenClose();
    end;
end;
local function v266(v263)
    if not (v263 ~= "KeyboardEnabled") or v263 == "VREnabled" then
        local v264 = l_UserInputService_0.KeyboardEnabled and not l_VRService_0.VREnabled;
        for v265 = 1, v70 do
            v53[v265]:TurnNumber(v264);
        end;
    end;
end;
local v267 = nil;
local v268 = nil;
local function v269()
end;
local v270 = Vector2.new(0, 0);
unbindAllGamepadEquipActions = function()
    l_ContextActionService_0:UnbindAction("RBXBackpackHasGamepadFocus");
    l_ContextActionService_0:UnbindAction("RBXCloseInventory");
end;
local function _(v271, v272)
    for v273 = 1, v70 do
        local v274 = v53[v273];
        if not ((not v274 or not v274.Frame) or not v272 and not v274.Tool) then
            v274.Frame.Visible = v271;
        end;
    end;
end;
local function v279(v276)
    local v277 = 1;
    if v276.UserInputState == Enum.UserInputState.End then
        v277 = -1;
    end;
    if v276.KeyCode == Enum.KeyCode.Thumbstick1 then
        local l_magnitude_1 = v276.Position.magnitude;
        if l_magnitude_1 > 0.98 then
            v270 = Vector2.new(v276.Position.x / l_magnitude_1, -v276.Position.y / l_magnitude_1);
        else
            v270 = Vector2.new(0, 0);
        end;
    elseif v276.KeyCode == Enum.KeyCode.DPadLeft then
        v270 = Vector2.new(v270.x - 1 * v277, v270.y);
    elseif v276.KeyCode == Enum.KeyCode.DPadRight then
        v270 = Vector2.new(v270.x + 1 * v277, v270.y);
    elseif v276.KeyCode == Enum.KeyCode.DPadUp then
        v270 = Vector2.new(v270.x, v270.y - 1 * v277);
    elseif v276.KeyCode == Enum.KeyCode.DPadDown then
        v270 = Vector2.new(v270.x, v270.y + 1 * v277);
    else
        v270 = Vector2.new(0, 0);
    end;
    return v270;
end;
local _ = function(_, _, v282)
    local v283 = v279(v282);
    if v283 == Vector2.new(0, 0) then
        return ;
    else
        local v284 = math.atan2(v283.y, v283.x) - -1.5707963267948966;
        if v284 < 0 then
            v284 = v284 + 6.283185307179586;
        end;
        local v285 = math.floor((v284 / 0.7853981633974483 + 1) + 0.5);
        if v70 < v285 then
            v285 = 1;
        end;
        if v285 > 0 then
            local v286 = v53[v285];
            if not ((not v286 or not v286.Tool) or v286:IsEquipped()) then
                v286:Select();
                return ;
            end;
        elseif v51 then
            v51:UnequipTools();
            if v59 then
                v59:ToggleSelect();
                v55[v59]:UpdateEquipView();
                v59 = nil;
            end;
        end;
        return ;
    end;
end;
changeToolFunc = function(_, v289, v290)
    if v289 ~= Enum.UserInputState.Begin then
        return ;
    elseif (v267 and (not (not (v267.KeyCode == Enum.KeyCode.ButtonR1) or v290.KeyCode ~= Enum.KeyCode.ButtonL1) or v267.KeyCode == Enum.KeyCode.ButtonL1 and v290.KeyCode == Enum.KeyCode.ButtonR1)) and tick() - v268 <= 0.06 then
        if v51 then
            v51:UnequipTools();
            if v59 then
                v59:ToggleSelect();
                v55[v59]:UpdateEquipView();
                v59 = nil;
            end;
        end;
        v267 = v290;
        v268 = tick();
        return ;
    else
        v267 = v290;
        v268 = tick();
        delay(0.06, function()
            if v267 ~= v290 then
                return ;
            else
                local v291 = 0;
                v291 = v290.KeyCode == Enum.KeyCode.ButtonL1 and -1 or 1;
                for v292 = 1, v70 do
                    if v53[v292]:IsEquipped() then
                        local v293 = v291 + v292;
                        local v294 = false;
                        if v70 < v293 then
                            v293 = 1;
                            v294 = true;
                        elseif v293 < 1 then
                            v293 = v70;
                            v294 = true;
                        end;
                        local l_v293_0 = v293;
                        while true do
                            if v53[v293].Tool then
                                if not v294 then
                                    v53[v293]:Select();
                                    return ;
                                else
                                    if v51 then
                                        v51:UnequipTools();
                                        if v59 then
                                            v59:ToggleSelect();
                                            v55[v59]:UpdateEquipView();
                                            v59 = nil;
                                        end;
                                    end;
                                    v72 = nil;
                                    return ;
                                end;
                            else
                                v293 = v293 + v291;
                                if v293 == l_v293_0 then
                                    return ;
                                elseif v70 < v293 then
                                    v293 = 1;
                                    v294 = true;
                                elseif v293 < 1 then
                                    v293 = v70;
                                    v294 = true;
                                end;
                            end;
                        end;
                    end;
                end;
                if not v72 or not v72.Tool then
                    local v296 = v291 == -1 and v70 or 1;
                    local v297 = v291 == -1 and 1 or v70;
                    for v298 = v296, v297, v291 do
                        if v53[v298].Tool then
                            v53[v298]:Select();
                            return ;
                        end;
                    end;
                    return ;
                else
                    v72:Select();
                    return ;
                end;
            end;
        end);
        return ;
    end;
end;
getGamepadSwapSlot = function()
    for v299 = 1, #v53 do
        if v53[v299].Frame.BorderSizePixel > 0 then
            return v53[v299];
        end;
    end;
end;
changeSlot = function(v300)
    local v301 = not (l_VRService_0.VREnabled and not v2) or v43.Visible;
    local l_GamepadCursorEnabled_0 = l_GamepadService_0.GamepadCursorEnabled;
    if (not (v300.Frame == l_GuiService_0.SelectedCoreObject) or not v301) or l_GamepadCursorEnabled_0 then
        v300:Select();
        v44.SelectionImageObject.Visible = false;
    else
        local v303 = getGamepadSwapSlot();
        if not v303 then
            local l_Size_0 = v300.Frame.Size;
            local l_Position_0 = v300.Frame.Position;
            v300.Frame:TweenSizeAndPosition(l_Size_0 + UDim2.new(0, 10, 0, 10), l_Position_0 - UDim2.new(0, 5, 0, 5), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, function()
                v300.Frame:TweenSizeAndPosition(l_Size_0, l_Position_0, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true);
            end);
            v300.Frame.BorderSizePixel = 3;
            v44.SelectionImageObject.Visible = true;
            return ;
        else
            v303.Frame.BorderSizePixel = 0;
            if v303 ~= v300 then
                v300:Swap(v303);
                v44.SelectionImageObject.Visible = false;
                if not (not (v70 < v300.Index) or v300.Tool) then
                    if l_GuiService_0.SelectedCoreObject == v300.Frame then
                        l_GuiService_0.SelectedCoreObject = v303.Frame;
                    end;
                    v300:Delete();
                end;
                if not (not (v70 < v303.Index) or v303.Tool) then
                    if l_GuiService_0.SelectedCoreObject == v303.Frame then
                        l_GuiService_0.SelectedCoreObject = v300.Frame;
                    end;
                    v303:Delete();
                    return ;
                end;
            end;
        end;
    end;
end;
vrMoveSlotToInventory = function()
    if l_VRService_0.VREnabled and not v2 then
        local v306 = getGamepadSwapSlot();
        if not (not v306 or not v306.Tool) then
            v306.Frame.BorderSizePixel = 0;
            v306:MoveToInventory();
            v44.SelectionImageObject.Visible = false;
        end;
        return ;
    else
        return ;
    end;
end;
enableGamepadInventoryControl = function()
    local function v311(_, v308, _)
        if v308 ~= Enum.UserInputState.Begin then
            return ;
        else
            if not getGamepadSwapSlot() then
                if v43.Visible then
                    v3.OpenClose();
                end;
            else
                local v310 = getGamepadSwapSlot();
                if v310 then
                    v310.Frame.BorderSizePixel = 0;
                    return ;
                end;
            end;
            return ;
        end;
    end;
    l_ContextActionService_0:BindAction("RBXBackpackHasGamepadFocus", v269, false, Enum.UserInputType.Gamepad1);
    l_ContextActionService_0:BindAction("RBXCloseInventory", v311, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart);
    if not false then
        l_GuiService_0.SelectedCoreObject = v40:FindFirstChild("1");
    end;
end;
disableGamepadInventoryControl = function()
    unbindAllGamepadEquipActions();
    for v312 = 1, v70 do
        local v313 = v53[v312];
        if not (not v313 or not v313.Frame) then
            v313.Frame.BorderSizePixel = 0;
        end;
    end;
    if not (not l_GuiService_0.SelectedCoreObject or not l_GuiService_0.SelectedCoreObject:IsDescendantOf(v39)) then
        l_GuiService_0.SelectedCoreObject = nil;
    end;
end;
local function _()
    if not (not v61 or v36) then
        v36 = true;
        l_ContextActionService_0:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
    end;
end;
local function _()
    disableGamepadInventoryControl();
    v36 = false;
    l_ContextActionService_0:UnbindAction("RBXHotbarEquip");
end;
gamepadDisconnected = function()
    if not l_VRService_0.VREnabled then
        v66 = false;
        disableGamepadInventoryControl();
    end;
end;
gamepadConnected = function()
    if not l_VRService_0.VREnabled then
        v66 = true;
        l_GuiService_0:AddSelectionParent("RBXBackpackSelection", v39);
        if not ((not (v58 >= 1) or not v61) or v36) then
            v36 = true;
            l_ContextActionService_0:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
        end;
        if v43.Visible then
            enableGamepadInventoryControl();
        end;
    end;
end;
local function v320(v316, v317)
    if not (v316 ~= Enum.CoreGuiType.Backpack) or v316 == Enum.CoreGuiType.All then
        v317 = v317 and v35;
        v61 = v317;
        v39.Visible = v317;
        for _, v319 in pairs(v64) do
            if not v317 then
                l_GuiService_0:RemoveKey(v319);
            else
                l_GuiService_0:AddKey(v319);
            end;
        end;
        if not v317 then
            disableGamepadInventoryControl();
            v36 = false;
            l_ContextActionService_0:UnbindAction("RBXHotbarEquip");
        elseif not ((not (v58 >= 1) or not v61) or v36) then
            v36 = true;
            l_ContextActionService_0:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
            return ;
        end;
    end;
end;
local function v326(v321, v322)
    local v323 = v79("ImageButton", v321);
    v323.Size = UDim2.new(0, 40, 0, 40);
    v323.Image = "rbxasset://textures/ui/Keyboard/close_button_background.png";
    local v324 = v79("ImageLabel", "Icon");
    v324.Size = UDim2.new(0.5, 0, 0.5, 0);
    v324.Position = UDim2.new(0.25, 0, 0.25, 0);
    v324.Image = v322;
    v324.Parent = v323;
    local v325 = v79("ImageLabel", "Selection");
    v325.Size = UDim2.new(0.9, 0, 0.9, 0);
    v325.Position = UDim2.new(0.05, 0, 0.05, 0);
    v325.Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png";
    v323.SelectionImageObject = v325;
    return v323, v324, v325;
end;
v39 = v79("Frame", "Backpack");
v39.Visible = false;
v39.Parent = l_RobloxGui_1;
v40 = v79("Frame", "Hotbar");
v40.Parent = v39;
for v327 = 1, v70 do
    local v328 = v123(v40, v327);
    v328.Frame.Visible = false;
    if not v54 then
        v54 = v328;
    end;
end;
v41 = v79("ImageButton", "OpenInventory");
v41.Size = UDim2.new(0, 30, 0, 30);
v41.Image = "rbxasset://textures/ui/Backpack/ScrollUpArrow.png";
v41.MouseButton1Click:connect(function()
    v3.OpenClose();
end);
v41.SelectionGained:connect(function()
    v41.ImageColor3 = v14;
end);
v41.SelectionLost:connect(function()
    v41.ImageColor3 = Color3.new(1, 1, 1);
end);
local v329 = v79("Frame", "Selection");
v329.Visible = false;
v41.SelectionImageObject = v329;
v42 = v326("CloseInventory", "rbxasset://textures/ui/Keyboard/close_button_icon.png");
v42.Position = UDim2.new(0, 0, 0, -50);
v42.MouseButton1Click:connect(function()
    if v43.Visible then
        v3.OpenClose();
    end;
end);
LeftBumperButton = v79("ImageLabel", "LeftBumper");
LeftBumperButton.Size = UDim2.new(0, 40, 0, 40);
LeftBumperButton.Position = UDim2.new(0, -LeftBumperButton.Size.X.Offset, 0.5, -LeftBumperButton.Size.Y.Offset / 2);
RightBumperButton = v79("ImageLabel", "RightBumper");
RightBumperButton.Size = UDim2.new(0, 40, 0, 40);
RightBumperButton.Position = UDim2.new(1, 0, 0.5, -RightBumperButton.Size.Y.Offset / 2);
v43 = v79("Frame", "Inventory");
v43.BackgroundTransparency = v6;
v43.BackgroundColor3 = v7;
v43.Active = true;
v43.Visible = false;
v43.Parent = v39;
v44 = v79("TextButton", "VRInventorySelector");
v44.Position = UDim2.new(0, 0, 0, 0);
v44.Size = UDim2.new(1, 0, 1, 0);
v44.BackgroundTransparency = 1;
v44.Text = "";
v44.Parent = v43;
v329 = v79("ImageLabel", "Selector");
v329.Size = UDim2.new(1, 0, 1, 0);
v329.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png";
v329.ScaleType = Enum.ScaleType.Slice;
v329.SliceCenter = Rect.new(12, 12, 52, 52);
v329.Visible = false;
v44.SelectionImageObject = v329;
v44.MouseButton1Click:connect(function()
    vrMoveSlotToInventory();
end);
v45 = v79("ScrollingFrame", "ScrollingFrame");
v45.Selectable = false;
v45.CanvasSize = UDim2.new(0, 0, 0, 0);
v45.Parent = v43;
v46 = v79("Frame", "UIGridFrame");
v46.Selectable = false;
v46.Size = UDim2.new(1, -10, 1, 0);
v46.Position = UDim2.new(0, 5, 0, 0);
v46.Parent = v45;
v47 = Instance.new("UIGridLayout");
v47.SortOrder = Enum.SortOrder.LayoutOrder;
v47.CellSize = UDim2.new(0, v4, 0, v4);
v47.CellPadding = UDim2.new(0, 5, 0, 5);
v47.Parent = v46;
v48 = v326("ScrollUpButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png");
v48.Size = UDim2.new(0, 34, 0, 34);
v48.Position = UDim2.new(0.5, -v48.Size.X.Offset / 2, 0, 43);
v48.Icon.Position = v48.Icon.Position - UDim2.new(0, 0, 0, 2);
v48.MouseButton1Click:connect(function()
    v45.CanvasPosition = Vector2.new(v45.CanvasPosition.X, (math.min(v45.CanvasSize.Y.Offset - v45.AbsoluteWindowSize.Y, (math.max(0, v45.CanvasPosition.Y - (5 + v4))))));
end);
v49 = v326("ScrollDownButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png");
v49.Rotation = 180;
v49.Icon.Position = v49.Icon.Position - UDim2.new(0, 0, 0, 2);
v49.Size = UDim2.new(0, 34, 0, 34);
v49.Position = UDim2.new(0.5, -v49.Size.X.Offset / 2, 1, -v49.Size.Y.Offset - 3);
v49.MouseButton1Click:connect(function()
    v45.CanvasPosition = Vector2.new(v45.CanvasPosition.X, (math.min(v45.CanvasSize.Y.Offset - v45.AbsoluteWindowSize.Y, (math.max(0, v45.CanvasPosition.Y + (5 + v4))))));
end);
v45.Changed:connect(function(v330)
    if not (v330 ~= "AbsoluteWindowSize" and v330 ~= "CanvasPosition") or v330 == "CanvasSize" then
        local v331 = v45.CanvasPosition.Y ~= 0;
        local v332 = v45.CanvasPosition.Y < v45.CanvasSize.Y.Offset - v45.AbsoluteWindowSize.Y;
        v48.Visible = v331;
        v49.Visible = v332;
    end;
end);
v102();
local v333 = v31:Create("Frame")({
    Name = "GamepadHintsFrame", 
    Size = UDim2.new(0, v40.Size.X.Offset, 0, not v30 and 60 or 95), 
    BackgroundTransparency = 1, 
    Visible = false, 
    Parent = v39
});
local function v340(v334, v335, v336)
    local v337 = v31:Create("Frame")({
        Name = "HintFrame", 
        Size = UDim2.new(1, 0, 1, -5), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        Parent = v333
    });
    local _ = v31:Create("ImageLabel")({
        Name = "HintImage", 
        Size = not not v30 and UDim2.new(0, 90, 0, 90) or UDim2.new(0, 60, 0, 60), 
        BackgroundTransparency = 1, 
        Image = not not v30 and v335 or v334, 
        Parent = v337
    });
    local v339 = v31:Create("TextLabel")({
        Name = "HintText", 
        Position = UDim2.new(0, not v30 and 70 or 100, 0, 0), 
        Size = UDim2.new(1, -(not v30 and 70 or 100), 1, 0), 
        Font = Enum.Font.SourceSansBold, 
        FontSize = not not v30 and Enum.FontSize.Size36 or Enum.FontSize.Size24, 
        BackgroundTransparency = 1, 
        Text = v336, 
        TextColor3 = Color3.new(1, 1, 1), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextWrapped = true, 
        Parent = v337
    });
    Instance.new("UITextSizeConstraint", v339).MaxTextSize = v339.TextSize;
end;
local function v346()
    v333.Size = UDim2.new(v40.Size.X.Scale, v40.Size.X.Offset, 0, not v30 and 60 or 95);
    v333.Position = UDim2.new(v40.Position.X.Scale, v40.Position.X.Offset, v43.Position.Y.Scale, v43.Position.Y.Offset - v333.Size.Y.Offset);
    local v341 = 0;
    local l_v333_Children_0 = v333:GetChildren();
    for v343 = 1, #l_v333_Children_0 do
        l_v333_Children_0[v343].Size = UDim2.new(1, 0, 1, -5);
        l_v333_Children_0[v343].Position = UDim2.new(0, 0, 0, 0);
        v341 = v341 + (l_v333_Children_0[v343].HintText.Position.X.Offset + l_v333_Children_0[v343].HintText.TextBounds.X);
    end;
    local v344 = (v333.AbsoluteSize.X - v341) / (#l_v333_Children_0 - 1);
    for v345 = 1, #l_v333_Children_0 do
        l_v333_Children_0[v345].Position = v345 == 1 and UDim2.new(0, 0, 0, 0) or UDim2.new(0, (l_v333_Children_0[v345 - 1].Position.X.Offset + l_v333_Children_0[v345 - 1].Size.X.Offset) + v344, 0, 0);
        l_v333_Children_0[v345].Size = UDim2.new(0, l_v333_Children_0[v345].HintText.Position.X.Offset + l_v333_Children_0[v345].HintText.TextBounds.X, 1, -5);
    end;
end;
v340("rbxasset://textures/ui/Controls/DesignSystem/ButtonX.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonX@2x.png", "Remove From Hotbar");
v340("rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonA@2x.png", "Select/Swap");
v340("rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonB@2x.png", "Close Backpack");
local v347 = v79("Frame", "Search");
v347.BackgroundColor3 = v16;
v347.BackgroundTransparency = v17;
v347.Size = UDim2.new(0, 190, 0, 30);
v347.Position = UDim2.new(1, -v347.Size.X.Offset - 5, 0, 5);
v347.Parent = v43;
local v348 = v79("TextBox", "TextBox");
v348.Text = v15;
v348.ClearTextOnFocus = false;
v348.FontSize = Enum.FontSize.Size24;
v348.TextXAlignment = Enum.TextXAlignment.Left;
v348.Size = v347.Size - UDim2.new(0, 0, 0, 0);
v348.Position = UDim2.new(0, 0, 0, 0);
v348.Parent = v347;
local v349 = v79("TextButton", "X");
v349.Text = "x";
v349.TextColor3 = v9;
v349.FontSize = Enum.FontSize.Size24;
v349.TextYAlignment = Enum.TextYAlignment.Bottom;
v349.BackgroundColor3 = v16;
v349.BackgroundTransparency = 0;
v349.Size = UDim2.new(0, v347.Size.Y.Offset - 10, 0, v347.Size.Y.Offset - 10);
v349.Position = UDim2.new(1, -v349.Size.X.Offset - 10, 0.5, -v349.Size.Y.Offset / 2);
v349.ZIndex = 0;
v349.Visible = false;
v349.BorderSizePixel = 0;
v349.Parent = v347;
local l_v348_0 = v348 --[[ copy: 113 -> 121 ]];
local l_v349_0 = v349 --[[ copy: 114 -> 122 ]];
local function v363()
    local v352 = {};
    for v353 in l_v348_0.Text:gmatch("%S+") do
        v352[v353:lower()] = true;
    end;
    local v354 = {};
    for v355 = v70 + 1, #v53 do
        local v356 = v53[v355];
        table.insert(v354, {
            v356, 
            (v356:CheckTerms(v352))
        });
        v356.Frame.Visible = false;
        v356.Frame.Parent = v43;
    end;
    table.sort(v354, function(v357, v358)
        return v358[2] < v357[2];
    end);
    v63 = true;
    local v359 = 0;
    for _, v361 in ipairs(v354) do
        local v362 = v361[1];
        if v361[2] > 0 then
            v362.Frame.Visible = true;
            v362.Frame.Parent = v46;
            v362.Frame.LayoutOrder = v70 + v359;
            v359 = v359 + 1;
        end;
    end;
    v45.CanvasPosition = Vector2.new(0, 0);
    v98();
    l_v349_0.ZIndex = 3;
end;
local function v366()
    if l_v349_0.ZIndex > 0 then
        v63 = false;
        for v364 = v70 + 1, #v53 do
            local v365 = v53[v364];
            v365.Frame.LayoutOrder = v365.Index;
            v365.Frame.Parent = v46;
            v365.Frame.Visible = true;
        end;
        l_v349_0.ZIndex = 0;
    end;
    v98();
end;
local l_v366_0 = v366 --[[ copy: 116 -> 123 ]];
local function v368()
    l_v366_0();
    l_v348_0.Text = v15;
end;
local l_v363_0 = v363 --[[ copy: 115 -> 124 ]];
local function v374(v370)
    if v370 == "Text" then
        local l_Text_0 = l_v348_0.Text;
        if l_Text_0 == "" then
            l_v366_0();
        elseif l_Text_0 ~= v15 then
            l_v363_0();
        end;
        local l_l_v349_0_0 = l_v349_0;
        local v373 = false;
        if l_Text_0 ~= "" then
            v373 = l_Text_0 ~= v15;
        end;
        l_l_v349_0_0.Visible = v373;
    end;
end;
local function v375()
    if l_v348_0.Text == v15 then
        l_v348_0.Text = "";
    end;
end;
local function v377(v376)
    if not v376 then
        if l_v348_0.Text == "" then
            l_v348_0.Text = v15;
        end;
        return ;
    else
        l_v363_0();
        return ;
    end;
end;
v348.Focused:connect(v375);
v349.MouseButton1Click:connect(v368);
v348.Changed:connect(v374);
v348.FocusLost:connect(v377);
v3.StateChanged.Event:connect(function(v378)
    l_v349_0.Modal = v378;
    if not v378 then
        l_v366_0();
        l_v348_0.Text = v15;
    end;
end);
v56[Enum.KeyCode.Escape.Value] = function(v379)
    if not v379 then
        if v43.Visible then
            v3.OpenClose();
        end;
        return ;
    else
        l_v366_0();
        l_v348_0.Text = v15;
        return ;
    end;
end;
l_UserInputService_0.LastInputTypeChanged:connect(function(v380)
    if not (v380 == Enum.UserInputType.Gamepad1) or l_VRService_0.VREnabled then
        v347.Visible = true;
        return ;
    else
        v347.Visible = false;
        return ;
    end;
end);
v348 = function(_, v382, _)
    if v382 ~= Enum.UserInputState.Begin then
        return ;
    elseif l_GuiService_0.SelectedCoreObject then
        for v384 = 1, v70 do
            if not (not (v53[v384].Frame == l_GuiService_0.SelectedCoreObject) or not v53[v384].Tool) then
                v53[v384]:MoveToInventory();
                return ;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
local l_v348_1 = v348 --[[ copy: 113 -> 125 ]];
v349 = function()
    if not next(v57) then
        v43.Visible = not v43.Visible;
        local l_Visible_2 = v43.Visible;
        v97();
        v40.Active = not v40.Active;
        for v387 = 1, v70 do
            v53[v387]:SetClickability(not l_Visible_2);
        end;
    end;
    if not v43.Visible then
        if v66 then
            v333.Visible = false;
        end;
        disableGamepadInventoryControl();
    elseif v66 then
        if v20[l_UserInputService_0:GetLastInputType()] then
            v346();
            v333.Visible = not (l_VRService_0.VREnabled and not v2);
        end;
        enableGamepadInventoryControl();
    end;
    if not v43.Visible then
        l_ContextActionService_0:UnbindAction("RBXRemoveSlot");
    else
        l_ContextActionService_0:BindAction("RBXRemoveSlot", l_v348_1, false, Enum.KeyCode.ButtonX);
    end;
    v3.IsOpen = v43.Visible;
    v3.StateChanged:Fire(v43.Visible);
end;
local l_v349_1 = v349 --[[ copy: 114 -> 126 ]];
v56[l_Value_0] = function()
    if not l_GuiService_0.MenuIsOpen then
        l_v349_1();
        return ;
    else
        return ;
    end;
end;
v3.OpenClose = v349;
while not l_LocalPlayer_0 do
    wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
l_LocalPlayer_0.CharacterAdded:connect(v257);
if l_LocalPlayer_0.Character then
    v257(l_LocalPlayer_0.Character);
end;
for v389 = 0, 9 do
    table.insert(v64, (tostring(v389)));
end;
table.insert(v64, "`");
l_UserInputService_0.InputBegan:connect(v262);
l_UserInputService_0.TextBoxFocused:connect(function()
    v62 = true;
end);
l_UserInputService_0.TextBoxFocusReleased:connect(function()
    v62 = false;
end);
v56[l_Value_2] = function()
    if not (not v59 or not v51) then
        v51:UnequipTools();
        if v59 then
            v59:ToggleSelect();
            v55[v59]:UpdateEquipView();
            v59 = nil;
        end;
    end;
end;
l_UserInputService_0.Changed:connect(v266);
v348 = l_UserInputService_0.KeyboardEnabled and not l_VRService_0.VREnabled;
for v390 = 1, v70 do
    v53[v390]:TurnNumber(v348);
end;
if l_UserInputService_0:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
    gamepadConnected();
end;
l_UserInputService_0.GamepadConnected:connect(function(v391)
    if v391 == Enum.UserInputType.Gamepad1 then
        gamepadConnected();
    end;
end);
l_UserInputService_0.GamepadDisconnected:connect(function(v392)
    if v392 == Enum.UserInputType.Gamepad1 then
        gamepadDisconnected();
    end;
end);
v3.TopbarEnabledChanged = function(_, v394)
    v35 = v394;
    v320(Enum.CoreGuiType.Backpack, l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack));
end;
l_StarterGui_0.CoreGuiChangedSignal:connect(v320);
v348 = Enum.CoreGuiType.Backpack;
v349 = Enum.CoreGuiType.Health;
v320(v348, l_StarterGui_0:GetCoreGuiEnabled(v348));
v320(v349, l_StarterGui_0:GetCoreGuiEnabled(v349));
l_GuiService_0.MenuOpened:Connect(function()
    if v3.IsOpen then
        v3.OpenClose();
    end;
end);
if not v2 then
    v363 = nil;
    v366 = nil;
    v368 = nil;
    do
        local l_v363_1, l_v366_1, l_v368_0 = v363, v366, v368;
        v374 = function()
            local v398 = require(l_RobloxGui_1.Modules.VR.Panel3D);
            v68 = false;
            v320(v348, l_StarterGui_0:GetCoreGuiEnabled(v348));
            v320(v349, l_StarterGui_0:GetCoreGuiEnabled(v349));
            v44.Visible = v68;
            local v399 = v398.Get(v3.ModuleName);
            v399:SetVisible(false);
            v399:LinkTo(nil);
            v39.Parent = l_RobloxGui_1;
            v41.Parent = nil;
            v42.Parent = nil;
            v48.Parent = nil;
            v49.Parent = nil;
            v45.ScrollingEnabled = true;
            for _, v401 in pairs(v53) do
                v401:SetClickability(true);
            end;
            if l_v363_1 then
                l_v363_1:disconnect();
                l_v363_1 = nil;
            end;
            if l_v366_1 then
                l_v366_1:disconnect();
                l_v366_1 = nil;
            end;
            if l_v368_0 then
                l_v368_0:disconnect();
                l_v368_0 = nil;
            end;
            v71 = if not v68 then v37 and 2 or 4 else 3;
            v230(if not v68 then v37 and 3 or 10 else 6);
        end;
        l_VRService_0:GetPropertyChangedSignal("VREnabled"):connect(v374);
        v374();
    end;
end;
l_UserGameSettings_0:GetPropertyChangedSignal("PreferredTransparency"):connect(function()
    local l_PreferredTransparency_0 = l_UserGameSettings_0.PreferredTransparency;
    v6 = 0.5 * l_UserGameSettings_0.PreferredTransparency;
    v43.BackgroundTransparency = v6;
    v10 = 0.5 * l_PreferredTransparency_0;
    for _, v404 in ipairs(v53) do
        v404.Frame.BackgroundTransparency = v10;
    end;
    v17 = 0.15 * l_UserGameSettings_0.PreferredTransparency;
    v347.BackgroundTransparency = v17;
end);
return v3;

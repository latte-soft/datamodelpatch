local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_TweenService_0 = game:GetService("TweenService");
local v3 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.Settings.Utility);
local v4 = Color3.new(0.1, 0, 0);
local v5 = Color3.new(0, 0, 0);
local _ = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
local _ = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
local v8 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true, 0);
local v9 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
local v10 = nil;
local v11 = {};
local v12 = {};
local v13 = {};
local v14 = {};
local v15 = {};
local v16 = {};
local v17 = {};
local v18 = {};
local v19 = true;
local _ = {
    BoundInputType = 3, 
    TableHeader = 2, 
    BoundAction = 1
};
local function v23(v21, v22)
    return tostring(v12[v21]) < tostring(v12[v22]);
end;
local function v32(v24, v25)
    local v26 = v14[v24];
    local v27 = v14[v25];
    if not v26 or not v27 then
        return true;
    else
        local v28 = v15[v24];
        local v29 = v15[v25];
        if v28 ~= v29 then
            return tostring(v28) < tostring(v29);
        elseif not v26.isCore or v27.isCore then
            if v26.isCore or not v27.isCore then
                local l_stackOrder_0 = v26.stackOrder;
                local l_stackOrder_1 = v27.stackOrder;
                if not l_stackOrder_0 or not l_stackOrder_1 then
                    return true;
                else
                    return l_stackOrder_1 < l_stackOrder_0;
                end;
            else
                return false;
            end;
        else
            return true;
        end;
    end;
end;
local function v37(v33, v34)
    local v35 = v3:Create("Frame")({
        Name = v33, 
        BackgroundTransparency = 1, 
        ZIndex = 6, 
        Size = UDim2.new(1, 0, 0, v34 or 0)
    });
    local _ = v3:Create("UIListLayout")({
        FillDirection = Enum.FillDirection.Horizontal, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, 5), 
        Parent = v35
    });
    return v35;
end;
local function v42(v38, v39)
    local v40 = v3:Create("TextButton")({
        Name = v38, 
        BackgroundTransparency = 1, 
        ZIndex = 6, 
        Text = "", 
        Size = UDim2.new(1, 0, 0, v39 or 0)
    });
    local _ = v3:Create("UIListLayout")({
        FillDirection = Enum.FillDirection.Horizontal, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, 5), 
        Parent = v40
    });
    return v40;
end;
local function v45(v43, v44)
    return (v3:Create("Frame")({
        Name = v44, 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        BackgroundTransparency = 0.75, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        ZIndex = 6, 
        ClipsDescendants = true, 
        Parent = v43
    }));
end;
local function v54(v46, v47, v48, v49, v50)
    local v51 = v45(v46, v47);
    local _ = v3:Create("UIAspectRatioConstraint")({
        AspectRatio = v49 or 1, 
        Parent = v51
    });
    local _ = v3:Create("ImageLabel")({
        Name = "ColumnImage", 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        Size = UDim2.new(v50 or 1, 0, v50 or 1, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        ZIndex = 6, 
        Image = v48, 
        Parent = v51
    });
    return v51;
end;
local function v60(v55, v56, v57)
    local v58 = v45(v55, v56);
    local _ = v3:Create("TextLabel")({
        Name = "ColumnText", 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        Size = UDim2.new(1, -10, 1, -10), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        ZIndex = 6, 
        Text = v57, 
        TextSize = 18, 
        TextColor3 = Color3.new(1, 1, 1), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Font = Enum.Font.SourceSans, 
        Parent = v58
    });
    return v58;
end;
local function v69(v61, v62)
    local v63 = 0;
    local v64 = v45(v61, "Inset");
    v64.LayoutOrder = 0;
    v64.BackgroundTransparency = 1;
    v64.Size = UDim2.new(0, 30, 1, 0);
    v63 = (v63 + 30) + 5;
    local v65 = v60(v61, "Priority", "Priority");
    v65.LayoutOrder = 1;
    v65.BackgroundColor3 = v62;
    v65.Size = UDim2.new(0, 80, 1, 0);
    v63 = (v63 + 80) + 5;
    local v66 = v60(v61, "Security", "Security");
    v66.LayoutOrder = 2;
    v66.BackgroundColor3 = v62;
    v66.Size = UDim2.new(0, 80, 1, 0);
    v63 = (v63 + 80) + 5;
    local v67 = v60(v61, "ActionName", "Action Name");
    v67.LayoutOrder = 3;
    v67.BackgroundColor3 = v62;
    v67.Size = UDim2.new(0.25, 0, 1, 0);
    local v68 = v60(v61, "InputTypes", "Input Types");
    v68.LayoutOrder = 4;
    v68.BackgroundColor3 = v62;
    v68.Size = UDim2.new(0.75, -v63 - 5, 1, 0);
    return v64, v65, v66, v67, v68;
end;
local function v84()
    debug.profilebegin("updateContainerCanvas");
    if v19 then
        v19 = false;
        local v70 = 1;
        local v71 = {};
        for _, v73 in pairs(v11) do
            table.insert(v71, v73);
        end;
        table.sort(v71, v23);
        for _, v75 in pairs(v71) do
            local v76 = v12[v75];
            v75.LayoutOrder = v70;
            v70 = v70 + 1;
            local v77 = v17[v76];
            if v77 then
                v77.LayoutOrder = v70;
                v70 = v70 + 1;
            end;
            local v78 = v13[v76];
            if v78 then
                local v79 = {};
                for _, v81 in pairs(v78) do
                    table.insert(v79, v81);
                end;
                table.sort(v79, v32);
                for _, v83 in pairs(v79) do
                    v83.LayoutOrder = v70;
                    v70 = v70 + 1;
                end;
            end;
        end;
    end;
    debug.profileend();
end;
local function v86(v85)
    l_TweenService_0:Create(v10, v9, {
        CanvasPosition = v10.CanvasPosition + Vector2.new(0, v85.AbsolutePosition.Y - v10.AbsolutePosition.Y)
    }):Play();
end;
local v87 = {};
v87.initializeGui = function(v88)
    local v89 = v3:Create("ScrollingFrame")({
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        Size = UDim2.new(1, -10, 1, -10), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BorderSizePixel = 0, 
        ScrollBarThickness = 4, 
        BackgroundTransparency = 1, 
        ZIndex = 6, 
        Parent = v88
    });
    v10 = v89;
    local v90 = v3:Create("UIListLayout")({
        Padding = UDim.new(0, 5), 
        Parent = v89
    });
    v90.SortOrder = Enum.SortOrder.LayoutOrder;
    v90:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        v10.CanvasSize = UDim2.new(0, 0, 0, v90.AbsoluteContentSize.Y);
    end);
    v87.updateGuis();
    l_ContextActionService_0.BoundActionAdded:connect(function(v91, _, v93, v94)
        v93.isCore = v94;
        v87.updateActionRows(v91, v93);
        v19 = true;
        v84();
    end);
    l_ContextActionService_0.BoundActionRemoved:connect(function(v95, v96, v97)
        v96.isCore = v97;
        v87.removeActionRows(v95, v96);
        v19 = true;
        v84();
    end);
end;
v87.updateBoundInputTypeRow = function(v98)
    if not v11[v98] then
        local v99 = v42("BoundInputType", 30);
        local v100 = v54(v99, "ExpandImage", "rbxasset://textures/ui/ExpandArrowSheet.png", 1, 0.35);
        v100.ColumnImage.ImageRectSize = Vector2.new(21, 21);
        v100.ColumnImage.ImageRectOffset = Vector2.new(0, 0);
        local v101 = v60(v99, "InputType", (tostring(v98)));
        v101.Size = UDim2.new(1, -35, 1, 0);
        v101.ColumnText.Font = Enum.Font.SourceSansBold;
        local v102 = v37("TableHeader", 20);
        v102.Visible = false;
        local _, v104, v105, v106, v107 = v69(v102, v5);
        v104.ColumnText.Font = Enum.Font.SourceSansBold;
        v105.ColumnText.Font = Enum.Font.SourceSansBold;
        v106.ColumnText.Font = Enum.Font.SourceSansBold;
        v107.ColumnText.Font = Enum.Font.SourceSansBold;
        v11[v98] = v99;
        v12[v99] = v98;
        v16[v102] = v98;
        v17[v98] = v102;
        v102.Parent = v10;
        v99.Parent = v10;
        l_TweenService_0:Create(v101, v8, {
            BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
        }):Play();
        v18[v98] = false;
        v99.MouseButton1Click:connect(function()
            v18[v98] = not v18[v98];
            local v108 = v13[v98];
            if v18[v98] then
                v100.ColumnImage.ImageRectOffset = Vector2.new(21, 0);
                v102.Visible = true;
                if v108 then
                    for _, v110 in pairs(v108) do
                        v110.Visible = true;
                    end;
                end;
            else
                v100.ColumnImage.ImageRectOffset = Vector2.new(0, 0);
                v102.Visible = false;
                if v108 then
                    for _, v112 in pairs(v108) do
                        v112.Visible = false;
                    end;
                end;
            end;
            v84();
            if v18[v98] then
                l_TweenService_0:Create(v101, v8, {
                    BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
                }):Play();
                v86(v99);
            end;
        end);
    end;
end;
v87.updateActionRowForInputType = function(v113, v114, v115)
    local v116 = v13[v115];
    if not v116 then
        v116 = {};
        v13[v115] = v116;
    end;
    if not v116[v113] then
        local v117 = v37("BoundAction", 20);
        v117.Visible = v18[v115];
        local v118 = {};
        for v119, v120 in pairs(v114.inputTypes) do
            v118[v119] = tostring(v120);
        end;
        local _, v122, v123, v124, v125 = v69(v117, not not v114.isCore and v4 or v5);
        v122.ColumnText.Text = v114.priorityLevel or "Default";
        v123.ColumnText.Text = not v114.isCore and "Developer" or "Core";
        v124.ColumnText.Text = v113;
        v125.ColumnText.Text = table.concat(v118, ", ");
        if v114.isCore then
            v122.ColumnText.Font = Enum.Font.SourceSansItalic;
            v123.ColumnText.Font = Enum.Font.SourceSansItalic;
            v124.ColumnText.Font = Enum.Font.SourceSansItalic;
            v125.ColumnText.Font = Enum.Font.SourceSansItalic;
        end;
        v116[v113] = v117;
        v15[v117] = v115;
        v14[v117] = v114;
        v117.Parent = v10;
        if not v117.Visible then
            local v126 = v11[v115];
            if v126 then
                l_TweenService_0:Create(v126.InputType, v8, {
                    BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
                }):Play();
            end;
        else
            l_TweenService_0:Create(v124, v8, {
                BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
            }):Play();
        end;
        local _ = v117;
    end;
end;
v87.updateActionRows = function(v128, v129)
    for _, v131 in pairs(v129.inputTypes) do
        v87.updateBoundInputTypeRow(v131);
        v87.updateActionRowForInputType(v128, v129, v131);
    end;
end;
v87.removeActionRows = function(v132, v133)
    for _, v135 in pairs(v133.inputTypes) do
        local v136 = v13[v135];
        if v136 then
            v136[v132]:Destroy();
            v136[v132] = nil;
            local v137 = true;
            for _, _ in pairs(v136) do
                v137 = false;
                break;
            end;
            if v137 then
                local v140 = v11[v135];
                if v140 then
                    v140:Destroy();
                    v11[v135] = nil;
                end;
                local v141 = v17[v135];
                if v141 then
                    v17[v141] = nil;
                    v141:Destroy();
                    v17[v135] = nil;
                end;
            end;
        end;
    end;
    v84();
    v10.UIListLayout:ApplyLayout();
end;
v87.updateGuis = function()
    for v142, v143 in pairs((l_ContextActionService_0:GetAllBoundCoreActionInfo())) do
        v143.isCore = true;
        v87.updateActionRows(v142, v143);
    end;
    for v144, v145 in pairs((l_ContextActionService_0:GetAllBoundActionInfo())) do
        v145.isCore = false;
        v87.updateActionRows(v144, v145);
    end;
    v19 = true;
    v84();
end;
return v87;

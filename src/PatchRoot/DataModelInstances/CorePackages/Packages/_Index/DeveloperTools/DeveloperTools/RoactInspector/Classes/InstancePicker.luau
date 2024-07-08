local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_Parent_0.Dash);
local l_class_0 = v2.class;
local l_format_0 = v2.format;
local l_reduce_0 = v2.reduce;
local v6 = UDim2.fromScale(0, 0);
local function v10(v7, v8, v9)
    return UDim2.new(v7.X.Scale * (1 - v9) + v8.X.Scale * v9, v7.X.Offset * (1 - v9) + v8.X.Offset * v9, v7.Y.Scale * (1 - v9) + v8.Y.Scale * v9, v7.Y.Offset * (1 - v9) + v8.Y.Offset * v9);
end;
local function v12()
    local l_ImageButton_0 = Instance.new("ImageButton");
    l_ImageButton_0.Name = "InspectorHover";
    l_ImageButton_0.Active = true;
    l_ImageButton_0.AutoButtonColor = false;
    l_ImageButton_0.BorderSizePixel = 1;
    l_ImageButton_0.BorderColor3 = Color3.fromRGB(0, 0, 0);
    l_ImageButton_0.BackgroundColor3 = Color3.fromRGB(220, 230, 255);
    l_ImageButton_0.BackgroundTransparency = 0.2;
    l_ImageButton_0.ZIndex = 1100000;
    return l_ImageButton_0;
end;
local function v15()
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "InspectorHover";
    l_Frame_0.BorderSizePixel = 1;
    l_Frame_0.BorderColor3 = Color3.fromRGB(0, 0, 0);
    l_Frame_0.BackgroundColor3 = Color3.fromRGB(220, 230, 255);
    l_Frame_0.BackgroundTransparency = 0.2;
    l_Frame_0.ZIndex = 1100000;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "Dimensions";
    l_TextLabel_0.Size = UDim2.new(0, 60, 0, 24);
    l_TextLabel_0.Parent = l_Frame_0;
    l_TextLabel_0.BorderColor3 = Color3.fromRGB(0, 0, 0);
    l_TextLabel_0.BorderSizePixel = 1;
    l_TextLabel_0.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    l_TextLabel_0.BackgroundTransparency = 0.2;
    l_TextLabel_0.ZIndex = 1100001;
    return l_Frame_0;
end;
local v18 = l_class_0("InstancePicker", function(v16, v17)
    return {
        debugInterface = v16, 
        onSelect = v17, 
        active = false, 
        connection = nil, 
        selectedObject = nil, 
        pickerArea = v12(), 
        highlightArea = v15(), 
        selectedTime = os.clock(), 
        nextPosition = v6, 
        nextSize = v6, 
        prevPosition = v6, 
        prevSize = v6
    };
end);
v18.getRoot = function(v19)
    return v19.debugInterface.rootInstance;
end;
v18.getPickerParent = function(v20, v21)
    return (v21 and v21:FindFirstAncestorWhichIsA("ScreenGui") or v20.debugInterface.pickerParent) or v20:getRoot();
end;
v18.getRelativeMousePosition = function(v22)
    local v23 = v22:getRoot();
    if v23 then
        if not v23:IsA("PluginGui") then
            local l_Mouse_0 = game:GetService("Players").LocalPlayer:GetMouse();
            return Vector2.new(l_Mouse_0.X, l_Mouse_0.Y);
        else
            return v23:GetRelativeMousePosition();
        end;
    else
        return nil;
    end;
end;
v18._init = function(v25)
    v25.pickerArea.Activated:Connect(function()
        v25.onSelect(v25.selectedObject);
    end);
end;
v18.setActive = function(v26, v27)
    v26.active = v27;
    if v26:getRoot() then
        if not v27 then
            if v26.connection then
                v26.connection:Disconnect();
                v26.connection = nil;
                v26.pickerArea.Parent = nil;
            end;
            return ;
        else
            v26.pickerArea.Parent = v26:getPickerParent();
            local v28 = nil;
            v28 = function()
                if v26.active then
                    v26:calculateFramePosition();
                    delay(0.2, v28);
                    return ;
                else
                    return ;
                end;
            end;
            v28();
            v26.connection = l_RunService_0.RenderStepped:Connect(function()
                v26:updateFrame();
            end);
            return ;
        end;
    else
        return ;
    end;
end;
v18.updateFrame = function(v29)
    local v30 = math.min(1, (os.clock() - v29.selectedTime) / 0.1);
    v29.pickerArea.Position = v10(v29.prevPosition, v29.nextPosition, v30);
    v29.pickerArea.Size = v10(v29.prevSize, v29.nextSize, v30);
end;
v18.intersectMouse = function(v31, v32, v33)
    return l_reduce_0(v32:GetDescendants(), function(v34, v35)
        if v35 == v31.pickerArea then
            return v34;
        else
            local v36 = false;
            if v35:IsA("GuiBase2d") then
                local v37 = v33 - v35.AbsolutePosition;
                local v38 = false;
                if v37.X >= 0 then
                    v38 = false;
                    if v37.X <= v35.AbsoluteSize.X then
                        v38 = false;
                        if v37.Y >= 0 then
                            v38 = v37.Y <= v35.AbsoluteSize.Y;
                        end;
                    end;
                end;
                v36 = v38;
            end;
            if not (not v35:IsA("GuiObject") or v35.Visible) then
                v36 = false;
            end;
            local l_v35_FirstAncestorWhichIsA_0 = v35:FindFirstAncestorWhichIsA("ScreenGui");
            local v40 = l_v35_FirstAncestorWhichIsA_0 and l_v35_FirstAncestorWhichIsA_0.Enabled == false;
            if not (not v36 or v40) then
                local v41 = v35.AbsoluteSize.X * v35.AbsoluteSize.Y;
                if v41 < v34.minArea then
                    v34.minArea = v41;
                    v34.instance = v35;
                end;
            end;
            return v34;
        end;
    end, {
        minArea = math.huge
    }).instance;
end;
v18.calculateFramePosition = function(v42)
    local v43 = v42:getRoot();
    local v44 = v42:getRelativeMousePosition();
    if v43 and v44 then
        if v44 ~= v42.mousePosition then
            v42.mousePosition = v44;
            local v45 = v42:intersectMouse(v43, v44);
            if not v45 then
                v42.selectedObject = nil;
            elseif v45 ~= v42.selectedObject then
                v42.pickerArea.Parent = v42:getPickerParent(v45);
                v42.selectedObject = v45;
                v42.prevPosition = UDim2.fromOffset(v42.pickerArea.AbsolutePosition.X, v42.pickerArea.AbsolutePosition.Y);
                v42.prevSize = UDim2.fromOffset(v42.pickerArea.AbsoluteSize.X, v42.pickerArea.AbsoluteSize.Y);
                v42.nextPosition = UDim2.fromOffset(v45.AbsolutePosition.X, v45.AbsolutePosition.Y);
                v42.nextSize = UDim2.fromOffset(v45.AbsoluteSize.X, v45.AbsoluteSize.Y);
                v42.selectedTime = os.clock();
                return ;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v18.highlight = function(v46, v47)
    pcall(function()
        v46.highlightArea.Parent = v46:getPickerParent(v47);
        v46.highlightArea.Position = UDim2.fromOffset(v47.AbsolutePosition.X, v47.AbsolutePosition.Y);
        v46.highlightArea.Size = UDim2.fromOffset(v47.AbsoluteSize.X, v47.AbsoluteSize.Y);
        v46.highlightArea:FindFirstChild("Dimensions").Text = l_format_0("{X}x{Y}", v47.AbsoluteSize);
    end);
end;
v18.dehighlight = function(v48)
    v48.highlightArea.Parent = nil;
end;
v18.destroy = function(v49)
    if v49.connection then
        v49.connection:Disconnect();
    end;
    v49.pickerArea:Destroy();
end;
return v18;

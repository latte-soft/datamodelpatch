local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v4 = require(l_RobloxGui_0.Modules.VR.Panel3D);
local _ = Color3.new(0.2, 0.2, 0.2);
local _ = Enum.FontSize.Size36;
local _ = Color3.new(1, 1, 1);
local v8 = CFrame.new(0, 0, -7) * CFrame.Angles(0, 3.141592653589793, 0);
local _ = v3:Create("ImageLabel")({
    Name = "EmptySelectionImage", 
    Image = "", 
    BackgroundTransparency = 1, 
    ImageTransparency = 1
});
local v10 = v4.Get("Dialog");
v10:SetType(v4.Type.Fixed);
v10.localCF = v8;
v10:SetCanFade(true);
local v11 = 0;
local v12 = {};
local v13 = false;
local v14 = 0;
local function _(v15)
    v11 = v15;
    v10.localCF = (CFrame.new(l_UserInputService_0:GetUserCFrame(Enum.UserCFrame.Head).p) * CFrame.Angles(0, v15, 0)) * v8;
end;
v10.CalculateTransparency = function(_)
    local l_l_UserInputService_0_UserCFrame_0 = l_UserInputService_0:GetUserCFrame(Enum.UserCFrame.Head);
    local v19 = l_l_UserInputService_0_UserCFrame_0.lookVector * Vector3.new(1, 0, 1);
    local v20 = math.asin(l_l_UserInputService_0_UserCFrame_0.lookVector.Y);
    local v21 = Vector3.new(math.cos((v14 + v11) + 1.5707963267948966), 0, -math.sin((v14 + v11) + 1.5707963267948966));
    if math.abs(v20) > 0.767944870877505 then
        v13 = true;
    end;
    return (math.min(math.max(0, (math.acos((v19:Dot(v21))) - 0.6544984694978736) / 0.11344640137963136), 1));
end;
local function v25()
    local v22 = l_UserInputService_0:GetUserCFrame(Enum.UserCFrame.Head).lookVector * Vector3.new(1, 0, 1);
    local v23 = (math.atan2(-v22.Z, v22.X) - 1.5707963267948966) % 6.283185307179586;
    local v24 = v14 + math.floor(v23 / 1.5707963267948966 + 0.5) * 1.5707963267948966;
    if v13 then
        v13 = false;
        v14 = v23;
    end;
    v11 = v24;
    v10.localCF = (CFrame.new(l_UserInputService_0:GetUserCFrame(Enum.UserCFrame.Head).p) * CFrame.Angles(0, v24, 0)) * v8;
end;
dialogPanelRenderUpdate = function()
    if not (v10.transparency ~= 1 and not v13) then
        v25();
    end;
    local v26 = 1 - v10.transparency;
    for v27, v28 in pairs(v12) do
        local v29 = 1 - v28 * v26;
        if not v27:IsA("TextLabel") and not v27:IsA("TextButton") then
            if not v27:IsA("ImageLabel") and not v27:IsA("ImageButton") then
                if v27:IsA("Frame") then
                    v27.BackgroundTransparency = v29;
                end;
            else
                v27.ImageTransparency = v29;
            end;
        else
            v27.TextTransparency = v29;
        end;
    end;
end;
local v30 = {};
local v31 = nil;
local v32 = nil;
local function v40()
    local v33 = v30[1];
    if not (not v32 or not v32.content) then
        v32.content.Parent = nil;
    end;
    if v33 and v33.content then
        v33.content.Parent = v10:GetGUI();
        v32 = v33;
        local l_AbsoluteSize_0 = v33.content.AbsoluteSize;
        v10:ResizePixels(l_AbsoluteSize_0.X, l_AbsoluteSize_0.Y, 100);
        v13 = true;
        v25();
        v10:SetVisible(true);
        v12 = {};
        local function v35(v36)
            if not v36:IsA("ImageLabel") and not v36:IsA("ImageButton") then
                if not v36:IsA("TextLabel") and not v36:IsA("TextButton") then
                    if v36:IsA("Frame") then
                        v12[v36] = 1 - v36.BackgroundTransparency;
                    end;
                else
                    v12[v36] = 1 - v36.TextTransparency;
                end;
            else
                v12[v36] = 1 - v36.ImageTransparency;
            end;
            for _, v38 in pairs(v36:GetChildren()) do
                v35(v38);
            end;
        end;
        v35(v10:GetGUI());
        if v31 then
            v31:disconnect();
            v31 = nil;
        end;
        v31 = v10:GetGUI().DescendantAdded:connect(function(v39)
            v35(v39);
        end);
    else
        v10:SetVisible(false);
        v12 = {};
        if v31 then
            v31:disconnect();
            v31 = nil;
            return ;
        end;
    end;
end;
local v41 = {};
v41.__index = v41;
v41.new = function(v42)
    local v43 = setmetatable({}, v41);
    v43.content = v42;
    return v43;
end;
v41.SetContent = function(v44, v45)
    if not (v45 or not v44.content) then
        v44.content.Parent = nil;
    end;
    v44.content = v45;
end;
local v46 = false;
v41.Show = function(v47, v48)
    if not v46 then
        v46 = true;
        l_RunService_0:BindToRenderStep("DialogPanel", Enum.RenderPriority.First.Value, dialogPanelRenderUpdate);
    end;
    if not v48 then
        table.insert(v30, v47);
    else
        table.insert(v30, 1, v47);
    end;
    v40();
end;
v41.Close = function(v49)
    for v50, v51 in pairs(v30) do
        if v51 == v49 then
            table.remove(v30, v50);
            break;
        end;
    end;
    if v46 and #v30 == 0 then
        v46 = false;
        l_RunService_0:UnbindFromRenderStep("DialogPanel");
    end;
    v40();
end;
return v41;

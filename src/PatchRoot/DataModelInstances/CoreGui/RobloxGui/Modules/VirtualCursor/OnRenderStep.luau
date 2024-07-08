local l_Parent_0 = script.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_GamepadService_0 = game:GetService("GamepadService");
local l_CoreGui_0 = game:GetService("CoreGui");
local v5 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.Flags.GetFFlagFixMissingPlayerGuiCrash);
local v6 = nil;
local v7 = require(l_Parent_0.Input);
local v8 = require(l_Parent_0.Interface);
local v9 = require(l_Parent_0.Properties);
local v10 = 1;
local v11 = false;
local l_sin_0 = math.sin;
local l_cos_0 = math.cos;
local _ = math.abs;
local l_max_0 = math.max;
local l_min_0 = math.min;
local l_sign_0 = math.sign;
local l_abs_1 = math.abs;
local function _(v19)
    if v19:IsA("GuiButton") or v19:IsA("TextBox") then
        if v19.Active and v19.Selectable then
            if v19.AbsoluteSize.Magnitude == 0 then
                return false;
            else
                return true;
            end;
        else
            return false;
        end;
    else
        return false;
    end;
end;
local function _(v21, v22, v23)
    local v24 = false;
    if v22.x <= v21.x then
        v24 = false;
        if v22.y <= v21.y then
            v24 = false;
            if v21.x <= v23.x then
                v24 = v21.y <= v23.y;
            end;
        end;
    end;
    return v24;
end;
local function v46(v26, v27, v28)
    if v26:IsA("ScrollingFrame") then
        if v26.ScrollingEnabled then
            local l_v7_Thumbstick2Vector_0 = v7:GetThumbstick2Vector();
            local v30 = v9.ScrollingSpeed * v28;
            local l_ScrollingRadius_0 = v9.ScrollingRadius;
            local l_AbsoluteCanvasSize_0 = v26.AbsoluteCanvasSize;
            local l_AbsoluteSize_0 = v26.AbsoluteSize;
            local l_ScrollingDirection_0 = v26.ScrollingDirection;
            local v35 = false;
            if l_AbsoluteSize_0.X < l_AbsoluteCanvasSize_0.X then
                v35 = true;
                if l_ScrollingDirection_0 ~= Enum.ScrollingDirection.XY then
                    v35 = l_ScrollingDirection_0 == Enum.ScrollingDirection.X;
                end;
            end;
            local v36 = false;
            if l_AbsoluteSize_0.Y < l_AbsoluteCanvasSize_0.Y then
                v36 = true;
                if l_ScrollingDirection_0 ~= Enum.ScrollingDirection.XY then
                    v36 = l_ScrollingDirection_0 == Enum.ScrollingDirection.Y;
                end;
            end;
            local l_AbsoluteSize_1 = v26.AbsoluteSize;
            local l_AbsolutePosition_0 = v26.AbsolutePosition;
            local v39 = (v26.Rotation / 180) * 3.141592653589793;
            if v9.ThumbstickDeadzone < l_abs_1(l_v7_Thumbstick2Vector_0.x) then
                v26.CanvasPosition = v26.CanvasPosition + Vector2.new(l_v7_Thumbstick2Vector_0.x * v30, 0);
            end;
            if v9.ThumbstickDeadzone < l_abs_1(l_v7_Thumbstick2Vector_0.y) then
                v26.CanvasPosition = v26.CanvasPosition + Vector2.new(0, l_v7_Thumbstick2Vector_0.y * v30);
            end;
            local v40 = Vector2.new(l_cos_0(v39), (l_sin_0(v39)));
            local v41 = Vector2.new(-l_sin_0(v39), (l_cos_0(v39)));
            local v42 = Vector2.new(v27.X, v27.Y) - l_AbsolutePosition_0;
            local v43 = v42:Dot(v40) - l_AbsoluteSize_1.X / 2;
            local v44 = v42:Dot(v41) - l_AbsoluteSize_1.Y / 2;
            local v45 = Vector2.new(l_abs_1(v43), (l_abs_1(v44))) - l_AbsoluteSize_1 / 2;
            if l_abs_1(l_min_0(l_max_0(v45.x, v45.y), 0) + Vector2.new(l_max_0(v45.x, 0), (l_max_0(v45.y, 0))).Magnitude) < l_ScrollingRadius_0 then
                if not (l_abs_1(v45.x) < l_abs_1(v45.y)) or not v35 then
                    if not (not (l_abs_1(v45.y) <= l_abs_1(v45.x)) or not v36) then
                        v26.CanvasPosition = v26.CanvasPosition + Vector2.new(0, l_sign_0(v44) * v30);
                        v8:SetArrow(0, (l_sign_0(v44)));
                        return true;
                    end;
                else
                    v26.CanvasPosition = v26.CanvasPosition + Vector2.new(l_sign_0(v43) * v30, 0);
                    v8:SetArrow(l_sign_0(v43), 0);
                    return true;
                end;
            end;
            return false;
        else
            return false;
        end;
    else
        return false;
    end;
end;
local function v62(v47, v48, v49)
    local v50 = nil;
    local l_huge_0 = math.huge;
    local v52 = -math.huge;
    v11 = false;
    v47 = v47 - l_GuiService_0:GetGuiInset();
    if not v5() then
        if v6 == nil then
            v6 = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
        end;
    elseif v6 == nil then
        v6 = l_Players_0.LocalPlayer:FindFirstChildOfClass("PlayerGui");
    end;
    local v53 = if not v6 then {} else v6:GetGuiObjectsInCircle(v47, v48);
    local l_l_CoreGui_0_GuiObjectsInCircle_0 = l_CoreGui_0:GetGuiObjectsInCircle(v47, v48);
    for _, v56 in ipairs(v53) do
        if not v46(v56, v47, v49) then
            if not (not if v56:IsA("GuiButton") or v56:IsA("TextBox") then if v56.Active and v56.Selectable then v56.AbsoluteSize.Magnitude ~= 0 else false else false or v50) then
                v50 = v56;
            end;
            if if v56:IsA("GuiButton") or v56:IsA("TextBox") then if v56.Active and v56.Selectable then v56.AbsoluteSize.Magnitude ~= 0 else false else false and v56.Parent == v50.Parent then
                local l_Magnitude_0 = ((v56.AbsolutePosition + v56.AbsoluteSize / 2) - v47).Magnitude;
                if l_Magnitude_0 < l_huge_0 and v52 <= v56.ZIndex then
                    v50 = v56;
                    l_huge_0 = l_Magnitude_0;
                    v52 = v50.ZIndex;
                end;
            end;
        else
            v11 = true;
            return nil;
        end;
    end;
    local v58 = false;
    for _, v60 in ipairs(l_l_CoreGui_0_GuiObjectsInCircle_0) do
        if not v46(v60, v47, v49) then
            if if v60:IsA("GuiButton") or v60:IsA("TextBox") then if v60.Active and v60.Selectable then v60.AbsoluteSize.Magnitude ~= 0 else false else false then
                local l_Magnitude_1 = ((v60.AbsolutePosition + v60.AbsoluteSize / 2) - v47).Magnitude;
                if not (not (v58 and l_Magnitude_1 < l_huge_0) or v52 > v60.ZIndex) or not v58 and l_Magnitude_1 < l_huge_0 then
                    v50 = v60;
                    l_huge_0 = l_Magnitude_1;
                    v52 = v50.ZIndex;
                    v58 = true;
                end;
            end;
        else
            v11 = true;
            return nil;
        end;
    end;
    return v50;
end;
local function _()
    return l_GuiService_0:GetScreenResolution().Magnitude * v9.MaxSpeedRelative;
end;
return function(v64, v65)
    local v66 = l_GuiService_0:GetScreenResolution() + l_GuiService_0:GetGuiInset();
    local l_v7_ThumbstickVector_0 = v7:GetThumbstickVector();
    local l_l_GamepadService_0_GamepadCursorPosition_0 = l_GamepadService_0:GetGamepadCursorPosition();
    local v69 = nil;
    local _ = Vector2.new();
    if v64.SelectedObject == nil then
        v10 = 1;
        v8:SetCursorHighlight(false);
    end;
    if v11 then
        v10 = v9.ScrollingSlowDown;
    end;
    v69 = (l_v7_ThumbstickVector_0 * (l_GuiService_0:GetScreenResolution().Magnitude * v9.MaxSpeedRelative)) * v10;
    if v69.Magnitude > 0 then
        local v71 = l_l_GamepadService_0_GamepadCursorPosition_0 + v69 * v65;
        l_l_GamepadService_0_GamepadCursorPosition_0 = Vector2.new(math.clamp(v71.x, 0, v66.x), (math.clamp(v71.y, 0, v66.y)));
    end;
    v8:SetCursorPosition(l_l_GamepadService_0_GamepadCursorPosition_0);
    l_GamepadService_0:SetGamepadCursorPosition(l_l_GamepadService_0_GamepadCursorPosition_0);
    v64.CursorPosition = l_l_GamepadService_0_GamepadCursorPosition_0;
    local v72 = v62(l_l_GamepadService_0_GamepadCursorPosition_0, v9.SelectionRadius, v65);
    if v72 ~= v64.PreviouslySelectedObject then
        v64.PreviouslySelectedObject = v72;
        v8:SetCursorHighlight(v72 ~= nil);
        if not v72 then
            v64.SelectedObject = nil;
            v10 = 1;
        elseif v72 ~= v64.SelectedObject then
            v64.SelectedObject = v72;
            v10 = v9.SpeedAdjustmentTarget;
        end;
        if v64.SelectedObject == nil then
            l_GuiService_0.SelectedObject = nil;
            l_GuiService_0.SelectedCoreObject = nil;
            return ;
        elseif not v64.SelectedObject:IsDescendantOf(l_CoreGui_0) then
            l_GuiService_0.SelectedObject = v64.SelectedObject;
            l_GuiService_0.SelectedCoreObject = nil;
        else
            l_GuiService_0.SelectedCoreObject = v64.SelectedObject;
            l_GuiService_0.SelectedObject = nil;
            return ;
        end;
    end;
end;

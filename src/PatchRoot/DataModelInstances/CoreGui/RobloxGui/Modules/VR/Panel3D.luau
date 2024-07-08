local _ = game:GetService("UserInputService");
local l_VRService_0 = game:GetService("VRService");
local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local _ = l_RobloxGui_0:WaitForChild("Modules");
local _ = game:GetService("Players");
local v8 = require(l_RobloxGui_0.Modules.Settings.Utility);
local _ = game:GetService("GamepadService");
local v10 = require(l_RobloxGui_0.Modules.VR.VRUtil);
local _ = game:GetService("CorePackages");
local v12 = game:DefineFastFlag("VRFreeUIPanel", false);
local v13 = game:DefineFastFlag("VRHeadLockedFixUIPosition", false);
local v14 = "Panel3DRenderStep-" .. game:GetService("HttpService"):GenerateGUID();
local _ = CFrame.Angles(-1.5707963267948966, 3.141592653589793, 0);
local _ = Vector3.new(0, 0, 0);
local v17 = Vector2.new(0, 0);
local v18 = CFrame.new(0, -0.5, -5.5);
local v19 = CFrame.new(0, 0, -3);
local v20 = CFrame.new(0, 0, -0.1) * CFrame.Angles(0, 3.141592653589793, 0);
local v21 = nil;
local v22 = nil;
local l_huge_0 = math.huge;
local v24 = nil;
local v25 = nil;
local l_v17_0 = v17;
local v27 = nil;
local v28 = {};
local _ = CFrame.new();
local v30 = v8:Create("ImageLabel")({
    Image = "rbxasset://textures/Cursors/Gamepad/Pointer.png", 
    ImageColor3 = Color3.new(0, 1, 0), 
    BackgroundTransparency = 1, 
    ZIndex = 1000000000
});
local v31 = v8:Create("Folder")({
    Name = "VRCorePanelParts", 
    Archivable = false
});
local v32 = v8:Create("Folder")({
    Name = "VRCoreEffectParts", 
    Archivable = false
});
pcall(function()
    l_GuiService_0.CoreGuiFolder = v31;
    l_GuiService_0.CoreEffectFolder = v32;
end);
local v65 = {
    Type = {
        None = 0, 
        Standard = 1, 
        Fixed = 2, 
        HorizontalFollow = 3, 
        FixedToHead = 4, 
        NewStandard = 5, 
        WristView = 6, 
        PositionLocked = 7
    }, 
    OnPanelClosed = v8:Create("BindableEvent")({
        Name = "OnPanelClosed"
    }), 
    GetHeadLookXZ = function(v33)
        local l_l_VRService_0_UserCFrame_0 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
        local l_lookVector_0 = l_l_VRService_0_UserCFrame_0.lookVector;
        local v36 = CFrame.Angles(0, math.atan2(-l_lookVector_0.Z, l_lookVector_0.X) - 1.5707963267948966, 0);
        if v33 then
            v36 = v36 + l_l_VRService_0_UserCFrame_0.p;
        end;
        return v36;
    end, 
    FindContainerOf = function(v37)
        for _, v39 in pairs(v28) do
            if not v39.gui or not v39.gui:IsAncestorOf(v37) then
                for _, v41 in pairs(v39.subpanels) do
                    if not (not v41.gui or not v41.gui:IsAncestorOf(v37)) then
                        return v39;
                    end;
                end;
            else
                return v39;
            end;
        end;
        return nil;
    end, 
    SetModalPanel = function(v42)
        if v21 == v42 then
            return ;
        else
            if v21 then
                v21:OnModalChanged(false);
            end;
            if v42 then
                v42:OnModalChanged(true);
            end;
            v22 = v21;
            v21 = v42;
            return ;
        end;
    end, 
    RaycastOntoPanel = function(v43, v44, v45, v46)
        local l_Size_0 = v43.Size;
        local l_Z_0 = l_Size_0.Z;
        local l_X_0 = l_Size_0.X;
        local l_Y_0 = l_Size_0.Y;
        local l_v43_RenderCFrame_0 = v43:GetRenderCFrame();
        local l_lookVector_1 = l_v43_RenderCFrame_0.lookVector;
        local v53 = v8:RayPlaneIntersection(v46, l_lookVector_1, l_v43_RenderCFrame_0.p + (l_lookVector_1 * l_Z_0) * 0.5);
        if not v53 then
            return nil, nil, nil, false;
        else
            local l_X_1 = v44.AbsoluteSize.X;
            local l_Y_1 = v44.AbsoluteSize.Y;
            local v56 = l_v43_RenderCFrame_0:pointToObjectSpace(v53) * Vector3.new(-1, 1, 1) + Vector3.new(l_X_0 / 2, -l_Y_0 / 2, 0);
            local v57 = Vector2.new((v56.X / l_X_0) * l_X_1, (v56.Y / l_Y_0) * -l_Y_1);
            local l_X_2 = v57.X;
            local l_Y_2 = v57.Y;
            local l_X_3 = v45.AbsolutePosition.X;
            local l_Y_3 = v45.AbsolutePosition.Y;
            local l_X_4 = v45.AbsoluteSize.X;
            local l_Y_4 = v45.AbsoluteSize.Y;
            local v64 = false;
            if (((v44.Enabled and l_X_3 <= l_X_2) and l_X_2 <= l_X_3 + l_X_4) and l_Y_3 <= l_Y_2) and l_Y_2 <= l_Y_3 + l_Y_4 then
                v64 = true;
            end;
            return v53, v56, v57, v64;
        end;
    end
};
local v66 = {};
v66.__index = v66;
v66.new = function(v67)
    local v68 = {
        name = v67, 
        part = false, 
        gui = false, 
        width = 1, 
        height = 1, 
        isVisible = false, 
        isEnabled = false, 
        panelType = v65.Type.None, 
        pixelScale = 1, 
        showCursor = true, 
        canFade = true, 
        shouldFindLookAtGuiElement = false, 
        ignoreModal = false, 
        needsPositionUpdate = false, 
        alwaysUpdatePosition = false, 
        linkedTo = false, 
        subpanels = {}, 
        transparency = 0, 
        forceShowUntilLookedAt = false, 
        forceShowUntilTick = 0, 
        isLookedAt = false, 
        isWristHeldUp = false, 
        isOffscreen = true, 
        lookAtPixel = Vector2.new(-1, -1), 
        cursorPos = Vector2.new(-1, -1), 
        lookAtDistance = math.huge, 
        lookAtGuiElement = false, 
        isClosest = true, 
        localCF = CFrame.new(), 
        originCF = CFrame.new(), 
        angleFromHorizon = false, 
        angleFromForward = false, 
        distance = 0, 
        lerpTime = 0, 
        lerpInitialCF = nil, 
        lerpScaleSize = Vector2.new(0, 0), 
        lerpInitialSize = Vector2.new(0, 0), 
        FollowView = true, 
        LastFollowCF = nil, 
        LastCameraPos = Vector3.new(0, 0, 0), 
        followYawView = CFrame.new(), 
        userHeadRecentered = false, 
        lastHeadYaw = 0, 
        wristTargetPosition = Vector3.new()
    };
    if v28[v67] then
        error("A panel by the name of " .. v67 .. " already exists.");
    end;
    v28[v67] = v68;
    return (setmetatable(v68, v66));
end;
v66.GetPart = function(v69)
    if not v69.part then
        v69.part = v8:Create("Part")({
            Name = v69.name, 
            Parent = v31, 
            Transparency = 1, 
            CanCollide = false, 
            CanTouch = false, 
            Anchored = true, 
            Size = Vector3.new(1, 1, 0.2)
        });
    end;
    return v69.part;
end;
v66.GetGUI = function(v70)
    if not v70.gui then
        v70.gui = v8:Create("SurfaceGui")({
            Parent = l_CoreGui_0, 
            Name = v70.name, 
            Archivable = false, 
            Adornee = v70:GetPart(), 
            Active = true, 
            ToolPunchThroughDistance = 1000, 
            CanvasSize = v70.CanvasSize or Vector2.new(1000, 1000), 
            Enabled = v70.isEnabled, 
            AlwaysOnTop = true
        });
    end;
    return v70.gui;
end;
v66.FindHoveredGuiElement = function(v71, v72)
    local l_X_5 = v71.lookAtPixel.X;
    local l_Y_5 = v71.lookAtPixel.Y;
    for v75, v76 in pairs(v72) do
        local l_AbsolutePosition_0 = v76.AbsolutePosition;
        local v78 = v76.AbsolutePosition + v76.AbsoluteSize;
        if ((l_AbsolutePosition_0.X <= l_X_5 and l_X_5 <= v78.X) and l_AbsolutePosition_0.Y <= l_Y_5) and l_Y_5 <= v78.Y then
            return v76, v75;
        end;
    end;
end;
v66.SetPartCFrame = function(v79, v80)
    v79:GetPart().CFrame = v80 * v20;
end;
v66.SetEnabled = function(v81, v82)
    if v81.isEnabled == v82 then
        return ;
    else
        v81.isEnabled = v82;
        if not v82 then
            v81:GetPart().Parent = nil;
            v81:GetGUI().Enabled = false;
            for _, v84 in pairs(v81.subpanels) do
                v84:SetEnabled(v84:GetEnabled());
            end;
        else
            v81:GetPart().Parent = v31;
            v81:GetGUI().Enabled = true;
            for _, v86 in pairs(v81.subpanels) do
                v86:SetEnabled(v86:GetEnabled());
            end;
        end;
        v81:OnEnabled(v82);
        return ;
    end;
end;
v66.StartLerp = function(v87, v88)
    v87.lerpInitialCF = v87:GetPart().CFrame * CFrame.new(0, -1.5, 0);
    v87.lerpTime = 1;
    v87.lerpInitialSize = Vector2.new(v87.width, v87.height);
    v87.lerpScaleSize = not not v88 and v88 or Vector2.new(0, 0);
end;
v66.EvaluatePositioning = function(v89, v90, v91, v92, v93)
    if v89.panelType == v65.Type.Fixed then
        v89:SetPartCFrame(v90 * ((v89.localCF - v89.localCF.p) + v89.localCF.p * workspace.CurrentCamera.HeadScale));
    elseif v89.panelType == v65.Type.HorizontalFollow then
        v89:SetPartCFrame(v90 * (((CFrame.new(v92.p, v92.p + v92.lookVector * Vector3.new(1, 0, 1)) * v89.angleFromForward) * v89.angleFromHorizon) * CFrame.new(0, 0, workspace.CurrentCamera.HeadScale * -v89.distance)));
    elseif v89.panelType == v65.Type.FixedToHead then
        v89:SetPartCFrame(v91 * ((v89.localCF - v89.localCF.p) + v89.localCF.p * workspace.CurrentCamera.HeadScale));
    elseif v89.panelType == v65.Type.Standard then
        if not (not v89.needsPositionUpdate and not v89.alwaysUpdatePosition) then
            v89.needsPositionUpdate = false;
            v89.originCF = v65.GetHeadLookXZ(true) * CFrame.new(v18.Position * workspace.CurrentCamera.HeadScale);
        end;
        v89:SetPartCFrame((v90 * v89.originCF) * v89.localCF);
    elseif v89.panelType == v65.Type.NewStandard then
        if not (not v89.needsPositionUpdate and not v89.alwaysUpdatePosition) then
            v89.needsPositionUpdate = false;
            v89.originCF = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head) * CFrame.new(v19.Position * workspace.CurrentCamera.HeadScale);
        end;
        v89:SetPartCFrame((v90 * v89.originCF) * v89.localCF);
    elseif v89.panelType == v65.Type.WristView then
        if not l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
            v89:SetPartCFrame(v90 * ((v89.localCF - v89.localCF.p) + v89.localCF.p * workspace.CurrentCamera.HeadScale));
        else
            if not (not v89.needsPositionUpdate and not v89.alwaysUpdatePosition) then
                v89.needsPositionUpdate = false;
                v89.originCF = CFrame.new(l_VRService_0:GetUserCFrame(Enum.UserCFrame.LeftHand).Position * workspace.CurrentCamera.HeadScale);
            end;
            local v94 = v90 * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
            local l_Position_0 = (v90 * v89.originCF).Position;
            if v89.distance > 0 then
                l_Position_0 = Vector3.new(l_Position_0.x, v94.Position.y - 0.33, l_Position_0.z);
                l_Position_0 = v94.Position + (l_Position_0 - v94.Position).Unit * math.clamp((l_Position_0 - v94.Position).Magnitude, v89.distance - 0.5, v89.distance + 0.5);
            end;
            v89:GetPart().CFrame = CFrame.new(l_Position_0, (Vector3.new(v94.Position.x, l_Position_0.y, v94.Position.z)));
        end;
    elseif v89.panelType == v65.Type.PositionLocked then
        local v96 = v10.GetUserCFrameWorldSpace(Enum.UserCFrame.Head);
        if not v12 then
            if not v89.LastFollowCF then
                v89.LastFollowCF = v96;
            end;
            if (v89.LastCameraPos - v90.Position).Magnitude > 0.1 then
                v89.LastFollowCF = v96;
            end;
            v89.LastCameraPos = v90.Position;
            if v89.LastFollowCF.LookVector:Dot(v96.LookVector) < 0.85 then
                v89.FollowView = true;
            elseif v89.LastFollowCF.LookVector:Dot(v96.LookVector) > 0.99 then
                v89.FollowView = false;
            end;
            if v89.FollowView then
                v89.LastFollowCF = v89.LastFollowCF:Lerp(v96, 0.1);
            end;
            local v97 = v96.Position + v89.LastFollowCF.LookVector * (v89.distance * workspace.CurrentCamera.HeadScale + 0.1);
            v97 = Vector3.new(v97.X, v96.Position.Y - 0.5 * workspace.CurrentCamera.HeadScale, v97.Z);
            v89:GetPart().CFrame = CFrame.new(v97, (Vector3.new(v96.Position.x, v97.y, v96.Position.z)));
        else
            local v98 = nil;
            if not v13 or workspace.CurrentCamera.HeadLocked then
                v98 = v90 - v90.p;
            else
                v98 = v90 * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head):Inverse();
                v98 = v98 - v98.p;
            end;
            local _, v100, _ = (v96 * v98:Inverse()):ToEulerAnglesYXZ();
            local v102 = CFrame.fromEulerAnglesYXZ(0, v100, 0);
            if v89.userHeadRecentered then
                local v103 = v100 - v89.lastHeadYaw;
                local _, v105, _ = v89.followYawView:ToEulerAnglesYXZ();
                v89.followYawView = CFrame.fromEulerAnglesYXZ(0, v105 + v103, 0);
                v89.userHeadRecentered = false;
            end;
            if v89.followYawView.LookVector:Dot(v102.LookVector) < 0.85 then
                v89.FollowView = true;
            elseif v89.followYawView.LookVector:Dot(v102.LookVector) > 0.99 then
                v89.FollowView = false;
            end;
            if v89.FollowView then
                v89.followYawView = v89.followYawView:Lerp(v102, v93 * 3);
            end;
            local v107 = v98 * v89.followYawView;
            local v108 = v107 + ((v96.Position + v107.LookVector * (v89.distance * workspace.CurrentCamera.HeadScale)) - v107.UpVector * (0.5 * workspace.CurrentCamera.HeadScale));
            v89:SetPartCFrame(v108);
            v89.LastFollowCF = v108;
            v89.lastHeadYaw = v100;
        end;
    end;
    if v89.lerpInitialCF and v89.lerpTime > 0 then
        local l_CFrame_0 = v89:GetPart().CFrame;
        local _ = l_CFrame_0.Position + l_CFrame_0.LookVector;
        v89.lerpTime = v89.lerpTime - v93 * 4;
        local v111 = math.clamp(1 - v89.lerpTime, 0, 1);
        v89:GetPart().CFrame = v89.lerpInitialCF:Lerp(l_CFrame_0, v111);
        if not (v89.lerpScaleSize.x <= 0) or v89.lerpScaleSize.y > 0 then
            local v112 = v89.lerpInitialSize:Lerp(v89.lerpScaleSize, v111);
            v89:ResizeStuds(v112.x, v112.y, v89.pixelsPerStud);
        end;
    end;
end;
v66.OnRecentered = function(v113)
    v113.userHeadRecentered = true;
end;
v66.SetLookedAt = function(v114, v115)
    if v114.isLookedAt or not v115 then
        if not (not v114.isLookedAt or v115) then
            v114.isLookedAt = false;
            v114:OnMouseLeave(v114.lookAtPixel.X, v114.lookAtPixel.Y);
        end;
    else
        v114.isLookedAt = true;
        v114:OnMouseEnter(v114.lookAtPixel.X, v114.lookAtPixel.Y);
        if v114.forceShowUntilLookedAt then
            v114.forceShowUntilLookedAt = false;
            return ;
        end;
    end;
end;
v66.EvaluateGaze = function(v116, v117, v118, _, _, v121)
    v116.isClosest = false;
    v116.lookAtPixel = v17;
    v116.lookAtDistance = math.huge;
    local v122 = nil;
    local v123 = 0;
    for _, v125 in pairs(v116.subpanels) do
        if not (not v125.part or not v125.guiElement) then
            local v126, _, v128, v129 = v65.RaycastOntoPanel(v125.part, v125.gui, v125.guiElement, v121);
            if v126 then
                v125.lookAtPixel = v128;
                v125.cursorPos = v128;
                if v129 and v123 < v125.depthOffset then
                    v122 = v125;
                    v123 = v125.depthOffset;
                end;
            end;
        end;
    end;
    if v122 and v122.depthOffset > 0 then
        v25 = v122.gui;
        l_v17_0 = v122.cursorPos;
        v24 = v122;
        for _, v131 in pairs(v116.subpanels) do
            if v131 ~= v122 then
                v131:SetLookedAt(false);
            end;
        end;
        v122:SetLookedAt(true);
    end;
    if v116.panelType == v65.Type.WristView then
        v116.isWristHeldUp = false;
        local l_l_VRService_0_UserCFrame_1 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.LeftHand);
        local v133 = v117 * CFrame.new(l_l_VRService_0_UserCFrame_1.Position * workspace.CurrentCamera.HeadScale);
        if v116.distance == 0 then
            local v134 = v117 * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
            local l_Position_1 = v133.Position;
            l_Position_1 = Vector3.new(l_Position_1.x, v134.Position.y - 0.33, l_Position_1.z);
            v116.isWristHeldUp = ((v134.Position + (l_Position_1 - v134.Position).Unit * math.clamp((l_Position_1 - v134.Position).Magnitude, 0.5, 1)) - v133.Position).Magnitude < 0.25;
        else
            local l_l_VRService_0_UserCFrame_2 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.RightHand);
            if (l_l_VRService_0_UserCFrame_1.Position - (l_l_VRService_0_UserCFrame_2.Position + l_l_VRService_0_UserCFrame_2.LookVector * l_l_VRService_0_UserCFrame_2.LookVector:Dot(l_l_VRService_0_UserCFrame_1.Position - l_l_VRService_0_UserCFrame_2.Position))).Magnitude < 0.5 then
                v116.isWristHeldUp = true;
            end;
        end;
    end;
    local l_v116_GUI_0 = v116:GetGUI();
    local v138, _, v140, v141 = v65.RaycastOntoPanel(v116:GetPart(), l_v116_GUI_0, l_v116_GUI_0, v121);
    if not v138 then
        v116.isOffscreen = true;
        if v116.lookedAt then
            v116.lookedAt = false;
            v116:OnMouseLeave(v116.lookAtPixel.X, v116.lookAtPixel.Y);
        end;
    else
        v116.isOffscreen = false;
        v116.lookAtPixel = v140;
        v116.cursorPos = v140;
        v116:SetLookedAt(v141);
        v116.lookAtDistance = (v138 - v118.p).magnitude;
        if not (not (v116.isLookedAt and v116.lookAtDistance < l_huge_0) or not v116.showCursor) then
            l_huge_0 = v116.lookAtDistance;
            v24 = v116;
            if not v122 then
                v25 = v116.gui;
                l_v17_0 = v116.cursorPos;
                return ;
            end;
        end;
    end;
end;
v66.EvaluateTransparency = function(v142)
    if (v142.forceShowUntilLookedAt or not v142.canFade) or tick() < v142.forceShowUntilTick then
        v142.transparency = 0;
        return ;
    elseif not v142.isLookedAt then
        if not v142.isOffscreen then
            v142.transparency = v142:CalculateTransparency();
            return ;
        else
            v142.transparency = 1;
            return ;
        end;
    else
        v142.transparency = 0;
        return ;
    end;
end;
v66.Update = function(v143, v144, v145, v146, v147, v148, v149)
    if not (not (v143.forceShowUntilLookedAt or tick() < v143.forceShowUntilTick) or v143.part) then
        v143:GetPart();
        v143:GetGUI();
    end;
    if v143.part then
        local v150 = v21 == v143 or v143.linkedTo and v143.linkedTo == v21;
        if not v21 or v150 then
            v143:PreUpdate(v144, v145, v146, v147, v149);
            if not v143.isVisible then
                if v143.alwaysUpdatePosition then
                    v143:EvaluatePositioning(v144, v145, v146, v149);
                end;
                return ;
            else
                v143:EvaluatePositioning(v144, v145, v146, v149);
                for _, v152 in pairs(v143.subpanels) do
                    v152:Update();
                end;
                v143:EvaluateGaze(v144, v145, v146, v147, v148);
                v143:EvaluateTransparency(v144, v145);
                return ;
            end;
        else
            v143:SetEnabled(false);
            return ;
        end;
    else
        return ;
    end;
end;
v66.PreUpdate = function(_, _, _, _, _, _)
end;
v66.OnUpdate = function(_, _)
end;
v66.OnMouseEnter = function(_, _, _)
end;
v66.OnMouseLeave = function(_, _, _)
end;
v66.OnEnabled = function(_, _)
end;
v66.OnModalChanged = function(_, _)
end;
v66.OnVisibilityChanged = function(_, _)
end;
v66.CalculateTransparency = function(v173)
    if v173.canFade then
        local l_X_6 = v173.gui.AbsoluteSize.X;
        local l_Y_6 = v173.gui.AbsoluteSize.Y;
        local l_X_7 = v173.lookAtPixel.X;
        local l_Y_7 = v173.lookAtPixel.Y;
        local v178 = l_X_7 < 0 and -l_X_7 or l_X_7 - l_X_6;
        local v179 = l_Y_7 < 0 and -l_Y_7 or l_Y_7 - l_Y_6;
        if l_X_7 > 0 and l_X_7 < l_X_6 then
            v178 = 0;
        end;
        if l_Y_7 > 0 and l_Y_7 < l_Y_6 then
            v179 = 0;
        end;
        return (math.max(0, (math.min(1, (math.sqrt(v178 ^ 2 + v179 ^ 2) - 10) / 20))));
    else
        return 0;
    end;
end;
v66.ResizeStuds = function(v180, v181, v182, v183)
    v183 = v183 or 64;
    v180.width = v181;
    v180.height = v182;
    v180.pixelScale = v183 / 64;
    local l_v180_Part_0 = v180:GetPart();
    l_v180_Part_0.Size = Vector3.new(v180.width * workspace.CurrentCamera.HeadScale, v180.height * workspace.CurrentCamera.HeadScale, 0.2);
    local l_v180_GUI_0 = v180:GetGUI();
    l_v180_GUI_0.CanvasSize = Vector2.new(v183 * v180.width, v183 * v180.height);
    for _, v187 in pairs(v180.subpanels) do
        if v187.part then
            v187.part.Size = l_v180_Part_0.Size;
        end;
        if v187.gui then
            v187.gui.CanvasSize = l_v180_GUI_0.CanvasSize;
        end;
    end;
end;
v66.ResizePixels = function(v188, v189, v190, v191)
    v191 = v191 or 64;
    v188:ResizeStuds(v189 / v191, v190 / v191, v191);
end;
v66.OnHeadScaleChanged = function(v192)
    v192:ResizeStuds(v192.width, v192.height, v192.pixelScale * 64);
end;
v66.SetType = function(v193, v194, v195)
    v193.panelType = v194;
    v193.localCF = CFrame.new();
    v193.angleFromHorizon = false;
    v193.angleFromForward = false;
    v193.distance = 0;
    if not v195 then
        v195 = {};
    end;
    if v194 == v65.Type.None then
        return ;
    elseif v194 == v65.Type.Standard then
        v193.localCF = v195.CFrame or CFrame.new();
        return ;
    elseif v194 == v65.Type.Fixed then
        v193.localCF = v195.CFrame or CFrame.new();
        return ;
    elseif v194 == v65.Type.HorizontalFollow then
        v193.angleFromHorizon = CFrame.Angles(v195.angleFromHorizon or 0, 0, 0);
        v193.angleFromForward = CFrame.Angles(0, v195.angleFromForward or 0, 0);
        v193.distance = v195.distance or 5;
        return ;
    elseif v194 == v65.Type.FixedToHead then
        v193.localCF = v195.CFrame or CFrame.new();
        return ;
    elseif v194 == v65.Type.NewStandard then
        v193.localCF = v195.CFrame or CFrame.new();
        return ;
    elseif v194 == v65.Type.WristView then
        v193.localCF = v195.CFrame or CFrame.new();
        v193.distance = 0;
        return ;
    elseif v194 == v65.Type.PositionLocked then
        v193.localCF = v195.CFrame or CFrame.new();
        return ;
    else
        error("Invalid Panel type");
        return ;
    end;
end;
v66.IsPositionLockedType = function(v196)
    return v196.panelType == v65.Type.PositionLocked;
end;
v66.SetVisible = function(v197, v198, v199)
    if v198 ~= v197.isVisible then
        v197:OnVisibilityChanged(v198);
        if v198 then
            v197.needsPositionUpdate = true;
            if v197.panelType == v65.Type.WristView then
                v197.originCF = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head) * v19;
            end;
        else
            v65.OnPanelClosed:Fire(v197.name);
        end;
    end;
    v197.isVisible = v198;
    v197:SetEnabled(v198);
    if not (not v198 or not v199) then
        v65.SetModalPanel(v197);
    end;
    if not v198 and v21 == v197 then
        if not v199 then
            v65.SetModalPanel(nil);
            if v22 == v197 then
                v22 = nil;
            end;
        else
            v65.SetModalPanel(v22);
        end;
    end;
    if not (v198 or not v197.forceShowUntilLookedAt) then
        v197.forceShowUntilLookedAt = false;
    end;
end;
v66.IsVisible = function(v200)
    return v200.isVisible;
end;
v66.LinkTo = function(v201, v202)
    if type(v202) == "string" then
        v201.linkedTo = v65.Get(v202);
        return ;
    else
        v201.linkedTo = v202;
        return ;
    end;
end;
v66.ForceShowUntilLookedAt = function(v203, v204)
    v203:GetPart();
    v203:GetGUI();
    v203:SetVisible(true, v204);
    v203:RequestPositionUpdate();
    v203.forceShowUntilLookedAt = true;
end;
v66.ForceShowForSeconds = function(v205, v206)
    v205:GetPart();
    v205:GetGUI();
    v205:SetVisible(true);
    if v205.forceShowUntilTick < tick() then
        v205:RequestPositionUpdate();
    end;
    v205.forceShowUntilTick = tick() + v206;
end;
v66.SetCanFade = function(v207, v208)
    v207.canFade = v208;
end;
v66.RequestPositionUpdate = function(v209)
    v209.needsPositionUpdate = true;
end;
v66.ForcePositionUpdate = function(v210, v211)
    v210.alwaysUpdatePosition = v211;
end;
v66.GetGuiPositionInPanelSpace = function(v212, v213)
    local v214 = Vector2.new(v212.part.Size.X, v212.part.Size.Y);
    local l_AbsoluteSize_0 = v212.gui.AbsoluteSize;
    local v216 = ((v213 - l_AbsoluteSize_0 / 2) / l_AbsoluteSize_0) * v214;
    return (Vector3.new(v216.X, v216.Y, 0.1));
end;
v66.GetCFrameInCameraSpace = function(v217)
    if not (v217.panelType ~= v65.Type.Standard) or v217.panelType == v65.Type.NewStandard then
        return v217.originCF * v217.localCF;
    else
        return v217.localCF or CFrame.new();
    end;
end;
local v218 = {};
v218.__index = v218;
v218.new = function(v219, v220)
    local v221 = {
        parentPanel = v219, 
        guiElement = v220, 
        lastParent = v220.Parent, 
        ancestryConn = nil, 
        changedConn = nil, 
        lookAtPixel = Vector2.new(-1, -1), 
        cursorPos = Vector2.new(-1, -1), 
        lookedAt = false, 
        isEnabled = true, 
        part = nil, 
        gui = nil, 
        guiSurrogate = nil, 
        depthOffset = 0
    };
    setmetatable(v221, v218);
    v221:GetGUI();
    v221:UpdateSurrogate();
    v221:WatchParent(v221.lastParent);
    v220.Parent = v221.guiSurrogate;
    local function v222(_, v224)
        v221:GetGUI().Enabled = v221.parentPanel:GetGUI():IsAncestorOf(v221.lastParent);
        if v221:GetGUI().Enabled then
            v221:GetPart().Parent = workspace.CurrentCamera;
        else
            v221:GetPart().Parent = nil;
        end;
        if v224 == v220 then
            v221.ancestryConn:disconnect();
            v221.lastParent = v220.Parent;
            v220.Parent = v221.guiSurrogate;
            v221:WatchParent(v221.lastParent);
            v221.ancestryConn = v220.AncestryChanged:connect(v222);
        end;
    end;
    v221.ancestryConn = v220.AncestryChanged:connect(v222);
    return v221;
end;
v218.Cleanup = function(v225)
    v225.guiElement.Parent = v225.lastParent;
    if v225.part then
        v225.part:Destroy();
        v225.part = nil;
    end;
    spawn(function()
        wait();
        if v225.gui then
            v225.gui:Destroy();
            v225.gui = nil;
        end;
    end);
    if v225.ancestryConn then
        v225.ancestryConn:disconnect();
        v225.ancestryConn = nil;
    end;
    if v225.changedConn then
        v225.changedConn:disconnect();
        v225.changedConn = nil;
    end;
    v225.lastParent = nil;
    v225.parentPanel = nil;
    v225.guiElement = nil;
    v225.guiSurrogate = nil;
end;
v218.OnMouseEnter = function(_, _, _)
end;
v218.OnMouseLeave = function(_, _, _)
end;
v218.SetLookedAt = function(v232, v233)
    if not v233 or v232.lookedAt then
        if not (v233 or not v232.lookedAt) then
            v232:OnMouseLeave(v232.lookAtPixel.X, v232.lookAtPixel.Y);
        end;
    else
        v232:OnMouseEnter(v232.lookAtPixel.X, v232.lookAtPixel.Y);
    end;
    v232.lookedAt = v233;
end;
v218.WatchParent = function(v234, v235)
    if v234.changedConn then
        v234.changedConn:disconnect();
    end;
    v234.changedConn = v235.Changed:connect(function(v236)
        if not (v236 ~= "AbsolutePosition" and v236 ~= "AbsoluteSize") or v236 == "Parent" then
            v234:UpdateSurrogate();
        end;
    end);
end;
v218.UpdateSurrogate = function(v237)
    local l_lastParent_0 = v237.lastParent;
    v237.guiSurrogate.Position = UDim2.new(0, l_lastParent_0.AbsolutePosition.X, 0, l_lastParent_0.AbsolutePosition.Y);
    v237.guiSurrogate.Size = UDim2.new(0, l_lastParent_0.AbsoluteSize.X, 0, l_lastParent_0.AbsoluteSize.Y);
end;
v218.GetPart = function(v239)
    if not v239.part then
        v239.part = v239.parentPanel:GetPart():Clone();
        v239.part.Parent = v31;
        return v239.part;
    else
        return v239.part;
    end;
end;
v218.GetGUI = function(v240)
    if not v240.gui then
        v240.gui = v8:Create("SurfaceGui")({
            Parent = l_CoreGui_0, 
            Adornee = v240:GetPart(), 
            Active = true, 
            ToolPunchThroughDistance = 1000, 
            CanvasSize = v240.parentPanel:GetGUI().CanvasSize, 
            Enabled = v240.parentPanel.isEnabled, 
            AlwaysOnTop = true
        });
        v240.guiSurrogate = v8:Create("Frame")({
            Parent = v240.gui, 
            Active = false, 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        });
        return v240.gui;
    else
        return v240.gui;
    end;
end;
v218.SetDepthOffset = function(v241, v242)
    v241.depthOffset = v242;
end;
v218.Update = function(v243)
    local l_v243_Part_0 = v243:GetPart();
    local l_Part_0 = v243.parentPanel:GetPart();
    if not (not l_v243_Part_0 or not l_Part_0) then
        l_v243_Part_0.CFrame = l_Part_0.CFrame * CFrame.new(0, 0, -v243.depthOffset);
    end;
end;
v218.SetEnabled = function(v246, v247)
    v246.isEnabled = v247;
    if not v247 or not v246.parentPanel.isEnabled then
        v246:GetPart().Parent = nil;
        v246:GetGUI().Enabled = false;
        return ;
    else
        v246:GetPart().Parent = v31;
        v246:GetGUI().Enabled = true;
        return ;
    end;
end;
v218.GetEnabled = function(v248)
    return v248.isEnabled;
end;
v218.GetPixelScale = function(v249)
    return v249.parentPanel:GetPixelScale();
end;
v66.GetPixelScale = function(v250)
    return v250.pixelScale;
end;
v66.AddSubpanel = function(v251, v252)
    local v253 = v218.new(v251, v252);
    v251.subpanels[v252] = v253;
    return v253;
end;
v66.RemoveSubpanel = function(v254, v255)
    local v256 = v254.subpanels[v255];
    if v256 then
        v256:Cleanup();
    end;
    v254.subpanels[v255] = nil;
end;
v66.SetSubpanelDepth = function(v257, v258, v259)
    local v260 = v257.subpanels[v258];
    if v259 == 0 then
        if v260 then
            v257:RemoveSubpanel(v258);
        end;
        return nil;
    else
        if not v260 then
            v260 = v257:AddSubpanel(v258);
        end;
        v260:SetDepthOffset(v259);
        return v260;
    end;
end;
v65.Get = function(v261)
    local v262 = v28[v261];
    if not v28[v261] then
        v28[v261] = v66.new(v261);
        v262 = v28[v261];
    end;
    return v262;
end;
local v263 = tick();
local function v286()
    if l_VRService_0.VREnabled then
        local v264 = tick();
        local v265 = v264 - v263;
        v263 = v264;
        v24 = nil;
        l_huge_0 = math.huge;
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        local l_CFrame_1 = l_CurrentCamera_0.CFrame;
        local l_l_CurrentCamera_0_RenderCFrame_0 = l_CurrentCamera_0:GetRenderCFrame();
        local l_l_VRService_0_UserCFrame_3 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
        local v270 = Ray.new(l_l_CurrentCamera_0_RenderCFrame_0.p, l_l_CurrentCamera_0_RenderCFrame_0.lookVector);
        local v271 = l_CFrame_1 * l_VRService_0:GetUserCFrame(l_VRService_0.GuiInputUserCFrame);
        local v272 = Ray.new(v271.p, v271.lookVector);
        for _, v274 in pairs(v28) do
            v274:Update(l_CFrame_1, l_l_CurrentCamera_0_RenderCFrame_0, l_l_VRService_0_UserCFrame_3, v270, v272, v265);
        end;
        local v275 = {};
        for _, v277 in pairs(v28) do
            if not (((v275[v277] or not v277.linkedTo) or not v277.isVisible) or not v277.linkedTo.isVisible) then
                v275[v277] = true;
                v275[v277.linkedTo] = true;
                local v278 = math.min(v277.transparency, v277.linkedTo.transparency);
                v277.transparency = v278;
                v277.linkedTo.transparency = v278;
            end;
        end;
        for _, v280 in pairs(v28) do
            if not (not v280.part or not v280.gui) then
                local v281 = v21 == v280 or v280.linkedTo and v280.linkedTo == v21;
                local l_isVisible_0 = v280.isVisible;
                if not (v281 or not v21) then
                    l_isVisible_0 = false;
                end;
                if v280.transparency >= 1 then
                    l_isVisible_0 = false;
                end;
                if v280.forceShowUntilLookedAt then
                    l_isVisible_0 = true;
                end;
                if not (v280.canFade or not v280.isVisible) then
                    l_isVisible_0 = true;
                end;
                v280:SetEnabled(l_isVisible_0);
            end;
            v280:OnUpdate(v265);
        end;
        if not v24 then
            v30.Parent = nil;
        else
            local l_X_8 = l_v17_0.X;
            local l_Y_8 = l_v17_0.Y;
            local l_v24_PixelScale_0 = v24:GetPixelScale();
            v30.Size = UDim2.new(0, 3 * l_v24_PixelScale_0, 0, 3 * l_v24_PixelScale_0);
            v30.Position = UDim2.new(0, l_X_8 - v30.AbsoluteSize.x * 0.5, 0, l_Y_8 - v30.AbsoluteSize.y * 0.5);
        end;
        v27 = v24;
        return ;
    else
        return ;
    end;
end;
local v287 = true;
local function _(v288)
    v31.Parent = v288;
    v32.Parent = v288;
end;
local v290 = nil;
local function v293()
    for _, v292 in pairs(v28) do
        v292:OnHeadScaleChanged();
    end;
end;
local v294 = nil;
local function v304()
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    local l_CFrame_2 = l_CurrentCamera_1.CFrame;
    local l_l_CurrentCamera_1_RenderCFrame_0 = l_CurrentCamera_1:GetRenderCFrame();
    local l_l_VRService_0_UserCFrame_4 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
    local v299 = Ray.new(l_l_CurrentCamera_1_RenderCFrame_0.p, l_l_CurrentCamera_1_RenderCFrame_0.lookVector);
    local v300 = l_CFrame_2 * l_VRService_0:GetUserCFrame(l_VRService_0.GuiInputUserCFrame);
    local v301 = Ray.new(v300.p, v300.lookVector);
    for _, v303 in pairs(v28) do
        v303:Update(l_CFrame_2, l_l_CurrentCamera_1_RenderCFrame_0, l_l_VRService_0_UserCFrame_4, v299, v301, 0);
    end;
end;
local function v308()
    for _, v306 in pairs(v28) do
        v306:OnHeadScaleChanged();
    end;
    if v290 then
        v290:disconnect();
    end;
    v290 = workspace.CurrentCamera:GetPropertyChangedSignal("HeadScale"):Connect(v293);
    if v294 then
        v294:disconnect();
    end;
    v294 = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(v304);
    if not (not l_VRService_0.VREnabled or not v287) then
        local l_CurrentCamera_2 = workspace.CurrentCamera;
        v31.Parent = l_CurrentCamera_2;
        v32.Parent = l_CurrentCamera_2;
    end;
end;
local v309 = nil;
local v310 = false;
local v311 = nil;
local function v317()
    if not l_VRService_0.VREnabled then
        if v309 then
            v309:disconnect();
            v309 = nil;
        end;
        if not (not v12 or not v311) then
            v311:disconnect();
            v311 = nil;
        end;
        v31.Parent = nil;
        v32.Parent = nil;
        if v310 then
            l_RunService_0:UnbindFromRenderStep(v14);
            v310 = false;
        end;
    else
        while not v287 do
            wait();
        end;
        if workspace.CurrentCamera then
            v308();
        end;
        v309 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(v308);
        local l_CurrentCamera_3 = workspace.CurrentCamera;
        v31.Parent = l_CurrentCamera_3;
        v32.Parent = l_CurrentCamera_3;
        if not v310 then
            l_RunService_0:BindToRenderStep(v14, Enum.RenderPriority.Last.Value, v286);
            v310 = true;
        end;
        if v12 then
            v311 = l_VRService_0.UserCFrameChanged:Connect(function(v313, _)
                if v313 == Enum.UserCFrame.Floor then
                    for _, v316 in pairs(v28) do
                        v316:OnRecentered();
                    end;
                end;
            end);
            return ;
        end;
    end;
end;
l_VRService_0:GetPropertyChangedSignal("VREnabled"):connect(v317);
spawn(v317);
coroutine.wrap(function()
    while true do
        if not workspace.CurrentCamera then
            wait();
            continue;
        end;
        if workspace.CurrentCamera.CameraSubject == nil and workspace.CurrentCamera.CameraType ~= Enum.CameraType.Scriptable then
            workspace.CurrentCamera.Changed:Wait();
        else
            break;
        end;
    end;
    v287 = true;
end)();
return v65;

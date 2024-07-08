local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.Parent.React);
local v3 = require(l_Parent_0.Constants);
local v4 = require(l_Parent_1.UIBloxConfig);
local function v9(v5, v6)
    local l_v6_UserCFrame_0 = v6:GetUserCFrame(v5);
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if not l_CurrentCamera_0.HeadLocked then
        l_v6_UserCFrame_0 = v6:GetUserCFrame(Enum.UserCFrame.Head):Inverse() * l_v6_UserCFrame_0;
    end;
    return l_CurrentCamera_0.CFrame * (CFrame.new(l_v6_UserCFrame_0.p * l_CurrentCamera_0.HeadScale) * (l_v6_UserCFrame_0 - l_v6_UserCFrame_0.p));
end;
return function(v10, v11)
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    if v4.refactorPanel3D then
        local v16, v17 = v2.useBinding((Vector3.new(v10.partSize.X, v10.partSize.Y, 0.05)));
        v12 = v16;
        v13 = v17;
        v16, v17 = v2.useBinding(v10.offset * CFrame.Angles(math.rad(v10.tilt), 0, 0));
        v14 = v16;
        v15 = v17;
    end;
    local v18 = v2.useRef(v10.offset);
    local v19 = v2.useRef(nil);
    local v20 = v2.useRef(false);
    local l_vrService_0 = v10.vrService;
    v2.useEffect(function()
        v18.current = v10.offset;
    end, {});
    local v35 = v2.useCallback(function(v22)
        local l_CurrentCamera_1 = workspace.CurrentCamera;
        local v24 = nil;
        local l_CFrame_0 = l_CurrentCamera_1.CFrame;
        local l_HeadScale_0 = l_CurrentCamera_1.HeadScale;
        local v27 = nil;
        if v10.anchoring == v3.AnchoringTypes.Head then
            v27 = l_vrService_0:GetUserCFrame(Enum.UserCFrame.Head);
            local v28 = v9(Enum.UserCFrame.Head, l_vrService_0);
            if v19.current == nil then
                v19.current = v28;
            end;
            assert(v19.current ~= nil, "lastLookCFrame should not be nil.");
            if v19.current.LookVector:Dot(v28.LookVector) < 0.85 then
                v20.current = true;
            elseif v19.current.LookVector:Dot(v28.LookVector) > 0.99 then
                v20.current = false;
            end;
            if v20.current then
                v19.current = v19.current:Lerp(v28, 7.2 * v22);
            end;
            v24 = v28.Position + (v19.current.LookVector * l_HeadScale_0) * 2;
            v24 = Vector3.new(v24.X, v28.Position.Y, v24.Z);
            local l_alignedPanel_0 = v10.alignedPanel;
            if l_alignedPanel_0 then
                local l_l_alignedPanel_0_Part_0 = l_alignedPanel_0:GetPart();
                if (l_l_alignedPanel_0_Part_0 and l_alignedPanel_0:IsPositionLockedType()) and (l_alignedPanel_0:IsVisible() or l_alignedPanel_0.alwaysUpdatePosition) then
                    v24 = Vector3.new(l_l_alignedPanel_0_Part_0.Position.X, v28.Position.Y - 0.4 * l_HeadScale_0, l_l_alignedPanel_0_Part_0.Position.Z);
                end;
            end;
        elseif v10.anchoring == v3.AnchoringTypes.Wrist then
            if l_vrService_0:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and l_vrService_0.GuiInputUserCFrame == Enum.UserCFrame.LeftHand then
                v27 = l_vrService_0:GetUserCFrame(Enum.UserCFrame.RightHand);
            elseif l_vrService_0:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
                v27 = l_vrService_0:GetUserCFrame(Enum.UserCFrame.LeftHand);
            end;
            if not v27 then
                v27 = l_vrService_0:GetUserCFrame(Enum.UserCFrame.Head);
            end;
            v24 = (l_CFrame_0 * CFrame.new(v27.Position * l_HeadScale_0)).Position;
        else
            return ;
        end;
        if v10.offsetCallback then
            v24 = v10.offsetCallback({
                finalPosition = v24, 
                cameraHeadScale = l_HeadScale_0
            });
        end;
        if v10.lerp and v18.current ~= nil then
            v18.current = v18.current:Lerp(v10.offset, 7.2 * v22);
        else
            v18.current = v10.offset;
        end;
        local v31 = nil;
        if v18.current ~= nil then
            if not v10.faceCamera then
                local v32, v33, v34 = v27:ToOrientation();
                v31 = (CFrame.new(v24) * CFrame.Angles(-v32, v33, -v34)) * CFrame.new(v18.current.Position * l_HeadScale_0);
            else
                v31 = CFrame.new(v24 + v18.current.Position * l_HeadScale_0, v9(Enum.UserCFrame.Head, l_vrService_0).Position);
            end;
        end;
        if v10.tiltCallback then
            v31 = v10.tiltCallback({
                panelCFrame = v31, 
                cameraHeadScale = l_HeadScale_0
            });
        end;
        if not v4.refactorPanel3D then
            if v11.current ~= nil then
                v11.current.CFrame = v31;
                v11.current.Size = Vector3.new(v10.partSize.X * l_HeadScale_0, v10.partSize.Y * l_HeadScale_0, 0.05);
            end;
            return ;
        else
            v15(v31);
            v13((Vector3.new(v10.partSize.X * l_HeadScale_0, v10.partSize.Y * l_HeadScale_0, 0.05)));
            return ;
        end;
    end, {
        v10.anchoring, 
        v10.faceCamera, 
        v10.lerp, 
        v10.offset, 
        v10.partSize, 
        v10.alignedPanel, 
        v10.offsetCallback, 
        v10.tiltCallback
    });
    v2.useEffect(function()
        if v10.anchoring ~= v3.AnchoringTypes.World then
            local v36 = nil;
            local v37 = nil;
            local v38 = nil;
            local function v39()
                if v36 then
                    v36:Disconnect();
                end;
                if workspace.CurrentCamera then
                    v36 = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function()
                        v35(0);
                    end);
                end;
            end;
            v38 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(v39);
            v39();
            if v10.alignedPanel then
                local l_Part_0 = v10.alignedPanel:GetPart();
                if l_Part_0 then
                    v37 = l_Part_0:GetPropertyChangedSignal("CFrame"):Connect(function()
                        v35(0);
                    end);
                end;
            end;
            local v41 = v10.movementUpdateEvent:Connect(v35);
            return function()
                v41:Disconnect();
                v38:Disconnect();
                if v36 then
                    v36:Disconnect();
                end;
                if v37 then
                    v37:Disconnect();
                end;
            end;
        else
            return function()
            end;
        end;
    end, {
        v10.anchoring, 
        v35
    });
    return v12, v14;
end;

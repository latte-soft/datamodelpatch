local l_RunService_0 = game:GetService("RunService");
local l_game_EngineFeature_0 = game:GetEngineFeature("AvatarJointUpgradeFeature");
local v2 = {};
local v3 = {
    UpperAngle = 45, 
    TwistLowerAngle = -40, 
    TwistUpperAngle = 40, 
    FrictionTorque = 400, 
    StrengthTorque = 400, 
    ReferenceMass = 1.0249234437943
};
local v4 = {
    UpperAngle = 20, 
    TwistLowerAngle = -40, 
    TwistUpperAngle = 20, 
    FrictionTorque = 750, 
    StrengthTorque = 5000, 
    ReferenceMass = 2.861558675766
};
local v5 = {
    UpperAngle = 10, 
    TwistLowerAngle = -10, 
    TwistUpperAngle = 10, 
    StrengthTorque = 400, 
    ReferenceMass = 0.43671694397926
};
local v6 = {
    UpperAngle = 20, 
    TwistLowerAngle = 5, 
    TwistUpperAngle = 120, 
    StrengthTorque = 1200, 
    ReferenceMass = 0.70196455717087
};
local v7 = {
    UpperAngle = 30, 
    TwistLowerAngle = -10, 
    TwistUpperAngle = 10, 
    StrengthTorque = 400, 
    ReferenceMass = 0.69132566452026
};
local v8 = {
    UpperAngle = 5, 
    TwistLowerAngle = -120, 
    TwistUpperAngle = -5, 
    StrengthTorque = 2000, 
    ReferenceMass = 0.65389388799667
};
local v9 = {
    UpperAngle = 110, 
    TwistLowerAngle = -85, 
    TwistUpperAngle = 85, 
    FrictionTorque = 600, 
    StrengthTorque = 4000, 
    ReferenceMass = 0.90918225049973
};
local v10 = {
    UpperAngle = 40, 
    TwistLowerAngle = -5, 
    TwistUpperAngle = 80, 
    FrictionTorque = 600, 
    StrengthTorque = 4000, 
    ReferenceMass = 1.9175016880035
};
local v11 = {
    UpperAngle = 30, 
    TwistLowerAngle = -40, 
    TwistUpperAngle = 40
};
local v12 = {
    UpperAngle = 110, 
    TwistLowerAngle = -85, 
    TwistUpperAngle = 85
};
local v13 = {
    UpperAngle = 40, 
    TwistLowerAngle = -5, 
    TwistUpperAngle = 80
};
local v14 = Vector3.new();
local v15 = Vector3.new(0, 1, 0);
local v16 = Vector3.new(0, -1, 0);
local v17 = Vector3.new(1, 0, 0);
local v18 = Vector3.new(-1, 0, 0);
local v19 = {
    {
        "UpperTorso", 
        "RightShoulderRagdollAttachment", 
        CFrame.fromMatrix(v14, v17, v15), 
        "RightShoulderRigAttachment"
    }, 
    {
        "RightUpperArm", 
        "RightShoulderRagdollAttachment", 
        CFrame.fromMatrix(v14, v16, v17), 
        "RightShoulderRigAttachment"
    }, 
    {
        "UpperTorso", 
        "LeftShoulderRagdollAttachment", 
        CFrame.fromMatrix(v14, v18, v15), 
        "LeftShoulderRigAttachment"
    }, 
    {
        "LeftUpperArm", 
        "LeftShoulderRagdollAttachment", 
        CFrame.fromMatrix(v14, v16, v18), 
        "LeftShoulderRigAttachment"
    }
};
local v20 = {
    {
        "UpperTorso", 
        "Head", 
        "NeckRigAttachment", 
        v3
    }, 
    {
        "LowerTorso", 
        "UpperTorso", 
        "WaistRigAttachment", 
        v4
    }, 
    {
        "UpperTorso", 
        "LeftUpperArm", 
        "LeftShoulderRagdollAttachment", 
        v9
    }, 
    {
        "LeftUpperArm", 
        "LeftLowerArm", 
        "LeftElbowRigAttachment", 
        v6
    }, 
    {
        "LeftLowerArm", 
        "LeftHand", 
        "LeftWristRigAttachment", 
        v7
    }, 
    {
        "UpperTorso", 
        "RightUpperArm", 
        "RightShoulderRagdollAttachment", 
        v9
    }, 
    {
        "RightUpperArm", 
        "RightLowerArm", 
        "RightElbowRigAttachment", 
        v6
    }, 
    {
        "RightLowerArm", 
        "RightHand", 
        "RightWristRigAttachment", 
        v7
    }, 
    {
        "LowerTorso", 
        "LeftUpperLeg", 
        "LeftHipRigAttachment", 
        v10
    }, 
    {
        "LeftUpperLeg", 
        "LeftLowerLeg", 
        "LeftKneeRigAttachment", 
        v8
    }, 
    {
        "LeftLowerLeg", 
        "LeftFoot", 
        "LeftAnkleRigAttachment", 
        v5
    }, 
    {
        "LowerTorso", 
        "RightUpperLeg", 
        "RightHipRigAttachment", 
        v10
    }, 
    {
        "RightUpperLeg", 
        "RightLowerLeg", 
        "RightKneeRigAttachment", 
        v8
    }, 
    {
        "RightLowerLeg", 
        "RightFoot", 
        "RightAnkleRigAttachment", 
        v5
    }
};
local v21 = {
    {
        "LowerTorso", 
        "LeftUpperArm"
    }, 
    {
        "LeftUpperArm", 
        "LeftHand"
    }, 
    {
        "LowerTorso", 
        "RightUpperArm"
    }, 
    {
        "RightUpperArm", 
        "RightHand"
    }, 
    {
        "LeftUpperLeg", 
        "RightUpperLeg"
    }, 
    {
        "UpperTorso", 
        "RightUpperLeg"
    }, 
    {
        "RightUpperLeg", 
        "RightFoot"
    }, 
    {
        "UpperTorso", 
        "LeftUpperLeg"
    }, 
    {
        "LeftUpperLeg", 
        "LeftFoot"
    }, 
    {
        "UpperTorso", 
        "LeftLowerLeg"
    }, 
    {
        "UpperTorso", 
        "RightLowerLeg"
    }, 
    {
        "LowerTorso", 
        "LeftLowerLeg"
    }, 
    {
        "LowerTorso", 
        "RightLowerLeg"
    }, 
    {
        "UpperTorso", 
        "LeftLowerArm"
    }, 
    {
        "UpperTorso", 
        "RightLowerArm"
    }, 
    {
        "Head", 
        "LeftUpperArm"
    }, 
    {
        "Head", 
        "RightUpperArm"
    }
};
local v22 = {
    {
        "Waist", 
        "UpperTorso"
    }, 
    {
        "Neck", 
        "Head"
    }, 
    {
        "LeftShoulder", 
        "LeftUpperArm"
    }, 
    {
        "LeftElbow", 
        "LeftLowerArm"
    }, 
    {
        "LeftWrist", 
        "LeftHand"
    }, 
    {
        "RightShoulder", 
        "RightUpperArm"
    }, 
    {
        "RightElbow", 
        "RightLowerArm"
    }, 
    {
        "RightWrist", 
        "RightHand"
    }, 
    {
        "LeftHip", 
        "LeftUpperLeg"
    }, 
    {
        "LeftKnee", 
        "LeftLowerLeg"
    }, 
    {
        "LeftAnkle", 
        "LeftFoot"
    }, 
    {
        "RightHip", 
        "RightUpperLeg"
    }, 
    {
        "RightKnee", 
        "RightLowerLeg"
    }, 
    {
        "RightAnkle", 
        "RightFoot"
    }
};
local v23 = {
    {
        "Head", 
        "NeckAttachment", 
        CFrame.new(0, -0.5, 0)
    }, 
    {
        "Torso", 
        "RightShoulderRagdollAttachment", 
        CFrame.fromMatrix(Vector3.new(1, 0.5, 0), v17, v15)
    }, 
    {
        "Right Arm", 
        "RightShoulderRagdollAttachment", 
        CFrame.fromMatrix(Vector3.new(-0.5, 0.5, 0), v16, v17)
    }, 
    {
        "Torso", 
        "LeftShoulderRagdollAttachment", 
        CFrame.fromMatrix(Vector3.new(-1, 0.5, 0), v18, v15)
    }, 
    {
        "Left Arm", 
        "LeftShoulderRagdollAttachment", 
        CFrame.fromMatrix(Vector3.new(0.5, 0.5, 0), v16, v18)
    }, 
    {
        "Torso", 
        "RightHipAttachment", 
        CFrame.new(0.5, -1, 0)
    }, 
    {
        "Right Leg", 
        "RightHipAttachment", 
        CFrame.new(0, 1, 0)
    }, 
    {
        "Torso", 
        "LeftHipAttachment", 
        CFrame.new(-0.5, -1, 0)
    }, 
    {
        "Left Leg", 
        "LeftHipAttachment", 
        CFrame.new(0, 1, 0)
    }
};
local v24 = {
    {
        "Torso", 
        "Head", 
        "NeckAttachment", 
        v11
    }, 
    {
        "Torso", 
        "Left Leg", 
        "LeftHipAttachment", 
        v13
    }, 
    {
        "Torso", 
        "Right Leg", 
        "RightHipAttachment", 
        v13
    }, 
    {
        "Torso", 
        "Left Arm", 
        "LeftShoulderRagdollAttachment", 
        v12
    }, 
    {
        "Torso", 
        "Right Arm", 
        "RightShoulderRagdollAttachment", 
        v12
    }
};
local v25 = {
    {
        "Left Leg", 
        "Right Leg"
    }, 
    {
        "Head", 
        "Right Arm"
    }, 
    {
        "Head", 
        "Left Arm"
    }
};
local v26 = {
    {
        "Neck", 
        "Torso"
    }, 
    {
        "Left Shoulder", 
        "Torso"
    }, 
    {
        "Right Shoulder", 
        "Torso"
    }, 
    {
        "Left Hip", 
        "Torso"
    }, 
    {
        "Right Hip", 
        "Torso"
    }
};
local function v32(v27)
    local v28 = {};
    for _, v30 in ipairs(v27:GetChildren()) do
        if v30:IsA("BasePart") then
            local l_name_0 = v30.name;
            if not v28[l_name_0] then
                v28[l_name_0] = v30;
            end;
        end;
    end;
    return v28;
end;
local function v53(v33, v34, v35)
    if v35 then
        local l_AnimationConstraint_0 = Instance.new("AnimationConstraint");
        l_AnimationConstraint_0.Name = "Root";
        l_AnimationConstraint_0.Attachment0 = v33.HumanoidRootPart.RootRigAttachment;
        l_AnimationConstraint_0.Attachment1 = v33.LowerTorso.RootRigAttachment;
        l_AnimationConstraint_0.IsKinematic = true;
        v33.LowerTorso.Root:Destroy();
        l_AnimationConstraint_0.Parent = v33.LowerTorso;
    end;
    for _, v38 in ipairs(v34) do
        local v39, v40, v41, v42 = unpack(v38);
        local v43 = v33[v39];
        local v44 = v33[v40];
        if not (not v43 or not v44) then
            local l_v43_FirstChild_0 = v43:FindFirstChild(v41);
            local l_v44_FirstChild_0 = v44:FindFirstChild(v41);
            if not (((not l_v43_FirstChild_0 or not l_v44_FirstChild_0) or not l_v43_FirstChild_0:IsA("Attachment")) or not l_v44_FirstChild_0:IsA("Attachment")) then
                local l_RagdollBallSocket_0 = v44:FindFirstChild("RagdollBallSocket");
                if not l_RagdollBallSocket_0 then
                    l_RagdollBallSocket_0 = Instance.new("BallSocketConstraint");
                    l_RagdollBallSocket_0.Name = "RagdollBallSocket";
                end;
                l_RagdollBallSocket_0.Attachment0 = l_v43_FirstChild_0;
                l_RagdollBallSocket_0.Attachment1 = l_v44_FirstChild_0;
                l_RagdollBallSocket_0.LimitsEnabled = true;
                l_RagdollBallSocket_0.UpperAngle = v42.UpperAngle;
                l_RagdollBallSocket_0.TwistLimitsEnabled = true;
                l_RagdollBallSocket_0.TwistLowerAngle = v42.TwistLowerAngle;
                l_RagdollBallSocket_0.TwistUpperAngle = v42.TwistUpperAngle;
                local v48 = workspace.Gravity / 196.2;
                if v35 then
                    v48 = math.max(v48, 0.2);
                end;
                local l_ReferenceMass_0 = v42.ReferenceMass;
                local v50 = not not l_ReferenceMass_0 and v44:GetMass() / l_ReferenceMass_0 or 1;
                l_RagdollBallSocket_0.MaxFrictionTorque = ((v42.FrictionTorque or 500) * v50) * v48;
                if v35 then
                    l_RagdollBallSocket_0.MaxFrictionTorque = l_RagdollBallSocket_0.MaxFrictionTorque / 100;
                end;
                l_RagdollBallSocket_0.Parent = v44;
                if v35 then
                    local l_Motor6D_0 = v44:FindFirstChildWhichIsA("Motor6D");
                    assert(l_Motor6D_0);
                    local l_AnimationConstraint_1 = Instance.new("AnimationConstraint");
                    l_AnimationConstraint_1.Name = l_Motor6D_0.Name;
                    l_AnimationConstraint_1.Attachment0 = l_Motor6D_0.Part0:FindFirstChild(l_Motor6D_0.Name .. "RigAttachment");
                    l_AnimationConstraint_1.Attachment1 = l_Motor6D_0.Part1:FindFirstChild(l_Motor6D_0.Name .. "RigAttachment");
                    l_AnimationConstraint_1.IsKinematic = true;
                    l_AnimationConstraint_1.MaxTorque = ((v42.StrengthTorque or 500) * v50) * v48;
                    l_AnimationConstraint_1.MaxForce = 0;
                    l_AnimationConstraint_1.Parent = l_Motor6D_0.parent;
                    l_Motor6D_0:Destroy();
                end;
            end;
        end;
    end;
end;
local function v65(v54, v55)
    for _, v57 in ipairs(v55) do
        local v58, v59, v60, v61 = unpack(v57);
        local v62 = v54[v58];
        if v62 then
            local l_v62_FirstChild_0 = v62:FindFirstChild(v59);
            if not (l_v62_FirstChild_0 and not l_v62_FirstChild_0:IsA("Attachment")) then
                if v61 then
                    local l_v62_FirstChild_1 = v62:FindFirstChild(v61);
                    if not (not l_v62_FirstChild_1 or not l_v62_FirstChild_1:IsA("Attachment")) then
                        v60 = l_v62_FirstChild_1.CFrame * v60;
                    end;
                end;
                if l_v62_FirstChild_0 then
                    l_v62_FirstChild_0.CFrame = v60;
                else
                    l_v62_FirstChild_0 = Instance.new("Attachment");
                    l_v62_FirstChild_0.Name = v59;
                    l_v62_FirstChild_0.CFrame = v60;
                    l_v62_FirstChild_0.Parent = v62;
                end;
            end;
        end;
    end;
end;
local function v89(v66, v67)
    local v68 = {};
    for _, v70 in ipairs(v67) do
        local v71, v72 = unpack(v70);
        local v73 = v66[v71];
        local v74 = v66[v72];
        if not (not v73 or not v74) then
            local v75 = v68[v74];
            if not v75 then
                v75 = {};
                v68[v74] = v75;
            end;
            v75[v73] = true;
        end;
    end;
    local v76 = {};
    for v77, v78 in pairs(v68) do
        local v79 = {};
        for _, v81 in ipairs(v77:GetChildren()) do
            if v81:IsA("NoCollisionConstraint") and v81.Name == "RagdollNoCollision" then
                local l_Part0_0 = v81.Part0;
                if not (v81.Part1 == v77) or not v78[l_Part0_0] then
                    table.insert(v79, v81);
                else
                    v78[l_Part0_0] = nil;
                end;
            end;
        end;
        v76[v77] = v79;
    end;
    for v83, v84 in pairs(v68) do
        local v85 = v76[v83];
        for v86, _ in pairs(v84) do
            local v88 = table.remove(v85) or Instance.new("NoCollisionConstraint");
            v88.Name = "RagdollNoCollision";
            v88.Part0 = v86;
            v88.Part1 = v83;
            v88.Parent = v83;
        end;
    end;
end;
local function _(v90, v91)
    local v92;
    if v90 then
        v92 = true;
        if not (v90.Parent ~= v91) then
            goto label0;
        end;
    end;
    v92 = false;
    ::label0::;
    return v92;
end;
local function _(v94, v95, v96, v97)
    local v98;
    if v96 then
        v98 = true;
        if not (v96.Parent ~= v94) then
            goto label1;
        end;
    end;
    v98 = false;
    ::label1::;
    if v98 then
        if v97 then
            v98 = true;
            if not (v97.Parent ~= v95) then
                goto label3;
            end;
        end;
        v98 = false;
        ::label3::;
        if v98 then
            return true;
        end;
    end;
    if v96 then
        v98 = true;
        if not (v96.Parent ~= v95) then
            goto label2;
        end;
    end;
    v98 = false;
    ::label2::;
    if v98 then
        if v97 then
            v98 = true;
            if not (v97.Parent ~= v94) then
                goto label4;
            end;
        end;
        v98 = false;
        ::label4::;
        if v98 then
            return true;
        end;
    end;
    return false;
end;
local function v108(v100, v101)
    for _, v103 in ipairs(v101:GetChildren()) do
        if v103:IsA("BallSocketConstraint") then
            local l_Attachment0_0 = v103.Attachment0;
            local l_Attachment1_0 = v103.Attachment1;
            local v106;
            if l_Attachment0_0 then
                v106 = true;
                if not (l_Attachment0_0.Parent ~= v100) then
                    goto label5;
                end;
            end;
            v106 = false;
            ::label5::;
            local v107;
            if v106 then
                if l_Attachment1_0 then
                    v106 = true;
                    if not (l_Attachment1_0.Parent ~= v101) then
                        goto label8;
                    end;
                end;
                v106 = false;
                ::label8::;
                if v106 then
                    v107 = true;
                    goto label7 --[[  true, true  ]];
                end;
            end;
            if l_Attachment0_0 then
                v106 = true;
                if not (l_Attachment0_0.Parent ~= v101) then
                    goto label6;
                end;
            end;
            v106 = false;
            ::label6::;
            if v106 then
                if l_Attachment1_0 then
                    v106 = true;
                    if not (l_Attachment1_0.Parent ~= v100) then
                        goto label9;
                    end;
                end;
                v106 = false;
                ::label9::;
                if v106 then
                    v107 = true;
                    goto label7 --[[  true, true  ]];
                end;
            end;
            v107 = false;
            ::label7::;
            if v107 then
                return true;
            end;
        end;
    end;
    return false;
end;
local function v114(v109)
    if (not l_game_EngineFeature_0 or v109:IsA("Motor6D")) or v109:IsA("AnimationConstraint") then
        local v110 = nil;
        local v111 = nil;
        if not v109:IsA("Motor6D") then
            if not (not l_game_EngineFeature_0 or not v109:IsA("AnimationConstraint")) then
                local l_Attachment0_1 = v109.Attachment0;
                local l_Attachment1_1 = v109.Attachment1;
                v110 = l_Attachment0_1 and l_Attachment0_1.Parent;
                v111 = l_Attachment1_1 and l_Attachment1_1.Parent;
            end;
        else
            v110 = v109.Part0;
            v111 = v109.Part1;
        end;
        if v110 and v111 then
            if not v108(v110, v111) then
                if not v108(v111, v110) then
                    return false;
                else
                    return true;
                end;
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
local function v122(v115, v116)
    local v117 = {};
    for _, v119 in ipairs(v116) do
        local l_v115_FirstChild_0 = v115:FindFirstChild(v119[2]);
        if l_v115_FirstChild_0 then
            local l_l_v115_FirstChild_0_FirstChild_0 = l_v115_FirstChild_0:FindFirstChild(v119[1]);
            if not ((not l_l_v115_FirstChild_0_FirstChild_0 or not l_game_EngineFeature_0 and not l_l_v115_FirstChild_0_FirstChild_0:IsA("Motor6D")) or not v114(l_l_v115_FirstChild_0_FirstChild_0)) then
                table.insert(v117, l_l_v115_FirstChild_0_FirstChild_0);
                l_l_v115_FirstChild_0_FirstChild_0.Enabled = false;
            end;
        end;
    end;
    return v117;
end;
v2.createRagdollJoints = function(v123, v124, v125)
    local v126 = v32(v123);
    if v124 == Enum.HumanoidRigType.R6 then
        v65(v126, v23);
        v53(v126, v24, false);
        v89(v126, v25);
        return ;
    elseif v124 == Enum.HumanoidRigType.R15 then
        v65(v126, v19);
        v53(v126, v20, v125);
        v89(v126, v21);
        return ;
    else
        error("unknown rig type", 2);
        return ;
    end;
end;
v2.disableMotors = function(v127, v128)
    local v129 = nil;
    if v128 == Enum.HumanoidRigType.R6 then
        v129 = v122(v127, v26);
    elseif v128 == Enum.HumanoidRigType.R15 then
        v129 = v122(v127, v22);
    else
        error("unknown rig type", 2);
    end;
    local v130 = v127.PrimaryPart or v127:FindFirstChild("HumanoidRootPart");
    if not (not v130 or not v130:IsA("BasePart")) then
        v130.CanCollide = false;
    end;
    local l_Head_0 = v127:FindFirstChild("Head");
    if not (not l_Head_0 or not l_Head_0:IsA("BasePart")) then
        l_Head_0.CanCollide = true;
    end;
    return v129;
end;
v2.disableParticleEmittersAndFadeOut = function(v132, v133)
    if l_RunService_0:IsServer() then
        error("disableParticleEmittersAndFadeOut should not be called on the server.", 2);
    end;
    local l_v132_Descendants_0 = v132:GetDescendants();
    local v135 = {};
    for _, v137 in pairs(l_v132_Descendants_0) do
        if not v137:IsA("BasePart") and not v137:IsA("Decal") then
            if v137:IsA("ParticleEmitter") then
                v137.Enabled = false;
            end;
        else
            v135[v137] = v137.Transparency;
        end;
    end;
    local v138 = 0;
    while v138 < v133 do
        v138 = v138 + l_RunService_0.Heartbeat:Wait();
        local v139 = math.min(v138 / v133, 1);
        for v140, v141 in pairs(v135) do
            v140.Transparency = (1 - v139) * v141 + v139;
        end;
    end;
end;
v2.easeNongraphicJointFriction = function(v142, v143)
    local l_v142_Descendants_0 = v142:GetDescendants();
    local v145 = {};
    for _, v147 in pairs(l_v142_Descendants_0) do
        if v147:IsA("BallSocketConstraint") and v147.Name == "RagdollBallSocket" then
            v147.MaxFrictionTorque = v147.MaxFrictionTorque * 100;
            local l_MaxFrictionTorque_0 = v147.MaxFrictionTorque;
            local l_Name_0 = v147.Parent.Name;
            v145[v147] = {
                v147, 
                l_MaxFrictionTorque_0, 
                l_MaxFrictionTorque_0 * ((not (l_Name_0 ~= "UpperTorso") or l_Name_0 == "Head") and 0.5 or 0.05)
            };
        end;
    end;
    local v150 = 0;
    while v150 < v143 do
        local _, v152 = l_RunService_0.Stepped:Wait();
        v150 = v150 + v152;
        local v153 = math.min(v150 / v143, 1);
        for _, v155 in pairs(v145) do
            local v156, v157, v158 = unpack(v155);
            v156.MaxFrictionTorque = (1 - v153) * v157 + v153 * v158;
        end;
    end;
end;
v2.easeJointFriction_OLD = function(v159, v160)
    local l_v159_Descendants_0 = v159:GetDescendants();
    local v162 = {};
    for _, v164 in pairs(l_v159_Descendants_0) do
        if v164:IsA("BallSocketConstraint") and v164.Name == "RagdollBallSocket" then
            local l_MaxFrictionTorque_1 = v164.MaxFrictionTorque;
            local l_Name_1 = v164.Parent.Name;
            v162[v164] = {
                v164, 
                l_MaxFrictionTorque_1, 
                l_MaxFrictionTorque_1 * ((not (l_Name_1 ~= "UpperTorso") or l_Name_1 == "Head") and 0.5 or 0.05)
            };
        end;
    end;
    local v167 = 0;
    while v167 < v160 do
        local _, v169 = l_RunService_0.Stepped:Wait();
        v167 = v167 + v169;
        local v170 = math.min(v167 / v160, 1);
        for _, v172 in pairs(v162) do
            local v173, v174, v175 = unpack(v172);
            v173.MaxFrictionTorque = (1 - v170) * v174 + v170 * v175;
        end;
    end;
end;
return v2;

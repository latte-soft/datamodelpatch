local l_AnimationClipProvider_0 = game:GetService("AnimationClipProvider");
local l_InsertService_0 = game:GetService("InsertService");
local v2 = game:DefineFastString("EmoteUtilityFallbackKeyframeSequenceAssetId", "10921261056");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v4 = {
    FallbackKeyframeSequenceAssetId = v2, 
    debugLoadAssetsFromFiles = false, 
    mapAssetIdToFileName = nil, 
    FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL = "http://www.roblox.com/asset/?id=" .. v2
};
local v5 = {};
local function _()
    v5 = {};
end;
local function _(v7)
    v5[v7] = true;
end;
local function _(v9)
    if v5[v9] then
        return true;
    else
        return false;
    end;
end;
local function _(v11, v12)
    return (math.sqrt((v12.X ^ 2 + v12.Y ^ 2) + v12.Z ^ 2) / 2) * (1 / math.tan(math.rad(v11) / 2));
end;
local function _()
    local l_status_0, l_result_0 = pcall(function()
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    return l_status_0 and l_result_0;
end;
local _ = function(v17, v18)
    local _ = nil;
    local _ = nil;
    local l_status_1, l_result_1 = pcall(function()
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    l_RbxAnalyticsService_0:ReportCounter((not (l_status_1 and l_result_1) and "Client" or "RCC") .. "_" .. v17 .. "_" .. (not v18 and "Failure" or "Success"));
end;
local function v40(v24)
    local v25 = true;
    if typeof(v24) ~= "number" then
        v25 = typeof(v24) == "string";
    end;
    assert(v25, "getAnimationAndIsIdle expects animationAssetIdOrUrl to be a number or string");
    local v26 = nil;
    v25 = nil;
    local v27 = nil;
    if typeof(v24) == "number" then
        local v28 = nil;
        local v29, v30 = v4.LoadAsset(v24);
        v25 = v29;
        v28 = v30;
        if not (not v25 or not v28) then
            v26 = v28:GetChildren()[1];
        end;
        v27 = "EmoteUtility_LoadAsset";
    else
        local v31 = nil;
        local l_status_2, l_result_2 = pcall(function()
            return game:GetObjects(v24)[1];
        end);
        v25 = l_status_2;
        v31 = l_result_2;
        if not (not v25 or not v31) then
            v26 = v31;
        end;
        v27 = "EmoteUtility_GetObjects";
    end;
    local l_v27_0 = v27;
    local l_v25_0 = v25;
    local v36 = nil;
    local v37 = nil;
    local l_status_3, l_result_3 = pcall(function()
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    l_RbxAnalyticsService_0:ReportCounter((not (l_status_3 and l_result_3) and "Client" or "RCC") .. "_" .. l_v27_0 .. "_" .. (not l_v25_0 and "Failure" or "Success"));
    if v25 and v26 then
        assert(v26, "animation is non-nil. Silence type checker.");
        l_v27_0 = false;
        if v26.ClassName == "Folder" then
            l_v27_0 = true;
            l_v25_0 = v26:FindFirstChild("Pose", true) or v26:FindFirstChild("pose", true);
            if l_v25_0 == nil then
                l_v25_0 = v26:FindFirstChild("Idle", true) or v26:FindFirstChild("idle", true);
            end;
            v26 = if not l_v25_0 then v26:FindFirstChildWhichIsA("Animation", true) else l_v25_0:FindFirstChildWhichIsA("Animation", true);
        end;
        return v26, l_v27_0;
    else
        l_v27_0 = nil;
        v36, v37 = pcall(function()
            return game.GetService(game, "ThumbnailGenerator") ~= nil;
        end);
        l_RbxAnalyticsService_0:SendEventDeferred(not (v36 and v37) and "Client" or "RCC", "EmoteUtility_getPoseAsset", v27 .. "_Failed", {
            animationAssetIdOrUrl = v24
        });
        return nil, nil;
    end;
end;
local function v58(v41)
    local v42 = nil;
    local v43 = nil;
    if not v4.debugLoadAssetsFromFiles then
        local l_status_4, l_result_4 = pcall(function()
            return l_AnimationClipProvider_0:GetAnimationClipAsync(v41);
        end);
        v42 = l_status_4;
        v43 = l_result_4;
    else
        local v46 = nil;
        for v47 in string.gmatch(v41, ".*id=([0-9]+)") do
            v46 = v47;
        end;
        assert(v46, "assetId should be non-nil");
        local v48 = tonumber(v46);
        assert(v48, "assetIdAsNumber should be non-nil");
        local v49 = nil;
        local v50, v51 = v4.LoadAsset(v48);
        v42 = v50;
        v49 = v51;
        if not (not v42 or not v49) then
            v43 = v49;
        end;
    end;
    local l_v42_0 = v42;
    local _ = nil;
    local v54 = nil;
    local l_status_5, l_result_5 = pcall(function()
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    l_RbxAnalyticsService_0:ReportCounter((not (l_status_5 and l_result_5) and "Client" or "RCC") .. "_" .. "EmoteUtility_GetAnimationClipAsync" .. "_" .. (not l_v42_0 and "Failure" or "Success"));
    if v42 then
        return v43;
    else
        l_v42_0 = nil;
        local v57;
        v54, v57 = pcall(function()
            return game.GetService(game, "ThumbnailGenerator") ~= nil;
        end);
        l_RbxAnalyticsService_0:SendEventDeferred(not (v54 and v57) and "Client" or "RCC", "EmoteUtility_GetAnimationClip", "EmoteUtility_GetAnimationClip_GetAnimationClipAsyncFailed", {
            keyframeSequenceId = v41
        });
        return nil;
    end;
end;
local function _(v59, v60, v61)
    pcall(function()
        v59[v60] = v61;
    end);
end;
local function v72(v63, v64, v65)
    if v64 then
        assert(v64, "parentPose is non-nil. Silence type checker.");
        local l_v63_FirstChild_0 = v63:FindFirstChild(v64.Name);
        if l_v63_FirstChild_0 then
            local l_l_v63_FirstChild_0_FirstChild_0 = l_v63_FirstChild_0:FindFirstChild(v65.Name);
            if l_l_v63_FirstChild_0_FirstChild_0 then
                for _, v69 in v65:GetChildren() do
                    if v69:IsA("NumberPose") then
                        local l_Name_0 = v69.Name;
                        local l_Value_0 = v69.Value;
                        pcall(function()
                            l_l_v63_FirstChild_0_FirstChild_0[l_Name_0] = l_Value_0;
                        end);
                    end;
                end;
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
end;
local function v83(v73, v74)
    local function v75(v76, v77)
        if not (not v76 or not v77:IsA("Pose")) then
            local v78 = v4.GetMotor6DBetween(v73:FindFirstChild(v76.Name), (v73:FindFirstChild(v77.Name)));
            if v78 and not (v5[v78] and true or false) then
                assert(v78, "motor6d is non-nil. Silence type checker.");
                v78.Transform = v77.CFrame;
                v5[v78] = true;
            end;
        end;
        if not v77:IsA("Folder") then
            for _, v80 in v77:GetChildren() do
                v75(v77, v80);
            end;
            return ;
        else
            v72(v73, v76, v77);
            return ;
        end;
    end;
    if v74 then
        for _, v82 in pairs(v74:GetPoses()) do
            v75(nil, v82);
        end;
    end;
end;
local function v89(v84, v85)
    if not v85 or v85 == 0 then
        return v84;
    else
        assert(v85, "rotationDegrees is non-nil. Silence type checker.");
        local v86 = v84:Clone();
        local v87 = v86:GetPoses()[1];
        if v87 then
            local v88 = v87:GetSubPoses()[1];
            if v88 then
                v88.CFrame = v88.CFrame * CFrame.Angles(0, math.rad(v85), 0);
            end;
        end;
        return v86;
    end;
end;
local function v92(v90, v91)
    if not v90:IsA("EulerRotationCurve") then
        if not v90:IsA("RotationCurve") then
            error("Unsupported rotation type:" .. v90.ClassName);
            return nil;
        else
            return v90:GetValueAtTime(v91);
        end;
    else
        return v90:GetRotationAtTime(v91);
    end;
end;
local function v93(v94, v95)
    for _, v97 in pairs(v94:GetChildren()) do
        if not v97:IsA("Attachment") then
            if not (v97:IsA("Tool") or v97:IsA("Accoutrement")) then
                v93(v97, v95);
            end;
        else
            v95[v97.Name] = v97;
        end;
    end;
end;
local function _(v98)
    local v99 = {};
    v93(v98, v99);
    return v99;
end;
local function _(v101)
    local v102 = {};
    v93(v101, v102);
    return v102;
end;
local function _(v104, v105)
    local l_Weld_0 = Instance.new("Weld");
    l_Weld_0.Part0 = v104.Parent;
    l_Weld_0.Part1 = v105.Parent;
    l_Weld_0.C0 = v104.CFrame;
    l_Weld_0.C1 = v105.CFrame;
    l_Weld_0.Parent = v104.Parent;
    return l_Weld_0;
end;
local function v121(v108, v109, v110)
    local v111 = {};
    v93(v108, v111);
    local l_v111_0 = v111;
    local v113 = {};
    v93(v110, v113);
    v111 = v113;
    v113 = false;
    for _, v115 in pairs(v111) do
        local v116 = l_v111_0[v115.Name];
        if v116 then
            v113 = true;
            local l_Weld_1 = Instance.new("Weld");
            l_Weld_1.Part0 = v116.Parent;
            l_Weld_1.Part1 = v115.Parent;
            l_Weld_1.C0 = v116.CFrame;
            l_Weld_1.C1 = v115.CFrame;
            l_Weld_1.Parent = v116.Parent;
        end;
    end;
    if not v113 then
        v110.Parent = nil;
        local l_Handle_0 = v110:FindFirstChild("Handle");
        local l_Grip_0 = v110.Grip;
        if not (not l_Handle_0 or not l_Grip_0) then
            local l_RightGripAttachment_0 = l_v111_0.RightGripAttachment;
            if l_RightGripAttachment_0 then
                l_Handle_0.CFrame = (l_RightGripAttachment_0.Parent.CFrame * l_RightGripAttachment_0.CFrame) * l_Grip_0:Inverse();
            end;
        end;
        v109:EquipTool(v110);
        return ;
    else
        v110.Parent = v108;
        return ;
    end;
end;
local function v129(v122, v123, v124, v125, v126, v127, v128)
    if not v128 then
        v83(v122, v127);
        if v125 ~= nil then
            v83(v122, v126);
        end;
    else
        v83(v122, v128);
        v83(v122, v126);
    end;
    v121(v122, v123, v124);
end;
local function v148(v130, v131, v132, v133)
    local v134 = nil;
    local v135 = false;
    local v136 = nil;
    if not v131 then
        if v133 then
            local l_FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL_0 = v4.FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL;
            local l_Animate_0 = v130:FindFirstChild("Animate");
            if l_Animate_0 then
                local v139 = l_Animate_0:FindFirstChild("Pose") or l_Animate_0:FindFirstChild("pose");
                if v139 then
                    local l_Animation_0 = v139:FindFirstChildOfClass("Animation");
                    if l_Animation_0 then
                        l_FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL_0 = l_Animation_0.AnimationId;
                    end;
                end;
            end;
            v136 = l_FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL_0;
            local v141 = v58(l_FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL_0);
            if v141 then
                if v141:IsA("KeyframeSequence") then
                    v134 = v141:GetKeyframes()[1];
                else
                    return nil, false, v136;
                end;
            end;
        end;
    else
        v136 = v131;
        local v142, v143 = v40(v131);
        if v142 == nil then
            return nil, v135, v136;
        else
            assert(v142, "animation is non-nil. Silence type checker.");
            if not v143 then
                v135 = true;
            end;
            local v144 = v4.GetNumberValueWithDefault(v142, "ThumbnailKeyframe", nil);
            local v145 = v4.GetNumberValueWithDefault(v142, "ThumbnailTime", nil);
            local v146 = 0;
            if v132 then
                v146 = v4.GetNumberValueWithDefault(v142, "ThumbnailCharacterRotation", 0);
            end;
            local v147 = v4.GetAnimationClip(v142);
            if v147 then
                if not v147:IsA("KeyframeSequence") then
                    if not v147:IsA("CurveAnimation") then
                        error("Unsupported Animation type:" .. v147.ClassName);
                        return v134, v135, v136;
                    else
                        return v4.GetThumbnailKeyframeFromCurve(v145, v147, v146), v135, v136;
                    end;
                else
                    return v4.GetThumbnailKeyframe(v144, v147, v146), v135, v136;
                end;
            end;
        end;
    end;
    return v134, v135, v136;
end;
local function v156(v149)
    local v150 = nil;
    if v149 then
        assert(v149, "moodAssetId is non-nil. Silence type checker.");
        local v151, _ = v40(v149);
        if v151 == nil then
            return nil;
        else
            assert(v151, "animation is non-nil. Silence type checker.");
            local v153 = v4.GetNumberValueWithDefault(v151, "ThumbnailKeyframe", nil);
            local v154 = v4.GetNumberValueWithDefault(v151, "ThumbnailTime", nil);
            local v155 = v4.GetAnimationClip(v151);
            if v155 then
                if not v155:IsA("KeyframeSequence") then
                    if not v155:IsA("CurveAnimation") then
                        error("Unsupported Animation type:" .. v155.ClassName);
                    else
                        return (v4.GetThumbnailKeyframeFromCurve(v154, v155, 0));
                    end;
                else
                    return (v4.GetThumbnailKeyframe(v153, v155, 0));
                end;
            end;
            return v150;
        end;
    else
        return nil;
    end;
end;
local function v167(v157, v158)
    local v159 = nil;
    local v160 = nil;
    local l_Tool_0 = v157:FindFirstChildOfClass("Tool");
    if l_Tool_0 then
        assert(l_Tool_0, "tool is non-nil. Silence type checker.");
        local v162 = false;
        if not v158 then
            v159 = l_Tool_0:FindFirstChild("ThumbnailPose");
            if not (not v159 or not v159:IsA("Keyframe")) then
                v162 = true;
            end;
        end;
        if not v162 then
            v159 = nil;
            local l_Animate_1 = v157:FindFirstChild("Animate");
            if l_Animate_1 then
                assert(l_Animate_1, "animateScript is non-nil. Silence type checker.");
                local l_toolnone_0 = l_Animate_1:FindFirstChild("toolnone");
                if l_toolnone_0 then
                    assert(l_toolnone_0, "toolNoneStringValue is non-nil. Silence type checker.");
                    local l_ToolNoneAnim_0 = l_toolnone_0:FindFirstChild("ToolNoneAnim");
                    if l_ToolNoneAnim_0 then
                        local v166 = v4.GetAnimationClip(l_ToolNoneAnim_0);
                        if v166 then
                            assert(v166, "toolAnimationClip is non-nil. Silence type checker.");
                            assert(v166:IsA("KeyframeSequence"), "ToolNoneAnim must be a KeyframeSequence");
                            v160 = v4.GetThumbnailKeyframe(nil, v166, 0);
                            if not l_Tool_0:IsDescendantOf(v157) then
                                return nil, nil;
                            end;
                        else
                            return nil, nil;
                        end;
                    end;
                else
                    return nil, nil;
                end;
            else
                return nil, nil;
            end;
        end;
        return v159, v160;
    else
        return nil, nil;
    end;
end;
v4.ForceAnimationToStep = function(v168)
    local l_Humanoid_0 = v168:FindFirstChildOfClass("Humanoid");
    if l_Humanoid_0 then
        local l_Animator_0 = l_Humanoid_0:FindFirstChildOfClass("Animator");
        if l_Animator_0 then
            l_Animator_0:StepAnimations(0.1);
        end;
    end;
end;
v4.LoadAsset = function(v171)
    local l_status_6, l_result_6 = pcall(function()
        if not v4.debugLoadAssetsFromFiles or not v4.mapAssetIdToFileName then
            return l_InsertService_0:LoadAsset(v171);
        else
            return l_InsertService_0:LoadLocalAsset("rbxasset://" .. v4.mapAssetIdToFileName(v171));
        end;
    end);
    return l_status_6, l_result_6;
end;
v4.SetDebugLoadAssetsFromFiles = function(v174, v175)
    v4.debugLoadAssetsFromFiles = v174;
    v4.mapAssetIdToFileName = v175;
end;
v4.GetMotor6DBetween = function(v176, v177)
    if v176 and v177 then
        assert(v176, "part0 is non-nil. Silence type checker.");
        assert(v177, "part1 is non-nil. Silence type checker.");
        for _, v179 in pairs(v177:GetChildren()) do
            if v179:IsA("Motor6D") and v179.Part0 == v176 then
                return v179;
            end;
        end;
        return nil;
    else
        return nil;
    end;
end;
v4.PoseKeyframeHasFaceAnimation = function(v180)
    if v180 then
        assert(v180, "poseKeyframe is non-nil. Silence type checker.");
        local function v181(v182)
            if not v182:IsA("Folder") then
                for _, v184 in v182:GetChildren() do
                    if v181(v184) then
                        return true;
                    end;
                end;
                return false;
            else
                return true;
            end;
        end;
        for _, v186 in pairs(v180:GetPoses()) do
            if v181(v186) then
                return true;
            end;
        end;
        return false;
    else
        return false;
    end;
end;
v4.ApplyKeyframe = function(v187, v188)
    v5 = {};
    v83(v187, v188);
    v5 = {};
    local l_status_7, l_result_7 = pcall(function()
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    if l_status_7 and l_result_7 then
        v4.ForceAnimationToStep(v187);
    end;
end;
v4.GetNumberValueWithDefault = function(v191, v192, v193)
    local l_v193_0 = v193;
    local l_v191_FirstChild_0 = v191:FindFirstChild(v192);
    if not (not l_v191_FirstChild_0 or not l_v191_FirstChild_0:IsA("NumberValue")) then
        l_v193_0 = l_v191_FirstChild_0.Value;
    end;
    return l_v193_0;
end;
v4.GetAnimationClip = function(v196)
    if not v196:IsA("KeyframeSequence") then
        if not v196:IsA("Animation") then
            error("Unknown keyframeSequenceOrAnimation type:" .. v196.ClassName);
            return nil;
        else
            return (v58(v196.AnimationId));
        end;
    else
        return v196;
    end;
end;
v4.GetThumbnailKeyframe = function(v197, v198, v199)
    local l_v198_Keyframes_0 = v198:GetKeyframes();
    local _ = nil;
    return (v89(if (not not v197 and v197 > 0) and v197 <= #l_v198_Keyframes_0 then l_v198_Keyframes_0[v197] else l_v198_Keyframes_0[math.ceil(#l_v198_Keyframes_0 / 2)], v199));
end;
v4.GetCurveAnimationTimeLength = function(v202)
    local v203 = 0;
    for _, v205 in v202:GetDescendants() do
        if v205:IsA("FloatCurve") then
            v203 = math.max(v203, v205:GetKeyAtIndex(v205.Length).Time);
        end;
    end;
    return v203;
end;
v4.GetThumbnailKeyframeFromCurve = function(v206, v207, v208)
    local v209 = v4.GetCurveAnimationTimeLength(v207);
    if not (v206 and v206 >= 0) or v209 < v206 then
        v206 = v209 / 2;
    end;
    assert(v206, "thumbnailTime should be non-nil. Silence type checker");
    local v210 = {
        Position = true, 
        Rotation = true
    };
    local function v211(v212, v213)
        local v214 = nil;
        local l_Position_0 = v213:FindFirstChild("Position");
        local l_Rotation_0 = v213:FindFirstChild("Rotation");
        if not l_Position_0 or not l_Rotation_0 then
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Name = v213.Name;
            l_Folder_0.Parent = v212;
            v214 = l_Folder_0;
        else
            local v218 = v92(l_Rotation_0, v206);
            if v218 then
                v218 = v218 + Vector3.new(table.unpack(l_Position_0:GetValueAtTime(v206)));
                local l_Pose_0 = Instance.new("Pose");
                l_Pose_0.CFrame = v218;
                l_Pose_0.Name = v213.Name;
                l_Pose_0.Parent = v212;
                v214 = l_Pose_0;
            end;
        end;
        for _, v221 in v213:GetChildren() do
            if not v221:IsA("FloatCurve") or v210[v221] then
                if v221:IsA("Folder") then
                    v211(v214, v221);
                end;
            else
                local l_NumberPose_0 = Instance.new("NumberPose");
                l_NumberPose_0.Name = v221.Name;
                local v223 = v221:GetValueAtTime(v206) or 0;
                assert(v223, "valueAtTime should be non-nil. Silence type checker.");
                l_NumberPose_0.Value = v223;
                l_NumberPose_0.Parent = v214;
            end;
        end;
    end;
    local l_Keyframe_0 = Instance.new("Keyframe");
    l_Keyframe_0.Name = v207.Name;
    l_Keyframe_0.Time = v206;
    for _, v226 in v207:GetChildren() do
        if v226:IsA("Folder") then
            v211(l_Keyframe_0, v226);
        end;
    end;
    return (v89(l_Keyframe_0, v208));
end;
v4.ClearPlayerCharacterFace = function(v227)
    local l_v227_FirstChildWhichIsA_0 = v227:FindFirstChildWhichIsA("FaceControls", true);
    if l_v227_FirstChildWhichIsA_0 then
        local l_Parent_0 = l_v227_FirstChildWhichIsA_0.Parent;
        local l_l_v227_FirstChildWhichIsA_0_Children_0 = l_v227_FirstChildWhichIsA_0:GetChildren();
        local l_FaceControls_0 = Instance.new("FaceControls");
        l_FaceControls_0.Parent = l_Parent_0;
        for _, v233 in l_l_v227_FirstChildWhichIsA_0_Children_0, nil, nil do
            v233.Parent = l_FaceControls_0;
        end;
        l_v227_FirstChildWhichIsA_0:Destroy();
    end;
end;
v4.AdjustArmOnR6ForTool = function(v234)
    local l_Tool_1 = v234:FindFirstChildOfClass("Tool");
    local l_Torso_0 = v234:FindFirstChild("Torso");
    if l_Torso_0 then
        local l_l_Torso_0_FirstChild_0 = l_Torso_0:FindFirstChild("Right Shoulder");
        if l_l_Torso_0_FirstChild_0 then
            if not l_Tool_1 then
                l_l_Torso_0_FirstChild_0.CurrentAngle = 0;
                l_l_Torso_0_FirstChild_0.DesiredAngle = 0;
            else
                l_l_Torso_0_FirstChild_0.CurrentAngle = 1.5707963267948966;
                l_l_Torso_0_FirstChild_0.DesiredAngle = 1.5707963267948966;
                return ;
            end;
        end;
    end;
end;
v4.SetPlayerCharacterFace = function(v238, v239)
    if v239 then
        if v239 == "" then
            return ;
        elseif v239 == 0 then
            return ;
        else
            local v240 = true;
            if typeof(v239) ~= "number" then
                v240 = typeof(v239) == "string";
            end;
            assert(v240, "EmoteUtility.SetPlayerCharacterFace expects animationAssetIdOrUrl to be a number or string");
            if v238:FindFirstChildOfClass("Humanoid") then
                v240 = v156(v239);
                if v240 then
                    v4.ClearPlayerCharacterFace(v238);
                    v4.ApplyKeyframe(v238, v240);
                    return ;
                else
                    return ;
                end;
            else
                return ;
            end;
        end;
    else
        return ;
    end;
end;
v4.SetPlayerCharacterNeutralPose = function(v241)
    local l_Humanoid_1 = v241:FindFirstChildOfClass("Humanoid");
    if l_Humanoid_1 then
        assert(l_Humanoid_1, "humanoid should be non-nil. Silence type checker.");
        l_Humanoid_1:BuildRigFromAttachments();
        if l_Humanoid_1.RigType ~= Enum.HumanoidRigType.R15 then
            return ;
        else
            v4.ClearPlayerCharacterFace(v241);
            local function v243(v244)
                if v244:IsA("Motor6D") then
                    v244.Transform = CFrame.new();
                end;
                for _, v246 in (v244:GetChildren()), nil, nil do
                    v243(v246);
                end;
            end;
            v243(v241);
            return ;
        end;
    else
        return ;
    end;
end;
local function v263(v247, v248, v249, v250, v251)
    local v252 = {
        originalAnimationAssetId = v248
    };
    local _ = nil;
    local v254, v255, v256 = v148(v247, v248, not v250, not v251 and true or false);
    local v257 = nil;
    local v258 = nil;
    if not (v251 or not v254) then
        local v259, v260 = v167(v247, v255);
        v257 = v259;
        v258 = v260;
    end;
    local v261 = nil;
    local v262 = false;
    if v249 and v249 ~= 0 then
        if v248 == nil then
            v262 = true;
        elseif not v4.PoseKeyframeHasFaceAnimation(v254) then
            v262 = true;
        end;
    end;
    if v262 then
        v261 = v156(v249);
    end;
    v252.poseKeyframe = v254;
    v252.moodKeyframe = v261;
    v252.defaultToolKeyframe = v258;
    v252.suggestedKeyframeFromTool = v257;
    v252.finalAnimationAssetIdOrUrl = v256;
    return v252;
end;
v4.LoadKeyframesForPose = function(v264, v265, v266, v267, v268)
    assert(v264, "character should be non-nil");
    if v265 ~= nil then
        assert(typeof(v265) == "number", "EmoteUtility.LoadKeyframesForPose expects animationAssetId to be a number or nil");
        assert(v265 > 0, "EmoteUtility.LoadKeyframesForPose expects animationAssetId to be a real asset ID (positive number)");
    end;
    if v266 ~= nil then
        assert(typeof(v266) == "number", "EmoteUtility.LoadKeyframesForPose expects moodAssetId to be a number or nil");
    end;
    local l_Humanoid_2 = v264:FindFirstChildOfClass("Humanoid");
    if l_Humanoid_2 then
        assert(l_Humanoid_2, "humanoid should be non-nil. Silence type checker.");
        if l_Humanoid_2.RigType == Enum.HumanoidRigType.R15 then
            return (v263(v264, v265, v266, v267, v268));
        else
            return {
                originalAnimationAssetId = v265
            };
        end;
    else
        return nil;
    end;
end;
v4.ApplyKeyframesForPose = function(v270, v271)
    assert(v270, "character should be non-nil");
    if v271 then
        assert(v271, "keyframesForPose should be non-nil. Silence type checker.");
        local l_Humanoid_3 = v270:FindFirstChildOfClass("Humanoid");
        if l_Humanoid_3 then
            assert(l_Humanoid_3, "humanoid should be non-nil. Silence type checker.");
            v4.SetPlayerCharacterNeutralPose(v270);
            v5 = {};
            local l_Tool_2 = v270:FindFirstChildOfClass("Tool");
            if l_Humanoid_3.RigType == Enum.HumanoidRigType.R15 then
                if not l_Tool_2 then
                    v83(v270, v271.poseKeyframe);
                else
                    v129(v270, l_Humanoid_3, l_Tool_2, v271.originalAnimationAssetId, v271.poseKeyframe, v271.defaultToolKeyframe, v271.suggestedKeyframeFromTool);
                end;
            else
                v4.AdjustArmOnR6ForTool(v270);
            end;
            if l_Humanoid_3.RigType == Enum.HumanoidRigType.R15 then
                v83(v270, v271.moodKeyframe);
            end;
            v5 = {};
            local l_status_8, l_result_8 = pcall(function()
                return game.GetService(game, "ThumbnailGenerator") ~= nil;
            end);
            if l_status_8 and l_result_8 then
                v4.ForceAnimationToStep(v270);
            end;
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v4.SetPlayerCharacterPoseWithMoodFallback = function(v276, v277, v278, v279, v280)
    local l_Humanoid_4 = v276:FindFirstChildOfClass("Humanoid");
    if l_Humanoid_4 then
        assert(l_Humanoid_4, "humanoid should be non-nil.  Silence type checker.");
        v4.ApplyKeyframesForPose(v276, (v4.LoadKeyframesForPose(v276, v277, v278, v279, v280)));
        return ;
    else
        return ;
    end;
end;
v4.ThumbnailZoomExtents = function(v282, v283, v284, v285, v286)
    local l_v282_ModelCFrame_0 = v282:GetModelCFrame();
    local l_LookVector_0 = l_v282_ModelCFrame_0.LookVector;
    local l_HumanoidRootPart_0 = v282:FindFirstChild("HumanoidRootPart");
    if l_HumanoidRootPart_0 then
        l_LookVector_0 = l_HumanoidRootPart_0.CFrame.LookVector;
    end;
    local v290 = CFrame.new(l_v282_ModelCFrame_0.Position + l_LookVector_0 * 5, l_v282_ModelCFrame_0.Position);
    local v291 = l_v282_ModelCFrame_0.Position + Vector3.new(v284, -v285, 0);
    local l_v282_ExtentsSize_0 = v282:GetExtentsSize();
    return ((v290 - v290.Position) + v291) + l_LookVector_0 * (((math.sqrt((l_v282_ExtentsSize_0.X ^ 2 + l_v282_ExtentsSize_0.Y ^ 2) + l_v282_ExtentsSize_0.Z ^ 2) / 2) * (1 / math.tan(math.rad(v283) / 2))) * (1 / v286));
end;
return v4;

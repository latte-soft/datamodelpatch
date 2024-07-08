local l_script_FirstAncestor_0 = script:FindFirstAncestor("TnSAvatarIdentification");
local v1 = require(l_script_FirstAncestor_0.Flags.GetFFlagReportAnythingFixConvexHullCalculation);
local v2 = require(l_script_FirstAncestor_0.Flags.GetFFlagReportAnythingAvatarIdentificationEdgeCaseFix);
local v3 = require(l_script_FirstAncestor_0.Flags.GetFIntReportAnythingAvatarIdentificationCloseDiscardDistanceHundredths);
local v4 = require(l_script_FirstAncestor_0.Flags.GetFIntReportAnythingAvatarIdentificationDiscardFractionSkipThresholdPercent);
local v5 = require(l_script_FirstAncestor_0.Flags.GetFIntReportAnythingAvatarIdentificationOffScreenDiscardDistancePercent);
local l_Players_0 = game:GetService("Players");
local v7 = v3() / 100;
local v8 = v5() / 100;
local v9 = v4() / 100;
local v10 = {};
shouldIgnoreLocalCharacter = function(v11)
    local l_Head_0 = v11:FindFirstChild("Head");
    if not l_Head_0 or not l_Head_0:IsA("BasePart") then
        return false;
    else
        return l_Head_0.LocalTransparencyModifier >= 0.95;
    end;
end;
getLocalCharacterPosition = function(v13)
    local l_HumanoidRootPart_0 = v13:FindFirstChild("HumanoidRootPart");
    if l_HumanoidRootPart_0 then
        return l_HumanoidRootPart_0.Position;
    else
        return nil;
    end;
end;
getBBCorners = function(v15, v16)
    local v17 = table.create(8);
    local l_XVector_0 = v15.XVector;
    local l_YVector_0 = v15.YVector;
    local l_ZVector_0 = v15.ZVector;
    local v21 = 1;
    for v22 = -0.5, 0.5 do
        local v23 = (l_XVector_0 * v22) * v16.X;
        for v24 = -0.5, 0.5 do
            local v25 = (l_YVector_0 * v24) * v16.Y;
            for v26 = -0.5, 0.5 do
                v17[v21] = ((v15.Position + v23) + v25) + (l_ZVector_0 * v26) * v16.Z;
                v21 = v21 + 1;
            end;
        end;
    end;
    return v17;
end;
local v27 = Vector2.new(0, 0);
local v28 = Vector2.new(math.huge, math.huge);
getCoveringPolygon = function(v29, v30, _)
    local l_ViewportSize_0 = v30.ViewportSize;
    local v33 = {};
    for _, v35 in ipairs(v29) do
        local l_target_0 = v35.target;
        for _, v38 in (getBBCorners(l_target_0.ExtentsCFrame, l_target_0.ExtentsSize)), nil, nil do
            table.insert(v33, v38);
        end;
    end;
    local v39 = table.create(#v33);
    for v40, v41 in ipairs(v33) do
        local v42, _ = v30:WorldToViewportPoint(v41);
        v39[v40] = Vector2.new(v42.X, v42.Y) / l_ViewportSize_0;
    end;
    return getConvexHull(v39);
end;
local v44 = v8 + 1;
local v45 = -v8;
local function _(v46)
    local v47 = true;
    if v44 >= v46.Y then
        v47 = true;
        if v46.Y >= v45 then
            v47 = true;
            if v44 >= v46.X then
                v47 = v46.X < v45;
            end;
        end;
    end;
    return v47;
end;
local v49 = {
    total = 0, 
    offScreenDiscardCount = 0, 
    tooCloseDiscardCount = 0, 
    wasSkipped = false
};
getCoveringPolygon2 = function(v50, v51)
    if #v50 == 0 then
        return {}, v49;
    else
        local l_ViewportSize_1 = v51.ViewportSize;
        local v53 = {};
        for _, v55 in ipairs(v50) do
            local l_target_1 = v55.target;
            for _, v58 in (getBBCorners(l_target_1.ExtentsCFrame, l_target_1.ExtentsSize)), nil, nil do
                table.insert(v53, v58);
            end;
        end;
        local v59 = {};
        local v60 = 0;
        local v61 = 0;
        for _, v63 in ipairs(v53) do
            local v64, _ = v51:WorldToViewportPoint(v63);
            local v66 = Vector2.new(v64.X, v64.Y) / l_ViewportSize_1;
            if v64.Z < v7 then
                v60 = v60 + 1;
            else
                local v67 = true;
                if v44 >= v66.Y then
                    v67 = true;
                    if v66.Y >= v45 then
                        v67 = true;
                        if v44 >= v66.X then
                            v67 = v66.X < v45;
                        end;
                    end;
                end;
                if not v67 then
                    v59[#v59 + 1] = v66;
                else
                    v61 = v61 + 1;
                end;
            end;
        end;
        local v68 = {
            total = #v53, 
            offScreenDiscardCount = v61, 
            tooCloseDiscardCount = v60, 
            wasSkipped = false
        };
        if v9 < (v60 + v61) / #v53 then
            v68.wasSkipped = true;
            return {}, v68;
        else
            return getConvexHull(v59), v68;
        end;
    end;
end;
getViewportCorners = function(v69, v70)
    local l_v28_0 = v28;
    local l_v27_0 = v27;
    local l_ViewportSize_2 = v70.ViewportSize;
    local v74 = 0;
    for _, v76 in ipairs(v69) do
        local v77, v78 = v70:WorldToViewportPoint(v76);
        local v79 = Vector2.new(v77.X / l_ViewportSize_2.X, v77.Y / l_ViewportSize_2.Y);
        if not v78 then
            v79 = Vector2.new(math.clamp(v79.X, 0, 1), (math.clamp(v79.Y, 0, 1)));
        end;
        if not v1() then
            v74 = v74 + 1;
        elseif v78 then
            v74 = v74 + 1;
        end;
        l_v28_0 = l_v28_0:Min(v79);
        l_v27_0 = l_v27_0:Max(v79);
    end;
    if v74 <= 2 then
        return v28, v27;
    else
        return l_v28_0, l_v27_0;
    end;
end;
getDistanceAlongCamLookVector = function(v80, v81)
    local l_CFrame_0 = v81.CFrame;
    return ((v80.Position - l_CFrame_0.Position):Dot(l_CFrame_0.LookVector));
end;
getVisibleParts = function(v83, v84, v85)
    local l_Position_0 = v83.CFrame.Position;
    local l_Character_0 = v84.Character;
    if l_Character_0 and l_Character_0.Parent then
        local l_l_Character_0_Children_0 = l_Character_0:GetChildren();
        local v89 = RaycastParams.new();
        v89.FilterType = Enum.RaycastFilterType.Exclude;
        v89.FilterDescendantsInstances = v85;
        v89.IgnoreWater = true;
        local v90 = 0;
        local v91 = {};
        for _, v93 in ipairs(l_l_Character_0_Children_0) do
            if v93:IsA("BasePart") then
                local v94 = v93.CFrame.Position - l_Position_0;
                v90 = v90 + 1;
                local v95 = workspace:Raycast(l_Position_0, v94, v89);
                if not (not v95 or not v95.Instance:IsDescendantOf(l_Character_0)) then
                    table.insert(v91, {
                        result = v95, 
                        target = v93
                    });
                end;
            end;
        end;
        return v90, v91;
    else
        return 0, {};
    end;
end;
local function _(v96, v97, v98)
    return (v97 - v96):Cross(v98 - v97);
end;
getConvexHull = function(v100)
    if #v100 <= 2 then
        return {};
    else
        local v101 = {};
        local v102 = v100[1];
        local v103 = {};
        for v104 = 2, #v100 do
            local v105 = v100[v104];
            if not (v105.Y >= v102.Y) or v105.Y == v102.Y and v105.X < v102.X then
                v102 = v105;
            end;
        end;
        table.insert(v101, v102);
        local function _(v106)
            local v107 = v106 - v102;
            return (math.atan2(v107.Y, v107.X));
        end;
        for _, v110 in ipairs(v100) do
            if v110 ~= v102 then
                local l_X_0 = v110.X;
                local l_Y_0 = v110.Y;
                local v113 = v110 - v102;
                table.insert(v103, (Vector3.new(l_X_0, l_Y_0, (math.atan2(v113.Y, v113.X)))));
            end;
        end;
        table.sort(v103, function(v114, v115)
            if v114.Z ~= v115.Z then
                return v114.Z < v115.Z;
            else
                return (Vector2.new(v114.X, v114.Y) - v102).Magnitude < (Vector2.new(v115.X, v115.Y) - v102).Magnitude;
            end;
        end);
        local v116 = {};
        local v117 = v103[1];
        for v118 = 2, #v103 do
            local v119 = v103[v118];
            if v117.Z == v119.Z then
                v117 = v119;
            else
                table.insert(v116, Vector2.new(v117.X, v117.Y));
                v117 = v119;
            end;
        end;
        table.insert(v116, Vector2.new(v117.X, v117.Y));
        if #v116 == 1 then
            return {};
        else
            table.insert(v101, v116[1]);
            table.insert(v101, v116[2]);
            for v120 = 3, #v116 do
                local v121 = v116[v120];
                while #v101 > 1 do
                    local v122 = v101[#v101 - 1];
                    local v123 = v101[#v101];
                    if (v123 - v122):Cross(v121 - v123) <= 0 then
                        table.remove(v101);
                    else
                        break;
                    end;
                end;
                table.insert(v101, v121);
            end;
            return v101;
        end;
    end;
end;
projectVertices = function(v124, v125, v126)
    local l_huge_0 = math.huge;
    local v128 = -math.huge;
    for _, v130 in ipairs(v124) do
        local v131 = (v130 * v126):Dot(v125);
        if v131 < l_huge_0 then
            l_huge_0 = v131;
        end;
        if v128 < v131 then
            v128 = v131;
        end;
    end;
    return l_huge_0, v128;
end;
projectCircle = function(v132, v133, v134)
    local v135 = v134.Unit * v133;
    local v136 = v132 + v135;
    local v137 = v132 - v135;
    local v138 = v136:Dot(v134);
    local v139 = v137:Dot(v134);
    if v139 < v138 then
        local l_v138_0 = v138;
        v138 = v139;
        v139 = l_v138_0;
    end;
    return v138, v139;
end;
getClosestPoint = function(v141, v142, v143)
    local v144 = -1;
    local l_huge_1 = math.huge;
    for v146, v147 in ipairs(v142) do
        v147 = v147 * v143;
        local v148 = math.sqrt(math.pow(v147.X - v141.X, 2) + math.pow(v147.Y - v141.Y, 2));
        if v148 < l_huge_1 then
            l_huge_1 = v148;
            v144 = v146;
        end;
    end;
    return v144;
end;
intersectCirclePolygon = function(v149, v150, v151, v152)
    for v153, _ in ipairs(v151) do
        local v155 = v151[v153 % #v151 + 1] * v152 - v151[v153] * v152;
        local l_Unit_0 = Vector2.new(v155.Y, -v155.X).Unit;
        local v157, v158 = projectVertices(v151, l_Unit_0, v152);
        local v159, v160 = projectCircle(v149, v150, l_Unit_0);
        if not (v160 > v157) or v158 <= v159 then
            return false;
        end;
    end;
    local v161 = getClosestPoint(v149, v151, v152);
    if v161 == -1 then
        return false;
    else
        local l_Unit_1 = (v151[v161] - v149).Unit;
        local v163, v164 = projectVertices(v151, l_Unit_1, v152);
        local v165, v166 = projectCircle(v149, v150, l_Unit_1);
        if not (v166 > v163) or v164 <= v165 then
            return false;
        else
            return true;
        end;
    end;
end;
intersectCircleBox = function(v167, v168, v169, v170, _)
    local l_X_1 = v167.X;
    local l_Y_1 = v167.Y;
    local l_l_X_1_0 = l_X_1;
    local l_l_Y_1_0 = l_Y_1;
    local l_X_2 = v169.X;
    local l_Y_2 = v169.Y;
    local v178 = v170.X - v169.X;
    local v179 = v170.Y - v169.Y;
    if l_X_1 < l_X_2 then
        l_l_X_1_0 = l_X_2;
    elseif l_X_2 + v178 < l_X_1 then
        l_l_X_1_0 = l_X_2 + v178;
    end;
    if l_Y_1 < l_Y_2 then
        l_l_Y_1_0 = l_Y_2;
    elseif l_Y_2 + v179 < l_Y_1 then
        l_l_Y_1_0 = l_Y_2 + v179;
    end;
    local v180 = l_X_1 - l_l_X_1_0;
    local v181 = l_Y_1 - l_l_Y_1_0;
    if math.sqrt(v180 * v180 + v181 * v181) <= v168 then
        return true;
    else
        return false;
    end;
end;
v10.getAvatarsForRegion = function(v182, v183, v184, v185, v186)
    local v187 = {};
    local v188 = v186 < v185;
    local v189 = if not v188 then v186 / v185 else v185 / v186;
    local v190 = nil;
    v190 = if not v188 then Vector2.new(1, v189) else Vector2.new(v189, 1);
    for _, v192 in pairs(v182) do
        if not (not (intersectCircleBox(v183 * v190, v184 * v189, v192.boundingBox.min * v190, v192.boundingBox.max * v190, v190) and #v192.convexHull >= 3) or not intersectCirclePolygon(v183 * v190, v184 * v189, v192.convexHull, v190)) then
            v187[v192.player.UserId] = v192.player;
        end;
    end;
    return v187;
end;
v10.getAvatarsForPoint = function(v193, v194)
    local v195 = {};
    for _, v197 in pairs(v193) do
        local l_boundingBox_0 = v197.boundingBox;
        if ((v194.X >= l_boundingBox_0.min.X and v194.Y >= l_boundingBox_0.min.Y) and l_boundingBox_0.max.X >= v194.X) and l_boundingBox_0.max.Y >= v194.Y then
            local l_convexHull_0 = v197.convexHull;
            if #l_convexHull_0 >= 3 then
                local v200 = l_convexHull_0[#l_convexHull_0];
                local v201 = true;
                local v202 = true;
                for _, v204 in ipairs(l_convexHull_0) do
                    local v205 = (v204 - v200):Cross(v194 - v200);
                    v202 = v202 and v205 <= 0;
                    v201 = v201 and v205 >= 0;
                    v200 = v204;
                end;
                if not (not v201 and not v202) then
                    v195[v197.player.UserId] = v197.player;
                end;
            end;
        end;
    end;
    return v195;
end;
v10.getVisibleAvatars = function()
    local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
    local v207 = {
        totalPlayers = 0, 
        checkedPlayers = 0, 
        duration = 0
    };
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if l_CurrentCamera_0 then
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if l_LocalPlayer_0 then
            local l_Character_1 = l_LocalPlayer_0.Character;
            local v211 = nil;
            local v212 = nil;
            local v213 = {};
            if not l_Character_1 then
                v211 = l_CurrentCamera_0.CFrame.Position;
                v212 = false;
            else
                v211 = getLocalCharacterPosition(l_Character_1) or l_CurrentCamera_0.CFrame.Position;
                if shouldIgnoreLocalCharacter(l_Character_1) then
                    v213[#v213 + 1] = l_Character_1;
                end;
            end;
            local v214 = {};
            local v215 = os.clock();
            v207.totalPlayers = #l_l_Players_0_Players_0 - 1;
            local function _()
                v207.duration = os.clock() - v215;
                return v207;
            end;
            local function _()
                return os.clock() - v215 > 0.5;
            end;
            for _, v219 in ipairs(l_l_Players_0_Players_0) do
                if not (not (v219 ~= l_LocalPlayer_0) or not v219.Character) then
                    if not (os.clock() - v215 > 0.5) then
                        local l_BoundingBox_0, v221 = v219.Character:GetBoundingBox();
                        local l_Magnitude_0 = (l_BoundingBox_0.Position - v211).Magnitude;
                        if getDistanceAlongCamLookVector(l_BoundingBox_0, l_CurrentCamera_0) < 0 then
                            v207.checkedPlayers = v207.checkedPlayers + 1;
                        else
                            local v223, v224 = getViewportCorners(getBBCorners(l_BoundingBox_0, v221), l_CurrentCamera_0);
                            if not (v224.X ~= 0) or v224.Y == 0 then
                                v207.checkedPlayers = v207.checkedPlayers + 1;
                            else
                                local v225, v226 = getVisibleParts(l_CurrentCamera_0, v219, v213);
                                if not (os.clock() - v215 > 0.5) then
                                    local v227 = #v226 / v225;
                                    if not v2() then
                                        v214[v219.UserId] = {
                                            player = v219, 
                                            distance = l_Magnitude_0, 
                                            boundingBox = {
                                                min = v223, 
                                                max = v224
                                            }, 
                                            hitRate = v227, 
                                            convexHull = getCoveringPolygon(v226, l_CurrentCamera_0, l_Character_1)
                                        };
                                    else
                                        local v228, v229 = getCoveringPolygon2(v226, l_CurrentCamera_0);
                                        v214[v219.UserId] = {
                                            player = v219, 
                                            distance = l_Magnitude_0, 
                                            boundingBox = {
                                                min = v223, 
                                                max = v224
                                            }, 
                                            hitRate = v227, 
                                            convexHull = v228, 
                                            pointProcessingStats = v229
                                        };
                                    end;
                                    v207.checkedPlayers = v207.checkedPlayers + 1;
                                else
                                    local l_v214_0 = v214;
                                    v207.duration = os.clock() - v215;
                                    return l_v214_0, v207;
                                end;
                            end;
                        end;
                    else
                        local l_v214_1 = v214;
                        v207.duration = os.clock() - v215;
                        return l_v214_1, v207;
                    end;
                end;
            end;
            local l_v214_2 = v214;
            v207.duration = os.clock() - v215;
            return l_v214_2, v207;
        else
            return {}, v207;
        end;
    else
        return {}, v207;
    end;
end;
return v10;

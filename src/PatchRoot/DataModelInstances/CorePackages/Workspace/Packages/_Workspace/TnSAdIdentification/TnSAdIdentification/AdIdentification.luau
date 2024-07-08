local l_AdService_0 = game:GetService("AdService");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("TnSAdIdentification");
local v3 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableFilterUnservedAdsFromAbuseReport);
local v4 = require(l_script_FirstAncestor_0.Flags.GetFFlagAdIdentificationFixes);
local v5 = math.max(require(l_script_FirstAncestor_0.Flags.GetFIntAdIdentificationMinimumAreaPerMyriad)() / 10000, 0);
local v6 = if not v3() then nil else "11307989327";
local v7 = {};
shouldIgnoreLocalCharacter = function(v8)
    local l_Head_0 = v8:FindFirstChild("Head");
    if not l_Head_0 or not l_Head_0:IsA("BasePart") then
        return false;
    else
        return l_Head_0.LocalTransparencyModifier >= 0.95;
    end;
end;
getLocalCharacterPosition = function(v10)
    local l_HumanoidRootPart_0 = v10:FindFirstChild("HumanoidRootPart");
    if l_HumanoidRootPart_0 then
        return l_HumanoidRootPart_0.Position;
    else
        return nil;
    end;
end;
getDistanceAlongLookVector = function(v12, v13, v14)
    return ((v12.Position - v13.CFrame.Position):Dot(v14));
end;
local v15 = Vector2.new(0, 0);
local v16 = Vector2.new(math.huge, math.huge);
getViewportCorners = function(v17, v18)
    local l_v16_0 = v16;
    local l_v15_0 = v15;
    local l_ViewportSize_0 = v18.ViewportSize;
    local v22 = 0;
    for _, v24 in ipairs(v17) do
        local v25, v26 = v18:WorldToViewportPoint(v24);
        local v27 = Vector2.new(v25.X, v25.Y) / l_ViewportSize_0;
        if not v26 then
            v27 = Vector2.new(math.clamp(v27.X, 0, 1), (math.clamp(v27.Y, 0, 1)));
        end;
        v22 = v22 + 1;
        l_v16_0 = l_v16_0:Min(v27);
        l_v15_0 = l_v15_0:Max(v27);
    end;
    if v22 <= 2 then
        return v16, v15;
    else
        return l_v16_0, l_v15_0;
    end;
end;
getBBCorners = function(v28, v29)
    local v30 = table.create(4);
    local l_XVector_0 = v28.XVector;
    local l_YVector_0 = v28.YVector;
    local v33 = 1;
    for v34 = -0.5, 0.5 do
        local v35 = (l_XVector_0 * v34) * v29.X;
        for v36 = -0.5, 0.5 do
            v30[v33] = (v28.Position + v35) + (l_YVector_0 * v36) * v29.Y;
            v33 = v33 + 1;
        end;
    end;
    return v30;
end;
dfs = function(v37, v38, v39, v40, v41)
    if not ((#v38 >= v40 and v40 >= 1) and #v38[1] >= v41) or v41 < 1 then
        return v37;
    elseif not v39[v40][v41] then
        if v38[v40][v41].x_i == -1 and v38[v40][v41].y_i == -1 then
            return v37;
        else
            v39[v40][v41] = true;
            table.insert(v37.vertices, v38[v40][v41].localPosition);
            dfs(v37, v38, v39, v40 + 1, v41);
            dfs(v37, v38, v39, v40 - 1, v41);
            dfs(v37, v38, v39, v40, v41 + 1);
            dfs(v37, v38, v39, v40, v41 - 1);
            return v37;
        end;
    else
        return v37;
    end;
end;
getRegions = function(v42, v43)
    local v44 = {};
    for v45, _ in ipairs(v42) do
        for v47, _ in ipairs(v42[v45]) do
            if not v43[v45][v47] then
                local v49 = dfs({
                    vertices = {}
                }, v42, v43, v45, v47);
                if #v49.vertices > 0 then
                    table.insert(v44, v49);
                end;
            end;
        end;
    end;
    return v44;
end;
checkVisibility = function(v50, v51, v52, v53)
    local l_Position_0 = v50.CFrame.Position;
    local l_ViewportSize_1 = v50.ViewportSize;
    local v56 = RaycastParams.new();
    v56.FilterType = Enum.RaycastFilterType.Exclude;
    v56.FilterDescendantsInstances = v53;
    v56.IgnoreWater = true;
    local v57 = 0;
    local v58 = 0;
    local v59 = v52[2] - v52[1];
    local v60 = v52[3] - v52[1];
    for v61 = 1, 4 do
        local v62 = (v59 * (v61 - 0.5)) / 4;
        for v63 = 1, 4 do
            local v64 = (v52[1] + v62) + (v60 * (v63 - 0.5)) / 4;
            local v65 = v64 - l_Position_0;
            v57 = v57 + 1;
            local v66, _ = v50:WorldToViewportPoint(v64);
            if (((v66.Z >= 0 and v66.X >= 0) and v66.Y >= 0) and l_ViewportSize_1.X >= v66.X) and l_ViewportSize_1.Y >= v66.Y then
                local v68 = workspace:Raycast(l_Position_0, v65 * 1.1, v56);
                if v68 and v68.Instance == v51 then
                    v58 = v58 + 1;
                end;
            end;
        end;
    end;
    return v58 / v57;
end;
getVisibleParts = function(v69, v70, v71, v72, v73)
    local l_Position_1 = v69.CFrame.Position;
    local v75 = RaycastParams.new();
    v75.FilterType = Enum.RaycastFilterType.Exclude;
    v75.FilterDescendantsInstances = v73;
    v75.IgnoreWater = true;
    local v76 = 0;
    local v77 = {};
    local v78 = math.sqrt((v72.X * v72.Y) / 25);
    if v78 == 0 then
        return 0, {};
    else
        if v72.X < v78 then
            v78 = v72.X;
        end;
        if v72.Y < v78 then
            v78 = v72.Y;
        end;
        local v79 = math.round(v72.X / v78);
        local v80 = math.round(v72.Y / v78);
        local v81 = v72.X / v79;
        local v82 = v72.Y / v80;
        local v83 = {};
        local v84 = {};
        for v85 = 1, v79 do
            v83[v85] = {};
            v84[v85] = {};
            local v86 = (-0.5 * v72.X + 0.5 * v81) + v81 * (v85 - 1);
            for v87 = 1, v80 do
                local v88 = (-0.5 * v72.Y + 0.5 * v82) + v82 * (v87 - 1);
                local v89 = Vector2.new(v86, v88);
                local v90 = v71:PointToWorldSpace((Vector3.new(v86, v88, 0))) - l_Position_1;
                v76 = v76 + 1;
                local v91 = workspace:Raycast(l_Position_1, v90, v75);
                if v91 and v91.Instance == v70 then
                    v83[v85][v87] = {
                        localPosition = v89, 
                        x_i = v85, 
                        y_i = v87
                    };
                else
                    v83[v85][v87] = {
                        localPosition = v89, 
                        x_i = -1, 
                        y_i = -1
                    };
                end;
                v84[v85][v87] = false;
            end;
        end;
        local v92 = getRegions(v83, v84);
        local v93 = {};
        local function v98(v94, v95, v96)
            local v97 = 10000000 * math.floor(v94) + math.floor(v95);
            if not v93[v97] then
                table.insert(v96.vertices, Vector2.new(math.clamp(v94, v72.X * -0.5, v72.X * 0.5), (math.clamp(v95, v72.Y * -0.5, v72.Y * 0.5))));
                v93[v97] = true;
                return ;
            else
                return ;
            end;
        end;
        local function v103(v99, v100)
            for v101 = -0.5, 0.5 do
                for v102 = -0.5, 0.5 do
                    v98(v100.X + v101 * v81, v100.Y + v102 * v82, v99);
                end;
            end;
        end;
        for _, v105 in ipairs(v92) do
            local v106 = {
                vertices = {}
            };
            for _, v108 in ipairs(v105.vertices) do
                v103(v106, v108);
            end;
            table.insert(v77, v106);
        end;
        return v76, v77;
    end;
end;
getConvexHull = function(v109)
    if #v109 <= 2 then
        return {};
    else
        local v110 = {};
        local v111 = v109[1];
        local v112 = {};
        for v113 = 2, #v109 do
            local v114 = v109[v113];
            if not (v114.Y >= v111.Y) or v114.Y == v111.Y and v114.X < v111.X then
                v111 = v114;
            end;
        end;
        table.insert(v110, v111);
        local function _(v115, v116, v117)
            return (v116 - v115):Cross(v117 - v116);
        end;
        local function _(v119)
            local v120 = v119 - v111;
            return (math.atan2(v120.Y, v120.X));
        end;
        for _, v123 in ipairs(v109) do
            if v123 ~= v111 then
                local l_X_0 = v123.X;
                local l_Y_0 = v123.Y;
                local v126 = v123 - v111;
                table.insert(v112, (Vector3.new(l_X_0, l_Y_0, (math.atan2(v126.Y, v126.X)))));
            end;
        end;
        table.sort(v112, function(v127, v128)
            if v127.Z ~= v128.Z then
                return v127.Z < v128.Z;
            else
                return (Vector2.new(v127.X, v127.Y) - v111).Magnitude < (Vector2.new(v128.X, v128.Y) - v111).Magnitude;
            end;
        end);
        local v129 = {};
        local v130 = v112[1];
        for v131 = 2, #v112 do
            local v132 = v112[v131];
            if v130.Z == v132.Z then
                v130 = v132;
            else
                table.insert(v129, Vector2.new(v130.X, v130.Y));
                v130 = v132;
            end;
        end;
        table.insert(v129, Vector2.new(v130.X, v130.Y));
        if #v129 == 1 then
            return {};
        else
            table.insert(v110, v129[1]);
            table.insert(v110, v129[2]);
            for v133 = 3, #v129 do
                local v134 = v129[v133];
                while #v110 > 1 do
                    local v135 = v110[#v110 - 1];
                    local v136 = v110[#v110];
                    if (v136 - v135):Cross(v134 - v136) <= 0 then
                        table.remove(v110);
                    else
                        break;
                    end;
                end;
                table.insert(v110, v134);
            end;
            return v110;
        end;
    end;
end;
getCoveringPolygon = function(v137, v138, v139)
    local l_ViewportSize_2 = v139.ViewportSize;
    local v141 = table.create(#v137);
    v141 = getConvexHull(v137);
    for v142, v143 in ipairs(v141) do
        local v144, _ = v139:WorldToViewportPoint((v138:PointToWorldSpace((Vector3.new(v143.X, v143.Y, 0)))));
        v141[v142] = Vector2.new(v144.X, v144.Y) / l_ViewportSize_2;
    end;
    return v141;
end;
createSingleVisibleRegionFromWorldSpaceCorners = function(v146, v147)
    local l_ViewportSize_3 = v147.ViewportSize;
    local v149 = table.create(#v146);
    for v150, v151 in ipairs(v146) do
        local v152, _ = v147:WorldToViewportPoint(v151);
        v149[v150] = Vector2.new(v152.X, v152.Y) / l_ViewportSize_3;
    end;
    return {
        convexHull = {
            v149[1], 
            v149[2], 
            v149[4], 
            v149[3]
        }, 
        id = 1
    };
end;
getAdCenterAndScreenArea = function(v154, v155)
    local l_ViewportSize_4 = v155.ViewportSize;
    local v157 = Vector3.new(0, 0, 0);
    local v158 = 0;
    local v159 = {};
    for _, v161 in ipairs(v154) do
        v157 = v157 + v161;
        local v162, _ = v155:WorldToViewportPoint(v161);
        table.insert(v159, Vector2.new(v162.X, v162.Y) / l_ViewportSize_4);
    end;
    return v157 / 4, ((v158 + math.abs(((v159[2] - v159[1]):Cross(v159[3] - v159[1])))) + math.abs(((v159[2] - v159[4]):Cross(v159[3] - v159[4])))) / 2;
end;
v7.getAdsForPoint = function(v164, v165)
    local v166 = {};
    for v167, v168 in pairs(v164) do
        local l_boundingBox_0 = v168.boundingBox;
        if ((v165.X >= l_boundingBox_0.min.X and v165.Y >= l_boundingBox_0.min.Y) and l_boundingBox_0.max.X >= v165.X) and l_boundingBox_0.max.Y >= v165.Y then
            for _, v171 in ipairs(v168.visibleRegions) do
                local l_convexHull_0 = v171.convexHull;
                if #l_convexHull_0 >= 3 then
                    local v173 = l_convexHull_0[#l_convexHull_0];
                    local v174 = true;
                    local v175 = true;
                    for _, v177 in ipairs(l_convexHull_0) do
                        local v178 = (v177 - v173):Cross(v165 - v173);
                        v175 = v175 and v178 <= 0;
                        v174 = v174 and v178 >= 0;
                        v173 = v177;
                    end;
                    if not (not v174 and not v175) then
                        v166[v167] = v168;
                        break;
                    end;
                end;
            end;
        end;
    end;
    return v166;
end;
v7.getVisibleAds = function()
    local v179 = {};
    local v180 = {
        totalAds = 0, 
        checkedAds = 0, 
        duration = 0
    };
    if game:GetEngineFeature("GetReportAdInfo") then
        local l_l_AdService_0_ReportAdInfo_0 = l_AdService_0:GetReportAdInfo();
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        if l_CurrentCamera_0 then
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            if l_LocalPlayer_0 then
                local l_Character_0 = l_LocalPlayer_0.Character;
                local v185 = nil;
                local v186 = nil;
                local v187 = {};
                if not l_Character_0 then
                    v185 = l_CurrentCamera_0.CFrame.Position;
                    v186 = false;
                else
                    v185 = getLocalCharacterPosition(l_Character_0) or l_CurrentCamera_0.CFrame.Position;
                    if shouldIgnoreLocalCharacter(l_Character_0) then
                        v187[#v187 + 1] = l_Character_0;
                    end;
                end;
                local v188 = os.clock();
                v180.totalAds = #l_l_AdService_0_ReportAdInfo_0;
                local function _()
                    v180.duration = os.clock() - v188;
                    return v180;
                end;
                local function _()
                    return os.clock() - v188 > 0.2;
                end;
                local v191 = 1;
                for _, v193 in ipairs(l_l_AdService_0_ReportAdInfo_0) do
                    if not (os.clock() - v188 > 0.2) then
                        local l_basePart_0 = v193.basePart;
                        local l_assetCFrame_0 = v193.assetCFrame;
                        local l_adUnitName_0 = v193.adUnitName;
                        local l_assetId_0 = v193.assetId;
                        local l_encryptedAdTrackingData_0 = v193.encryptedAdTrackingData;
                        local l_encryptionMetadata_0 = v193.encryptionMetadata;
                        if not (not v3() or not v6) and (not (l_encryptedAdTrackingData_0 ~= "" and l_encryptionMetadata_0 ~= "") or l_assetId_0 == v6) then
                            v180.checkedAds = v180.checkedAds + 1;
                        elseif not v4() then
                            local v200 = Vector2.new(l_basePart_0.Size.X, l_basePart_0.Size.Y);
                            local l_Magnitude_0 = (l_assetCFrame_0.Position - v185).Magnitude;
                            if getDistanceAlongLookVector(l_assetCFrame_0, l_CurrentCamera_0, l_CurrentCamera_0.CFrame.LookVector) < 0 then
                                v180.checkedAds = v180.checkedAds + 1;
                            elseif getDistanceAlongLookVector(l_assetCFrame_0, l_CurrentCamera_0, l_assetCFrame_0.LookVector) > 0 then
                                v180.checkedAds = v180.checkedAds + 1;
                            else
                                local v202, v203 = getViewportCorners(getBBCorners(l_assetCFrame_0, v200), l_CurrentCamera_0);
                                if v203.X ~= 0 and v203.Y ~= 0 then
                                    local v204, v205 = getVisibleParts(l_CurrentCamera_0, l_basePart_0, l_assetCFrame_0, v200, v187);
                                    local v206 = {};
                                    for v207, v208 in ipairs(v205) do
                                        table.insert(v206, {
                                            convexHull = getCoveringPolygon(v208.vertices, l_assetCFrame_0, l_CurrentCamera_0), 
                                            id = v207
                                        });
                                    end;
                                    if not (os.clock() - v188 > 0.2) then
                                        v179[v191] = {
                                            distance = l_Magnitude_0, 
                                            boundingBox = {
                                                min = v202, 
                                                max = v203
                                            }, 
                                            hitRate = #v205 / v204, 
                                            visibleRegions = v206, 
                                            adUnitName = l_adUnitName_0, 
                                            assetId = l_assetId_0, 
                                            encryptedAdTrackingData = l_encryptedAdTrackingData_0, 
                                            encryptionMetadata = l_encryptionMetadata_0
                                        };
                                        v180.checkedAds = v180.checkedAds + 1;
                                        v191 = v191 + 1;
                                    else
                                        local l_v179_0 = v179;
                                        v180.duration = os.clock() - v188;
                                        return l_v179_0, v180;
                                    end;
                                end;
                            end;
                        else
                            local l_assetCorners_0 = v193.assetCorners;
                            if not l_assetCorners_0 or #l_assetCorners_0 < 4 then
                                v180.checkedAds = v180.checkedAds + 1;
                            else
                                local v211, v212 = getAdCenterAndScreenArea(l_assetCorners_0, l_CurrentCamera_0);
                                local l_Magnitude_1 = (v211 - v185).Magnitude;
                                if (v211 - l_CurrentCamera_0.CFrame.Position):Dot(l_CurrentCamera_0.CFrame.LookVector) < 0 then
                                    v180.checkedAds = v180.checkedAds + 1;
                                else
                                    local l_Unit_0 = (l_assetCorners_0[1] - l_assetCorners_0[2]):Cross(l_assetCorners_0[1] - l_assetCorners_0[3]).Unit;
                                    if l_Unit_0:Dot(v211 - l_basePart_0.Position) < 0 then
                                        l_Unit_0 = -l_Unit_0;
                                    end;
                                    if (l_CurrentCamera_0.CFrame.Position - v211):Dot(l_Unit_0) < 0 then
                                        v180.checkedAds = v180.checkedAds + 1;
                                    else
                                        local v215, v216 = getViewportCorners(l_assetCorners_0, l_CurrentCamera_0);
                                        if v215 == v16 then
                                            v180.checkedAds = v180.checkedAds + 1;
                                        elseif v212 < v5 then
                                            v180.checkedAds = v180.checkedAds + 1;
                                        else
                                            local v217 = checkVisibility(l_CurrentCamera_0, l_basePart_0, l_assetCorners_0, v187);
                                            if v217 < 0.3 then
                                                v180.checkedAds = v180.checkedAds + 1;
                                            elseif not (os.clock() - v188 > 0.2) then
                                                v179[v191] = {
                                                    distance = l_Magnitude_1, 
                                                    boundingBox = {
                                                        min = v215, 
                                                        max = v216
                                                    }, 
                                                    hitRate = v217, 
                                                    visibleRegions = {
                                                        createSingleVisibleRegionFromWorldSpaceCorners(l_assetCorners_0, l_CurrentCamera_0)
                                                    }, 
                                                    adUnitName = l_adUnitName_0, 
                                                    assetId = l_assetId_0, 
                                                    encryptedAdTrackingData = l_encryptedAdTrackingData_0, 
                                                    encryptionMetadata = l_encryptionMetadata_0
                                                };
                                                v180.checkedAds = v180.checkedAds + 1;
                                                v191 = v191 + 1;
                                            else
                                                local l_v179_1 = v179;
                                                v180.duration = os.clock() - v188;
                                                return l_v179_1, v180;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    else
                        local l_v179_2 = v179;
                        v180.duration = os.clock() - v188;
                        return l_v179_2, v180;
                    end;
                end;
                local l_v179_3 = v179;
                v180.duration = os.clock() - v188;
                return l_v179_3, v180;
            else
                return v179, v180;
            end;
        else
            return v179, v180;
        end;
    else
        return v179, v180;
    end;
end;
return v7;

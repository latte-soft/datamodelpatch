local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameAssetReporting");
local _ = require(l_script_FirstAncestor_0.Analysis.Types);
local v3 = require(l_script_FirstAncestor_0.Flags.GetFIntIGARRaycastTargetCount);
local v4 = require(l_script_FirstAncestor_0.Flags.GetFIntIGARSubtreeDivergenceThresholdPerMille);
local v5 = require(l_script_FirstAncestor_0.Analysis.extractAssetIdsFromInstance);
local v6 = Random.new();
getRandomSampleUniformDisk = function(v7, v8, v9)
    local v10 = nil;
    local v11 = nil;
    local v12 = 0;
    while true do
        local v13 = (v6:NextNumber() * 2) * 3.141592653589793;
        local v14 = math.sqrt((v6:NextNumber())) * v8;
        local v15 = math.cos(v13) * v14;
        local v16 = math.sin(v13) * v14;
        v10 = v7.X + v15;
        v11 = v7.Y + v16;
        v12 = v12 + 1;
        if v12 > 6 then
            return v7;
        elseif not (not ((v10 >= 0 and v10 <= v9.X) and v11 >= 0) or v11 > v9.Y) then
            return Vector2.new(v10, v11);
        end;
    end;
end;
interpretAnnotation = function(v17, v18, v19)
    local v20 = false;
    local v21 = {
        hitCountMap = {}, 
        stats = {
            targetCount = v3(), 
            completedCount = 0, 
            hitCount = 0, 
            resumptionCount = 0, 
            wallTime = 0, 
            computeTime = 0
        }, 
        highlights = {}, 
        topLevelObjects = {}, 
        errorReason = nil, 
        cancel = function()
            v20 = true;
        end
    };
    v21.raycastComputation = coroutine.create(function()
        v19(v21);
    end);
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if l_CurrentCamera_0 == nil then
        v21.errorReason = "No camera";
        return v21;
    else
        local l_ViewportSize_0 = l_CurrentCamera_0.ViewportSize;
        if not ((v17.X >= 0 and l_ViewportSize_0.X >= v17.X) and v17.Y >= 0) or l_ViewportSize_0.Y < v17.Y then
            v21.errorReason = "Coordinates out of bounds";
            return v21;
        elseif not (v18 > 0) or math.max(l_ViewportSize_0.X, l_ViewportSize_0.Y) < v18 then
            v21.errorReason = "Invalid radius";
            return v21;
        else
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            if l_LocalPlayer_0 == nil then
                v21.errorReason = "No local player";
                return v21;
            else
                local v25 = {
                    l_LocalPlayer_0.Character
                };
                v21.raycastComputation = coroutine.create(function()
                    local v26 = RaycastParams.new();
                    v26.FilterType = Enum.RaycastFilterType.Exclude;
                    v26.FilterDescendantsInstances = v25;
                    v26.IgnoreWater = true;
                    local v27 = os.clock();
                    local v28 = os.clock();
                    for _ = 1, v21.stats.targetCount do
                        if not v20 then
                            if v28 + 0.011111111111111112 < os.clock() then
                                local l_stats_0 = v21.stats;
                                l_stats_0.computeTime = l_stats_0.computeTime + (os.clock() - v28);
                                task.wait();
                                v28 = os.clock();
                                l_stats_0 = v21.stats;
                                l_stats_0.resumptionCount = l_stats_0.resumptionCount + 1;
                                if v20 then
                                    break;
                                end;
                            end;
                            local v31 = getRandomSampleUniformDisk(v17, v18, l_ViewportSize_0);
                            local v32 = l_CurrentCamera_0:ViewportPointToRay(v31.X, v31.Y);
                            local v33 = nil;
                            for _ = 1, 5 do
                                v33 = workspace:Raycast(v32.Origin, v32.Direction * 5000, v26);
                                if v33 ~= nil then
                                    local l_Instance_0 = v33.Instance;
                                    if (1 - l_Instance_0.Transparency) * (1 - l_Instance_0.LocalTransparencyModifier) <= 0.05 then
                                        table.insert(v25, l_Instance_0);
                                        v26.FilterDescendantsInstances = v25;
                                        v33 = nil;
                                    else
                                        break;
                                    end;
                                else
                                    break;
                                end;
                            end;
                            if v33 then
                                local l_Instance_1 = v33.Instance;
                                if l_Instance_1 ~= nil then
                                    local l_stats_1 = v21.stats;
                                    l_stats_1.hitCount = l_stats_1.hitCount + 1;
                                end;
                                local v38 = nil;
                                while not (not (l_Instance_1 ~= nil) or not l_Instance_1:IsA("PVInstance") and not l_Instance_1:IsA("Accessory")) and l_Instance_1 ~= workspace do
                                    if not v21.hitCountMap[l_Instance_1] then
                                        v21.hitCountMap[l_Instance_1] = {
                                            raycastHits = 0, 
                                            children = {}
                                        };
                                    end;
                                    local v39 = v21.hitCountMap[l_Instance_1];
                                    v39.raycastHits = v39.raycastHits + 1;
                                    if v38 then
                                        v21.hitCountMap[l_Instance_1].children[v38] = true;
                                    end;
                                    v38 = l_Instance_1;
                                    l_Instance_1 = l_Instance_1.Parent;
                                end;
                                if v38 then
                                    v21.topLevelObjects[v38] = (v21.topLevelObjects[v38] or 0) + 1;
                                end;
                            end;
                            local l_stats_2 = v21.stats;
                            l_stats_2.completedCount = l_stats_2.completedCount + 1;
                        else
                            break;
                        end;
                    end;
                    v21.stats.wallTime = os.clock() - v27;
                    local l_stats_3 = v21.stats;
                    l_stats_3.computeTime = l_stats_3.computeTime + (os.clock() - v28);
                    v19(v21);
                end);
                return v21;
            end;
        end;
    end;
end;
createPlayerCharacterReferenceToPlayerMap = function(v42)
    local v43 = {};
    for _, v45 in ipairs(v42) do
        local l_Character_0 = v45.Character;
        if l_Character_0 then
            v43[l_Character_0] = v45;
        end;
    end;
    return v43;
end;
descendingOrderBySecondElement = function(v47, v48)
    return v48[2] < v47[2];
end;
createTraversalTaskList = function(v49, v50)
    local v51 = {};
    local v52 = {};
    local v53 = createPlayerCharacterReferenceToPlayerMap(l_Players_0:GetPlayers());
    local v54 = {};
    for v55, v56 in pairs(v50) do
        table.insert(v54, {
            v55, 
            v56
        });
    end;
    table.sort(v54, descendingOrderBySecondElement);
    local v57 = v4() / 1000;
    for _, v59 in ipairs(v54) do
        local v60 = v59[1];
        local v61 = v59[2];
        if v53[v60] ~= nil then
            table.insert(v52, {
                player = v53[v60], 
                count = v61
            });
        else
            local v62 = 0;
            local l_v60_0 = v60;
            while v49[l_v60_0] do
                local v64 = v49[l_v60_0];
                local l_raycastHits_0 = v64.raycastHits;
                local l_children_0 = v64.children;
                local v67 = 0;
                for v68, _ in pairs(l_children_0) do
                    if v49[v68] then
                        v67 = v67 + 1;
                    end;
                end;
                if v67 ~= 0 then
                    local v70 = 0;
                    for v71, _ in pairs(l_children_0) do
                        if v49[v71] then
                            v70 = math.max(v70, v49[v71].raycastHits);
                        end;
                    end;
                    if v70 / l_raycastHits_0 >= v57 then
                        local v73 = nil;
                        local v74 = 0;
                        for v75, _ in pairs(l_children_0) do
                            if v49[v75] and v74 < v49[v75].raycastHits then
                                v73 = v75;
                                v74 = v49[v75].raycastHits;
                            end;
                        end;
                        l_v60_0 = v73;
                        v62 = v62 + 1;
                    else
                        break;
                    end;
                else
                    break;
                end;
            end;
            table.insert(v51, {
                instance = l_v60_0, 
                count = v61
            });
            if l_v60_0 ~= v60 then
                table.insert(v51, {
                    instance = v60, 
                    count = v61
                });
            end;
        end;
    end;
    return v51, v52;
end;
mutateMergeExtractedAssets = function(v77, v78, v79)
    for _, v81 in ipairs(v79.Image) do
        if not v77[v81] then
            v77[v81] = true;
            table.insert(v78.Image, v81);
        end;
    end;
    for _, v83 in ipairs(v79.Mesh) do
        if not v77[v83] then
            v77[v83] = true;
            table.insert(v78.Mesh, v83);
        end;
    end;
    for _, v85 in ipairs(v79.Model) do
        if not v77[v85] then
            v77[v85] = true;
            table.insert(v78.Model, v85);
        end;
    end;
    for _, v87 in ipairs(v79.Package) do
        if not v77[v87.id] then
            v77[v87.id] = true;
            table.insert(v78.Package, v87);
        end;
    end;
end;
extractItemsFromInterpretations = function(v88, v89)
    local v90 = false;
    local v91 = {
        extractedAssets = {
            Package = {}, 
            Model = {}, 
            Image = {}, 
            Mesh = {}
        }, 
        extractedPlayers = {}, 
        cancel = function()
            v90 = true;
        end, 
        stats = {
            hitCountMapSize = 0, 
            topLevelObjectsSize = 0, 
            instancesTraversed = 0, 
            traversalTaskListSize = 0, 
            traversalTasksCompleted = 0, 
            playersCount = 0, 
            resumptionCount = 0, 
            wallTime = 0, 
            computeTime = 0, 
            raycastTargetCount = 0, 
            raycastCompletedCount = 0, 
            raycastResumptionCount = 0, 
            raycastComputeTime = 0
        }
    };
    v91.computation = coroutine.create(function()
        v89(v91);
    end);
    for _, v93 in ipairs(v88) do
        v93.cancel();
        local l_stats_4 = v91.stats;
        l_stats_4.raycastTargetCount = l_stats_4.raycastTargetCount + v93.stats.targetCount;
        l_stats_4 = v91.stats;
        l_stats_4.raycastCompletedCount = l_stats_4.raycastCompletedCount + v93.stats.completedCount;
        l_stats_4 = v91.stats;
        l_stats_4.raycastResumptionCount = l_stats_4.raycastResumptionCount + v93.stats.resumptionCount;
        l_stats_4 = v91.stats;
        l_stats_4.raycastComputeTime = l_stats_4.raycastComputeTime + v93.stats.computeTime;
    end;
    local v95 = os.clock();
    local v96 = {};
    local v97 = {};
    for _, v99 in ipairs(v88) do
        for v100, v101 in pairs(v99.hitCountMap) do
            if not v96[v100] then
                v96[v100] = {
                    raycastHits = 0, 
                    children = {}
                };
                local l_stats_5 = v91.stats;
                l_stats_5.hitCountMapSize = l_stats_5.hitCountMapSize + 1;
            end;
            local v103 = v96[v100];
            v103.raycastHits = v103.raycastHits + v101.raycastHits;
            for v104, _ in pairs(v101.children) do
                v96[v100].children[v104] = true;
            end;
        end;
        for v106, v107 in pairs(v99.topLevelObjects) do
            local v108 = v97[v106];
            if not v108 then
                local l_stats_6 = v91.stats;
                l_stats_6.topLevelObjectsSize = l_stats_6.topLevelObjectsSize + 1;
            end;
            v97[v106] = (v108 or 0) + v107;
        end;
    end;
    local v110, v111 = createTraversalTaskList(v96, v97);
    v91.extractedPlayers = v111;
    v91.stats.playersCount = #v111;
    v91.stats.wallTime = os.clock() - v95;
    v91.stats.traversalTaskListSize = #v110;
    v91.computation = coroutine.create(function()
        local v112 = os.clock();
        local v113 = os.clock();
        local function _()
            return v113 + 0.011111111111111112 < os.clock();
        end;
        local function _()
            local l_stats_7 = v91.stats;
            l_stats_7.computeTime = l_stats_7.computeTime + (os.clock() - v113);
            task.wait();
            v113 = os.clock();
            l_stats_7 = v91.stats;
            l_stats_7.resumptionCount = l_stats_7.resumptionCount + 1;
        end;
        local v117 = {};
        local v118 = {};
        for _, v120 in ipairs(v110) do
            local v121 = {};
            local v122 = {};
            table.insert(v121, v120.instance);
            while true do
                if #v121 > 0 then
                    if v113 + 0.011111111111111112 < os.clock() then
                        local l_stats_8 = v91.stats;
                        l_stats_8.computeTime = l_stats_8.computeTime + (os.clock() - v113);
                        task.wait();
                        v113 = os.clock();
                        l_stats_8 = v91.stats;
                        l_stats_8.resumptionCount = l_stats_8.resumptionCount + 1;
                        if v90 then
                            l_stats_8 = v91.stats;
                            l_stats_8.wallTime = l_stats_8.wallTime + (os.clock() - v112);
                            v89(v91);
                            return ;
                        end;
                    end;
                    local v124 = table.remove(v121);
                    if not v118[v124] then
                        table.insert(v122, v124);
                        local l_v124_Children_0 = v124:GetChildren();
                        local v126 = {};
                        for _, v128 in pairs(l_v124_Children_0) do
                            table.insert(v126, {
                                v128, 
                                not v96[v128] and 0 or v96[v128].raycastHits
                            });
                        end;
                        table.sort(v126, descendingOrderBySecondElement);
                        for _, v130 in ipairs(v126) do
                            table.insert(v121, v130[1]);
                        end;
                        v118[v124] = true;
                    end;
                else
                    while true do
                        if #v122 > 0 then
                            if v113 + 0.011111111111111112 < os.clock() then
                                local l_stats_9 = v91.stats;
                                l_stats_9.computeTime = l_stats_9.computeTime + (os.clock() - v113);
                                task.wait();
                                v113 = os.clock();
                                l_stats_9 = v91.stats;
                                l_stats_9.resumptionCount = l_stats_9.resumptionCount + 1;
                                if v90 then
                                    l_stats_9 = v91.stats;
                                    l_stats_9.wallTime = l_stats_9.wallTime + (os.clock() - v112);
                                    v89(v91);
                                    return ;
                                end;
                            end;
                            local v132 = v5((table.remove(v122)));
                            if v132 then
                                mutateMergeExtractedAssets(v117, v91.extractedAssets, v132);
                            end;
                            local l_stats_10 = v91.stats;
                            l_stats_10.instancesTraversed = l_stats_10.instancesTraversed + 1;
                        else
                            local l_stats_11 = v91.stats;
                            l_stats_11.traversalTasksCompleted = l_stats_11.traversalTasksCompleted + 1;
                            goto label0 --[[  false, false  ]];
                        end;
                    end;
                end;
            end;
            ::label0::;
        end;
        local l_stats_12 = v91.stats;
        l_stats_12.wallTime = l_stats_12.wallTime + (os.clock() - v112);
        l_stats_12 = v91.stats;
        l_stats_12.computeTime = l_stats_12.computeTime + (os.clock() - v113);
        v89(v91);
    end);
    return v91;
end;
return {
    interpretAnnotation = interpretAnnotation, 
    extractItemsFromInterpretations = extractItemsFromInterpretations, 
    __setRandomGenerator = function(v136)
        v6 = v136;
    end
};

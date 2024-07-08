local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Promise);
game:DefineFastInt("UGCValidationCanPublishRequestPageSize", 50);
game:DefineFastInt("UGCValidationMaxAssetSizeAllowed", 500);
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.util.APIUtil);
local _ = require(l_Parent_0.util.Types);
local l_HttpService_0 = game:GetService("HttpService");
local v6 = string.format("https://apis.%s", (v3.getBaseDomain()));
local l_game_FastInt_0 = game:GetFastInt("UGCValidationCanPublishRequestPageSize");
local l_game_FastInt_1 = game:GetFastInt("UGCValidationMaxAssetSizeAllowed");
local v9 = require(l_Parent_0.Constants);
local v10 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v11 = require(l_Parent_0.flags.getFFlagFixPackageIDFieldName);
local v12 = require(l_Parent_0.flags.getFFlagUGCValidationAnalytics);
local v13 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local function _(v14, v15, v16, v17, v18)
    if #v15 == 0 then
        return v1.resolve();
    else
        return v1.new(function(v19, v20)
            l_HttpService_0:RequestInternal({
                Url = v14, 
                Method = "POST", 
                Body = l_HttpService_0:JSONEncode({
                    assetIds = v15, 
                    restrictedEntities = v16, 
                    universeId = v18
                }), 
                Headers = {
                    [v9.ExperienceAuthHeaderKey] = v17, 
                    [v9.ContentType] = v9.ApplicationJson
                }
            }):Start(function(v21, v22)
                if v21 and v22.StatusCode == 200 then
                    v19((l_HttpService_0:JSONDecode(v22.Body)));
                    return ;
                else
                    v20();
                    return ;
                end;
            end);
        end);
    end;
end;
local function v61(v24, v25)
    local l_isServer_0 = v25.isServer;
    local l_restrictedUserIds_0 = v25.restrictedUserIds;
    local l_token_0 = v25.token;
    local l_universeId_0 = v25.universeId;
    local v30 = v6 .. (not l_isServer_0 and "packages-api/v1/canPublish" or "packages-api/v1/rcc/canPublish");
    local v31 = {
        User = {}, 
        Group = {}
    };
    local v32 = v10.new();
    local v33 = {};
    local v34 = {};
    local v35 = 0;
    for _, v37 in ipairs(l_restrictedUserIds_0) do
        v31[v37.creatorType][tonumber(v37.id)] = true;
    end;
    for v38, _ in v24, nil, nil do
        if not v33[v38] then
            v35 = v35 + 1;
            v33[v38] = true;
        end;
    end;
    if l_game_FastInt_1 < v35 then
        v2.reportFailure(v2.ErrorType.validateAssetCreator_TooManyDependencies);
        return false, {
            "Upload of model has too many children assets (Meshes, Textures, etc.) and cannot be processed as is. You need to rearrange the model."
        };
    else
        local v40 = {};
        for v41, _ in v33, nil, nil do
            if not v11() or v41 ~= 0 then
                table.insert(v40, v41);
                if l_game_FastInt_0 <= #v40 then
                    local l_v40_0 = v40;
                    table.insert(v34, if #l_v40_0 == 0 then v1.resolve() else v1.new(function(v44, v45)
                        l_HttpService_0:RequestInternal({
                            Url = v30, 
                            Method = "POST", 
                            Body = l_HttpService_0:JSONEncode({
                                assetIds = l_v40_0, 
                                restrictedEntities = l_restrictedUserIds_0, 
                                universeId = l_universeId_0
                            }), 
                            Headers = {
                                [v9.ExperienceAuthHeaderKey] = l_token_0, 
                                [v9.ContentType] = v9.ApplicationJson
                            }
                        }):Start(function(v46, v47)
                            if v46 and v47.StatusCode == 200 then
                                v44((l_HttpService_0:JSONDecode(v47.Body)));
                                return ;
                            else
                                v45();
                                return ;
                            end;
                        end);
                    end));
                    v40 = {};
                end;
            end;
        end;
        if #v40 > 0 then
            local l_v40_1 = v40;
            local l_l_v40_1_0 = l_v40_1 --[[ copy: 14 -> 27 ]];
            table.insert(v34, if #l_v40_1 == 0 then v1.resolve() else v1.new(function(v50, v51)
                l_HttpService_0:RequestInternal({
                    Url = v30, 
                    Method = "POST", 
                    Body = l_HttpService_0:JSONEncode({
                        assetIds = l_l_v40_1_0, 
                        restrictedEntities = l_restrictedUserIds_0, 
                        universeId = l_universeId_0
                    }), 
                    Headers = {
                        [v9.ExperienceAuthHeaderKey] = l_token_0, 
                        [v9.ContentType] = v9.ApplicationJson
                    }
                }):Start(function(v52, v53)
                    if v52 and v53.StatusCode == 200 then
                        v50((l_HttpService_0:JSONDecode(v53.Body)));
                        return ;
                    else
                        v51();
                        return ;
                    end;
                end);
            end));
        end;
        local v54, v55 = v1.all(v34):await();
        if v54 then
            for _, v57 in v55, nil, nil do
                for v58, v59 in pairs(v57.result) do
                    if not (not v12() or v59) then
                        v2.reportFailure(v2.ErrorType.validateAssetCreator_DependencyNotOwnedByCreator);
                    end;
                    local v60 = v24[v58];
                    v32:updateReasons(v59, {
                        (string.format("%s.%s ( %s ) being used is not owned by the experience creator or player. You can only publish assets that you own.", v60.instance:GetFullName(), v60.fieldName, v58))
                    });
                end;
            end;
            return v32:getFinalResults();
        else
            v2.reportFailure(v2.ErrorType.validateAssetCreator_FailedToLoad);
            return false, {
                "Failed to load detailed information for model assets. Make sure all model assets exist and try again."
            };
        end;
    end;
end;
local function v98(v62, v63, v64, v65, v66)
    local v67 = v6 .. (not v63 and "packages-api/v1/canPublish" or "packages-api/v1/rcc/canPublish");
    local v68 = {
        User = {}, 
        Group = {}
    };
    local v69 = v10.new();
    local v70 = {};
    local v71 = {};
    local v72 = 0;
    for _, v74 in ipairs(v64) do
        v68[v74.creatorType][tonumber(v74.id)] = true;
    end;
    for v75, _ in v62, nil, nil do
        if not v70[v75] then
            v72 = v72 + 1;
            v70[v75] = true;
        end;
    end;
    if l_game_FastInt_1 < v72 then
        v2.reportFailure(v2.ErrorType.validateAssetCreator_TooManyDependencies);
        return false, {
            "Too many mesh/texture dependencies"
        };
    else
        local v77 = {};
        for v78, _ in v70, nil, nil do
            if not v11() or v78 ~= 0 then
                table.insert(v77, v78);
                if l_game_FastInt_0 <= #v77 then
                    local l_v77_0 = v77;
                    table.insert(v71, if #l_v77_0 == 0 then v1.resolve() else v1.new(function(v81, v82)
                        l_HttpService_0:RequestInternal({
                            Url = v67, 
                            Method = "POST", 
                            Body = l_HttpService_0:JSONEncode({
                                assetIds = l_v77_0, 
                                restrictedEntities = v64, 
                                universeId = v66
                            }), 
                            Headers = {
                                [v9.ExperienceAuthHeaderKey] = v65, 
                                [v9.ContentType] = v9.ApplicationJson
                            }
                        }):Start(function(v83, v84)
                            if v83 and v84.StatusCode == 200 then
                                v81((l_HttpService_0:JSONDecode(v84.Body)));
                                return ;
                            else
                                v82();
                                return ;
                            end;
                        end);
                    end));
                    v77 = {};
                end;
            end;
        end;
        if #v77 > 0 then
            local l_v77_1 = v77;
            local l_l_v77_1_0 = l_v77_1 --[[ copy: 13 -> 26 ]];
            table.insert(v71, if #l_v77_1 == 0 then v1.resolve() else v1.new(function(v87, v88)
                l_HttpService_0:RequestInternal({
                    Url = v67, 
                    Method = "POST", 
                    Body = l_HttpService_0:JSONEncode({
                        assetIds = l_l_v77_1_0, 
                        restrictedEntities = v64, 
                        universeId = v66
                    }), 
                    Headers = {
                        [v9.ExperienceAuthHeaderKey] = v65, 
                        [v9.ContentType] = v9.ApplicationJson
                    }
                }):Start(function(v89, v90)
                    if v89 and v90.StatusCode == 200 then
                        v87((l_HttpService_0:JSONDecode(v90.Body)));
                        return ;
                    else
                        v88();
                        return ;
                    end;
                end);
            end));
        end;
        local v91, v92 = v1.all(v71):await();
        if v91 then
            for _, v94 in v92, nil, nil do
                for v95, v96 in pairs(v94.result) do
                    if not (not v12() or v96) then
                        v2.reportFailure(v2.ErrorType.validateAssetCreator_DependencyNotOwnedByCreator);
                    end;
                    local v97 = v62[v95];
                    v69:updateReasons(v96, {
                        (string.format("%s.%s ( %s ) is not owned by the experience creator or player", v97.instance:GetFullName(), v97.fieldName, v95))
                    });
                end;
            end;
            return v69:getFinalResults();
        else
            v2.reportFailure(v2.ErrorType.validateAssetCreator_FailedToLoad);
            return false, {
                "Failed to load asset detail"
            };
        end;
    end;
end;
if not v13() then
    return v98;
else
    return v61;
end;

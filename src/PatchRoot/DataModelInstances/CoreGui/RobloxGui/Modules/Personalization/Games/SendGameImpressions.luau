local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_Modules_0.LuaApp.AppPage);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local v6 = require(l_CorePackages_0.Cryo);
local _ = require(l_Modules_0.Personalization.DataStoreTypes);
local _ = require(l_Modules_0.Personalization.OmniFeed.DataStore.FeedItemModel);
local _ = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local v10 = require(l_Modules_0.Personalization.Analytics.gameImpressionsEvent);
local v11 = require(l_Modules_0.Personalization.Impressions.reportGameImpressionCounts);
local v12 = require(l_Modules_0.Personalization.Analytics.RobloxTelemetryConfigs.FeedItemRowDataHitCounter);
local v13 = require(l_Modules_0.Personalization.Analytics.RobloxTelemetryConfigs.FeedItemRowDataMissingCounter);
local v14 = require(l_Modules_0.Personalization.Flags.FFlagOmniItemsRowDataEnabled);
local function v37(v15, v16, v17, v18, v19)
    local v20 = {};
    local v21 = {};
    local v22 = {};
    local v23 = {};
    local v24 = {};
    local v25 = {};
    local v26 = {};
    local v27 = {};
    local v28 = {};
    local v29 = false;
    for _, v31 in ipairs(v15) do
        local v32 = v16[v31];
        if v32 ~= nil then
            table.insert(v20, v32.placeId or 0);
            table.insert(v21, v31);
            table.insert(v22, v32.universeId or 0);
            if not v32.isSponsored then
                table.insert(v24, 0);
                table.insert(v25, 0);
            else
                v29 = true;
                table.insert(v24, 1);
                table.insert(v25, v32.adId or 0);
            end;
            if not v14 then
                if v17 and v17 > 0 then
                    table.insert(v26, (math.ceil(v31 / v17)));
                end;
            else
                local v33 = nil;
                local v34 = nil;
                if v17 and v17 > 0 then
                    v33 = math.ceil(v31 / v17);
                    v34 = v31 % v17;
                    if v34 == 0 then
                        v34 = v17;
                    end;
                    table.insert(v26, v33);
                else
                    v4.assert(v17 ~= 0);
                    v33 = 1;
                    v34 = v31;
                end;
                if v19 then
                    table.insert(v27, (v19 + v33) - 1);
                    table.insert(v28, v34);
                end;
            end;
            if v18 then
                table.insert(v23, v32.primaryWideAssetId or "0");
            end;
        end;
    end;
    local v35 = #v20;
    v4.assert(v35 == #v21);
    v4.assert(v35 == #v22);
    v4.assert(v35 == #v24);
    v4.assert(v35 == #v25);
    if #v26 > 0 then
        v4.assert(v35 == #v26);
    end;
    if v14 then
        if #v27 > 0 then
            v4.assert(v35 == #v27);
        end;
        if #v28 > 0 then
            v4.assert(v35 == #v28);
        end;
    end;
    local v36 = {
        rootPlaceIds = table.concat(v20, ","), 
        absPositions = table.concat(v21, ","), 
        universeIds = table.concat(v22, ",")
    };
    if v29 then
        v36.adFlags = table.concat(v24, ",");
        v36.adIds = table.concat(v25, ",");
    end;
    if #v26 > 0 then
        v36.rows = table.concat(v26, ",");
    end;
    if v14 then
        if #v27 > 0 then
            v36.rowsOnPage = table.concat(v27, ",");
        end;
        if #v28 > 0 then
            v36.positionsInRows = table.concat(v28, ",");
        end;
    end;
    if v18 and #v23 > 0 then
        v36.thumbnailAssetIds = table.concat(v23, ",");
    end;
    return v36, v35;
end;
return {
    sendFromTopicContents = function(v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50)
        if v38 and v39 then
            if not v40 or #v40 == 0 then
                return ;
            elseif not v41 or #v41 == 0 then
                return ;
            else
                local v51 = nil;
                if not (not (v14 and v42 == v3.Home) or not v45) then
                    if not v45.startRowNumber or not v45.numberOfRows then
                        v5.default:logRobloxTelemetryCounter(v13);
                    else
                        v5.default:logRobloxTelemetryCounter(v12);
                    end;
                    v51 = if v45.numberOfRows == 0 then nil else v45.startRowNumber;
                end;
                local v52 = nil;
                local v53 = nil;
                local v54, v55 = v37(v40, v41, v48, v49, v51);
                v52 = v54;
                v53 = v55;
                v10(v38, v42, (v6.Dictionary.join(v52, {
                    sortPos = v44, 
                    gameSetTypeId = v43, 
                    gameSetTargetId = v46, 
                    pageId = v47, 
                    componentType = v50, 
                    locale = l_LocalizationService_0.RobloxLocaleId
                })));
                v11(v39, v42, v53);
                return ;
            end;
        else
            return ;
        end;
    end, 
    sendFromSearch = function(v56, v57, v58, v59, v60, v61)
        if v56 and v57 then
            if not v58 or #v58 == 0 then
                return ;
            elseif not v59 or #v59 == 0 then
                return ;
            else
                local v62, v63 = v37(v58, v59);
                v62.locale = l_LocalizationService_0.RobloxLocaleId;
                v10(v56, v60, (v6.Dictionary.join(v62, v61)));
                v11(v57, v60, v63);
                return ;
            end;
        else
            return ;
        end;
    end, 
    sendFromGameDetails = function(v64, v65, v66, v67, v68)
        local v69, v70 = v37(v66, v67);
        v69.locale = l_LocalizationService_0.RobloxLocaleId;
        v69.refId = v68;
        v10(v64, "recommended", v69);
        v11(v65, "recommended", v70);
    end, 
    sendFromSeeAll = function(v71, v72, v73, v74, v75, v76, v77, v78)
        if v71 and v72 then
            if not v73 or #v73 == 0 then
                return ;
            elseif not v74 or #v74 == 0 then
                return ;
            else
                local v79, v80 = v37(v73, v74);
                v10(v71, v75, (v6.Dictionary.join(v79, {
                    gameSetTypeId = v76, 
                    gameSetTargetId = v77, 
                    pageId = v78, 
                    locale = l_LocalizationService_0.RobloxLocaleId, 
                    seeAllFlag = 1
                })));
                v11(v72, v75, v80, 1);
                return ;
            end;
        else
            return ;
        end;
    end
};

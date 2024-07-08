local l_script_FirstAncestor_0 = script:FindFirstAncestor("GamePlayButton");
local v1 = require(l_script_FirstAncestor_0.PlayButtonStates);
local v2 = require(l_script_FirstAncestor_0.FetchGamePlayButtonData);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local l_PlayabilityStatusEnum_0 = require(l_Parent_0.PlayabilityRodux).Enums.PlayabilityStatusEnum;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local v7 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v7.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v7.Hooks.RoactRodux.useSelector;
local l_FetchGamePlayabilityAndProductInfo_0 = require(l_Parent_0.GameDetailRodux).FetchGamePlayabilityAndProductInfo;
local l_GamesProductInfoReducer_0 = require(l_Parent_0.GameProductInfoRodux).GamesProductInfoReducer;
local function v16(v12, v13, v14)
    local _ = nil;
    if v12 == l_RetrievalStatus_0.Done and v13 ~= nil then
        if v13.isPlayable == true then
            return v1.Playable;
        elseif v13.playabilityStatus == l_PlayabilityStatusEnum_0.UniverseRootPlaceIsPrivate then
            return v1.Private;
        elseif (v13.playabilityStatus == l_PlayabilityStatusEnum_0.PurchaseRequired and v14 ~= nil) and v14.isForSale == true then
            return v1.PaidAccess;
        elseif v13.playabilityStatus == l_PlayabilityStatusEnum_0.ContextualPlayabilityUnverifiedSeventeenPlusUser then
            return v1.Playable;
        else
            return v1.UnplayableOther;
        end;
    else
        return v1.Playable;
    end;
end;
return function(v17, v18, v19)
    local v20 = l_useDispatch_0();
    v4.useEffect(function()
        local v21 = nil;
        if v19 ~= nil and v19 > 0 then
            v21 = task.delay(v19, function()
                v21 = nil;
                v20(v2.Fetch(v17, v18));
            end);
        else
            v20(v2.Fetch(v17, v18));
        end;
        return function()
            if v21 ~= nil then
                task.cancel(v21);
            end;
        end;
    end, {
        v18, 
        v19
    });
    local v23 = l_useSelector_0(function(v22)
        return not not v22.PlayabilityStatus and v22.PlayabilityStatus[v18] or nil;
    end);
    return {
        playButtonState = l_useSelector_0(function(v24)
            if not v2.IsLoading(v24, v18) then
                return (v16(l_FetchGamePlayabilityAndProductInfo_0.GetFetchingStatus(v24, v18), v23, not not v24[l_GamesProductInfoReducer_0.key] and v24[l_GamesProductInfoReducer_0.key][v18] or nil));
            else
                return v1.Loading;
            end;
        end), 
        playabilityStatus = v23
    };
end;

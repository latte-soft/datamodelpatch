local l_Parent_0 = script:FindFirstAncestor("GameDetailRodux").Parent;
local v1 = require(l_Parent_0.Promise);
local l_PlayabilityStatusEnum_0 = require(l_Parent_0.PlayabilityRodux).Enums.PlayabilityStatusEnum;
local l_ApiFetchPlayabilityStatus_0 = require(l_Parent_0.PlayabilityRodux).PlayabilityStatus.ApiFetchPlayabilityStatus;
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local l_FetchGamesProductInfo_0 = require(l_Parent_0.GameProductInfoRodux).FetchGamesProductInfo;
return {
    KeyMapper = function(v6)
        return "luaapp.playability-and-productinfo." .. v6;
    end, 
    Fetch = function(v7, v8)
        assert(type(v8) == "string", "FetchPlayabilityAndProductInfo thunk expects universeId to be a string");
        return l_PerformFetch_0.Single("luaapp.playability-and-productinfo." .. v8, function(v9)
            return v9:dispatch(l_ApiFetchPlayabilityStatus_0.Fetch(v7, {
                v8
            })):andThen(function(v10)
                local v11, _ = v10[l_ApiFetchPlayabilityStatus_0.KeyMapper(v8)]:unwrap();
                if not v11 then
                    return v1.reject();
                else
                    local v13 = v9:getState().PlayabilityStatus[v8];
                    if v13.isPlayable == false and v13.playabilityStatus == l_PlayabilityStatusEnum_0.PurchaseRequired then
                        return v9:dispatch(l_FetchGamesProductInfo_0.Fetch(v7, {
                            v8
                        })):andThen(function(v14)
                            local v15, _ = v14[l_FetchGamesProductInfo_0.KeyMapper(v8)]:unwrap();
                            if not v15 then
                                return v1.reject();
                            else
                                return v1.resolve(v13.playabilityStatus);
                            end;
                        end);
                    else
                        return v1.resolve(v13.playabilityStatus);
                    end;
                end;
            end);
        end);
    end, 
    GetFetchingStatus = function(v17, v18)
        return l_PerformFetch_0.GetStatus(v17, "luaapp.playability-and-productinfo." .. v18);
    end
};

local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v2.memo;
local l_useCallback_0 = v2.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v2.useEffect;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v9 = require(l_Parent_0.Loggers).Logger:new("PlaceIdContainer");
local l_ApiFetchPlaceInfos_0 = require(l_Parent_0.PlaceInfoRodux).Thunks.ApiFetchPlaceInfos;
local v11 = require(script.Parent.GameCard);
local v12 = require(script.Parent.GameCardContainer);
local v13 = require(l_Parent_0.HttpRequest);
local v17 = {
    networkImpl = v13.config({
        requestFunction = function(v14, v15, v16)
            v9:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v15, v14));
            return v13.requestFunctions.HttpRbxApi(v14, v15, v16);
        end
    })
};
local function _(v18, v19)
    return v18.ChatAppReducer.PlaceInfos[v19] or {};
end;
PlaceIdContainer = function(v21)
    local v22 = v1.Dictionary.join(v17, v21);
    local v23 = l_useDispatch_0();
    local v26 = l_useCallback_0(function(v24, v25)
        return v23(l_ApiFetchPlaceInfos_0(v24, {
            v25
        }));
    end, l_dependencyArray_0(v23));
    l_useEffect_0(function()
        v26(v22.networkImpl, v22.placeId);
    end, {});
    local v29 = l_useSelector_0(function(v27)
        local l_universeId_0 = (v27.ChatAppReducer.PlaceInfos[v22.placeId] or {}).universeId;
        return not not l_universeId_0 and tostring(l_universeId_0) or nil;
    end);
    if v29 then
        return v2.createElement(v12, v1.Dictionary.join(v22, {
            universeId = v29
        }));
    else
        return v2.createElement(v11, {});
    end;
end;
return l_memo_0(PlaceIdContainer);

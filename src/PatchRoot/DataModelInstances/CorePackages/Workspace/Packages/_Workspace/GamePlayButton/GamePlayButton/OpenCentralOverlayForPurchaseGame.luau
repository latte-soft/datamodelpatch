local l_Parent_0 = script:FindFirstAncestor("GamePlayButton").Parent;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
return function(v3, v4, v5, v6, v7, v8, v9)
    return function(v10)
        v10:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.PurchaseGame, {
            universeId = v3, 
            gameName = v4, 
            price = v5, 
            productId = v6, 
            sellerId = v7, 
            theme = v8, 
            pageFilter = v9
        }));
    end;
end;

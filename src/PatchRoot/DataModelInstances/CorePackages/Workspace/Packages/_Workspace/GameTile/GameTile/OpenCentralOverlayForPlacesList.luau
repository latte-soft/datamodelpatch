local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
return function(v3, v4, v5)
    return function(v6)
        v6:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.PlacesList, {
            game = v3, 
            anchorSpaceSize = v4, 
            anchorSpacePosition = v5
        }));
    end;
end;

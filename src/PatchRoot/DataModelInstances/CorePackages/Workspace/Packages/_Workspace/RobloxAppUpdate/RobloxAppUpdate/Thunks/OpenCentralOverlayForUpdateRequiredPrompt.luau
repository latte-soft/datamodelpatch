local l_Parent_0 = script:FindFirstAncestor("RobloxAppUpdate").Parent;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
return function(v3)
    return function(v4)
        v4:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.UpdateRequiredPrompt, {
            canPerformBinaryUpdate = v3
        }, {
            DisableBackButtonClose = true
        }));
    end;
end;

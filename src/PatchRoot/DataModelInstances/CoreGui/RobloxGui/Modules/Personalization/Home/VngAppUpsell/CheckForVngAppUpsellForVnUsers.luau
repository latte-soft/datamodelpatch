local l_IXPService_0 = game:GetService("IXPService");
local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_CentralOverlayType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).CentralOverlayType;
local l_SetCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Actions.SetCentralOverlay;
local l_useUserExperiment_0 = require(l_CorePackages_0.Packages.RoactAppExperiment).useUserExperiment;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v10 = require(l_Modules_0.LuaApp.getCurrentPage);
local v11 = require(l_Modules_0.LuaApp.Thunks.WaitUntilIXPUserInit);
local v12 = game:DefineFastString("LuaAppVngAppIxpUserLayer", "PlayerApp.HomePageUpsell.VNGApp");
local v13 = game:DefineFastString("LuaAppVngIxpFrequency", "frequency");
local v14 = game:DefineFastString("LuaAppVngIxpDismissable", "dismissable");
local v15 = game:DefineFastString("LuaAppVngIxpEnabled", "enabled");
local v16 = game:DefineFastInt("LuaAppVngUpsellNagFrequencySec", 86400);
local v17 = game:DefineFastFlag("LuaAppVngUpsellAlwaysEnabled", false);
local v18 = game:DefineFastFlag("LuaAppVngUpsellAlwaysCanClose", false);
local v19 = nil;
return function(_)
    local v21, v22 = v3.useState(false);
    local v23 = l_useSelector_0(v10);
    local v24 = l_useDispatch_0();
    local v25 = {};
    if not v17 then
        v25 = l_useUserExperiment_0({
            v12
        }, function(v26)
            local v27 = v26[v12] or {};
            local v28 = tostring(v27[v15]);
            local v29 = tostring(v27[v14]);
            local v30 = {};
            local v31;
            if v28 then
                v31 = true;
                if not (v28 ~= "true") then
                    goto label0;
                end;
            end;
            v31 = false;
            ::label0::;
            v30.upsellEnabled = v31;
            v30.upsellFrequency = v27[v13];
            if v29 then
                v31 = true;
                if not (v29 ~= "true") then
                    goto label1;
                end;
            end;
            v31 = false;
            ::label1::;
            v30.upsellDismissable = v31;
            return v30;
        end);
        v3.useEffect(function()
            if not v21 then
                v24(v11(l_IXPService_0, not not l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0)):andThen(function()
                    v22(true);
                end);
            end;
        end, {
            v21
        });
    end;
    v3.useEffect(function()
        if not (not v17 and (not v21 or not v25.upsellEnabled)) and (not v19 or v19 < DateTime.now().UnixTimestampMillis) then
            local l_v16_0 = v16;
            if v25.upsellFrequency then
                l_v16_0 = tonumber(v25.upsellFrequency);
            end;
            v19 = DateTime.now().UnixTimestampMillis + l_v16_0 * 1000;
            local l_v18_0 = v18;
            if v25.upsellDismissable then
                l_v18_0 = v25.upsellDismissable;
            end;
            v24(l_SetCentralOverlay_0(l_CentralOverlayType_0.VngAppUpsell, {
                isDismissable = l_v18_0
            }));
        end;
    end, {
        v19, 
        v23, 
        v25, 
        v21
    });
    return nil;
end;

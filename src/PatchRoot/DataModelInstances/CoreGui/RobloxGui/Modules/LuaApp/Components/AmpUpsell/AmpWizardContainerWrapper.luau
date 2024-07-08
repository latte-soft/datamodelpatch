local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local v5 = require(l_CorePackages_0.Cryo);
local v6 = require(l_script_FirstAncestor_0.LuaApp.Thunks.Verification.OpenPhoneUpsellModal);
local v7 = require(l_script_FirstAncestor_0.LuaApp.Thunks.Verification.OpenEmailUpsellModal);
local v8 = require(l_script_FirstAncestor_0.LuaApp.AppPage);
local l_WizardContainer_0 = require(l_CorePackages_0.Workspace.Packages.AmpUpsell).WizardContainer;
local l_ActionTypeEnum_0 = require(l_CorePackages_0.Workspace.Packages.AmpUpsell).AmpEnums.ActionTypeEnum;
local l_GetFFlagEnableAmpEmailUpsellSupport_0 = require(l_CorePackages_0.Workspace.Packages.AmpUpsell).GetFFlagEnableAmpEmailUpsellSupport;
local l_GetFFlagEnableAmpIDVUpsellSupport_0 = require(l_CorePackages_0.Workspace.Packages.AmpUpsell).GetFFlagEnableAmpIDVUpsellSupport;
return function(v13)
    local v14 = l_useDispatch_0();
    local v15 = l_useNavigation_0();
    local v17 = v2.useCallback(function(v16)
        v14(v6(v16));
    end, {
        v14
    });
    local v19 = v2.useCallback(function(v18)
        v15.push(v8.AccountSettingsUpsell, {
            extraProps = v18
        });
    end, {
        v15
    });
    local v20 = {
        [l_ActionTypeEnum_0.Phone] = v17
    };
    if l_GetFFlagEnableAmpEmailUpsellSupport_0() then
        v20[l_ActionTypeEnum_0.AddedEmail] = v2.useCallback(function(v21)
            v14(v7(v21));
        end, {
            v14
        });
    end;
    if l_GetFFlagEnableAmpIDVUpsellSupport_0() then
        v20[l_ActionTypeEnum_0.GovernmentId] = v2.useCallback(function(v22)
            v15.push(v8.IDVUpsellContainer, {
                extraProps = v22
            });
        end, {
            v15
        });
    end;
    return v2.createElement(l_WizardContainer_0, (v5.Dictionary.join(v13 or {}, {
        openUpsells = v20, 
        openAccountSettingsUpsell = v19
    })));
end;

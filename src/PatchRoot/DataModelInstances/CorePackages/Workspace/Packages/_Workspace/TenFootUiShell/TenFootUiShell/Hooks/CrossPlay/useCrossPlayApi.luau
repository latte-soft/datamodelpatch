local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_LinkingProtocol_0 = require(l_Parent_0.LinkingProtocol).LinkingProtocol;
local v6 = require(l_script_FirstAncestor_0.Hooks.useAppPolicy);
local l_GetUserSettingsPlatform_0 = require(l_script_FirstAncestor_0.Networking).thunks.GetUserSettingsPlatform;
local l_UpdateUserSettingsPlatform_0 = require(l_script_FirstAncestor_0.Networking).thunks.UpdateUserSettingsPlatform;
local v9 = require(l_script_FirstAncestor_0.Actions.CrossPlayFetchFailed);
local v10 = require(l_script_FirstAncestor_0.Actions.CrossPlaySettingsReset);
local v11 = require(l_script_FirstAncestor_0.Actions.CrossPlayUpdateFailed);
local v12 = require(l_script_FirstAncestor_0.Actions.CrossPlaySetValue);
local v13 = require(l_script_FirstAncestor_0.Actions.CrossPlaySetPrivileges);
local v14 = require(l_script_FirstAncestor_0.Actions.CrossPlayGetPrivilegesFailed);
local v15 = require(l_script_FirstAncestor_0.Actions.CrossPlayStubSystemPrivileges);
local v16 = require(l_script_FirstAncestor_0.Actions.CrossPlayResetPrivileges);
local v17 = require(script.Parent.getPlatformPrivilegeSettings);
local v18 = require(script.Parent.getFFlagCrossPlayRearrangement);
return function()
    local v20 = v6(function(v19)
        return v19.useLegacyCrossPlayApi();
    end);
    local v22 = v6(function(v21)
        return v21.useCrossPlaySystemUi();
    end);
    local v24 = v6(function(v23)
        return v23.getCrossPlayUri();
    end);
    local v26 = v6(function(v25)
        return v25.getCrossPlayCapabilities();
    end);
    local v28 = v6(function(v27)
        return v27.getCrossPlaySettingsKey();
    end);
    local v30 = v6(function(v29)
        return v29.getCrossPlayQueryParam();
    end);
    local v31 = l_useDispatch_0();
    local v33 = l_useSelector_0(function(v32)
        return v32.CrossPlaySettings.Status.isEnabled or false;
    end);
    local v34 = v2.useCallback(function()
        return v31(l_GetUserSettingsPlatform_0.API(v30, v28, v20));
    end, {
        v31, 
        v30, 
        v28, 
        v20
    });
    local v36 = v2.useCallback(function(v35)
        return v31(l_UpdateUserSettingsPlatform_0.API(v30, v28, v35, v20));
    end, {
        v31, 
        v30, 
        v28, 
        v20
    });
    local v44 = if not v18() then v2.useCallback(function()
        v31(v16());
        return v17(v26):andThen(function(v37)
            v31(v13(v37));
            if v37.CrossPlatform.CanJoinGame ~= v33 then
                return v36(v37.CrossPlatform.CanJoinGame):andThen(function()
                    v31(v12(v37.CrossPlatform.CanJoinGame));
                end):catch(function(v38)
                    v31(v11(v38));
                end);
            else
                return ;
            end;
        end):catch(function(v39)
            v31(v14(v39));
        end);
    end, {
        v31, 
        v26, 
        v36, 
        v33
    }) else v2.useCallback(function(v40)
        v31(v16());
        return v17(v26):andThen(function(v41)
            v31(v13(v41));
            if v41.CrossPlatform.CanJoinGame ~= v40 then
                return v36(v41.CrossPlatform.CanJoinGame):catch(function(v42)
                    v31(v11(v42));
                end);
            else
                return ;
            end;
        end):catch(function(v43)
            v31(v14(v43));
        end);
    end, {
        v31, 
        v26, 
        v36
    });
    local v50 = if not v18() then v2.useCallback(function()
        if not v22 then
            v17(v26):andThen(function(v45)
                v31(v15(v45));
            end);
            return v34():catch(function(v46)
                v31(v9(v46));
            end);
        else
            return v44();
        end;
    end, {
        v31, 
        v34, 
        v22
    }) else v2.useCallback(function()
        return v34():andThen(function(v47)
            if not v22 then
                v17(v26):andThen(function(v48)
                    v31(v15(v48));
                end);
                return ;
            else
                return v44(v47.responseBody[v28].isEnabled);
            end;
        end):catch(function(v49)
            v31(v9(v49));
        end);
    end, {
        v31, 
        v28, 
        v44, 
        v34, 
        v22
    });
    local v51 = v2.useCallback(function()
        if not (not v22 or not v24) then
            l_LinkingProtocol_0.default:openURL(v24);
        end;
    end, {
        v22, 
        v24
    });
    local v54 = v2.useCallback(function(v52)
        if not v22 then
            v31(v12(v52));
            return v36(v52):andThen(function()
                v50();
            end):catch(function(v53)
                v31(v11(v53));
            end);
        else
            v51();
            return ;
        end;
    end, {
        v31, 
        v36, 
        v50, 
        v51
    });
    local v55 = v2.useCallback(function()
        v31(v10());
    end, {
        v31
    });
    return (v2.useMemo(function()
        return {
            fetch = v50, 
            reset = v55, 
            update = v54, 
            invokeSystemUi = v51
        };
    end, {
        v50, 
        v55, 
        v54, 
        v51
    }));
end;

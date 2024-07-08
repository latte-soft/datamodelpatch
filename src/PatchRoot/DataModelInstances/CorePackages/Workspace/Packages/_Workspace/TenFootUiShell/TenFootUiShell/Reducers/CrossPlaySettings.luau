local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Rodux);
local l_CrossPlayCapabilities_0 = require(l_Parent_0.UniversalAppPolicy).Enum.CrossPlayCapabilities;
local l_GetUserSettingsPlatform_0 = require(l_script_FirstAncestor_0.Networking).thunks.GetUserSettingsPlatform;
local v6 = require(l_script_FirstAncestor_0.Networking);
local l_UpdateUserSettingsPlatform_0 = v6.thunks.UpdateUserSettingsPlatform;
local l_roduxNetworking_0 = v6.roduxNetworking;
local v9 = require(l_script_FirstAncestor_0.Actions.CrossPlayFetchFailed);
local v10 = require(l_script_FirstAncestor_0.Actions.CrossPlaySettingsReset);
local v11 = require(l_script_FirstAncestor_0.Actions.CrossPlayUpdateFailed);
local v12 = require(l_script_FirstAncestor_0.Actions.CrossPlaySetValue);
local v13 = require(l_script_FirstAncestor_0.Actions.CrossPlaySetPrivileges);
local v14 = require(l_script_FirstAncestor_0.Actions.CrossPlayGetPrivilegesFailed);
local v15 = require(l_script_FirstAncestor_0.Actions.CrossPlayResetPrivileges);
local l_PrivilegeCheckResults_0 = require(l_script_FirstAncestor_0.Hooks.CrossPlay.Constants).PrivilegeCheckResults;
local v17 = {
    Status = {}, 
    SystemPrivileges = {}, 
    LuaError = nil, 
    HttpError = nil, 
    SystemError = nil, 
    NetworkStatus = {}
};
local v39 = v3.createReducer(v17, {
    [l_GetUserSettingsPlatform_0.Succeeded.name] = function(v18, v19)
        return v2.Dictionary.join(v18, {
            Status = v2.Dictionary.join(v18.Status, v19.responseBody[v19.additionalData.crossPlaySettingsKey] or {}), 
            LuaError = nil, 
            HttpError = nil
        });
    end, 
    [l_GetUserSettingsPlatform_0.Failed.name] = function(v20, v21)
        return v2.Dictionary.join(v20, {
            Status = {}, 
            HttpError = v21.error, 
            LuaError = nil
        });
    end, 
    [l_UpdateUserSettingsPlatform_0.Succeeded.name] = function(v22, v23)
        return v2.Dictionary.join(v22, {
            Status = v2.Dictionary.join(v22.Status, {
                isEnabled = v23.additionalData.crossPlayValue
            }), 
            LuaError = nil, 
            HttpError = nil
        });
    end, 
    [l_UpdateUserSettingsPlatform_0.Failed.name] = function(v24, v25)
        return v2.Dictionary.join(v24, {
            HttpError = v25.error, 
            LuaError = nil
        });
    end, 
    [v13.name] = function(v26, v27)
        local v28 = v27.privileges[l_CrossPlayCapabilities_0.CrossPlatform] or {};
        return v2.Dictionary.join(v26, {
            Status = v2.Dictionary.join(v26.Status, {
                isSystemPrivilegeEnabled = (v28.Success and v28.CanJoinGame) and v28.PrivilegeCheckResult == l_PrivilegeCheckResults_0.NO_ISSUE
            }), 
            SystemPrivileges = v2.Dictionary.join(v26.SystemPrivileges, v27.privileges), 
            SystemError = nil
        });
    end, 
    [v14.name] = function(v29, v30)
        return v2.Dictionary.join(v29, {
            Status = v2.Dictionary.join(v29.Status, {
                isSystemPrivilegeEnabled = false
            }), 
            SystemPrivileges = {}, 
            SystemError = v30.error
        });
    end, 
    [v15.name] = function(v31)
        return v2.Dictionary.join(v31, {
            Status = v2.Dictionary.join(v31.Status, {
                isSystemPrivilegeEnabled = false
            }), 
            SystemPrivileges = {}, 
            SystemError = nil
        });
    end, 
    [v12.name] = function(v32, v33)
        local l_crossPlayValue_0 = v33.crossPlayValue;
        return v2.Dictionary.join(v32, {
            Status = v2.Dictionary.join(v32.Status, {
                isEnabled = l_crossPlayValue_0, 
                isSystemPrivilegeEnabled = l_crossPlayValue_0
            })
        });
    end, 
    [v9.name] = function(v35, v36)
        return v2.Dictionary.join(v35, {
            Status = {}, 
            LuaError = v36.error, 
            HttpError = nil
        });
    end, 
    [v11.name] = function(v37, v38)
        return v2.Dictionary.join(v37, {
            Status = {}, 
            LuaError = v38.error, 
            HttpError = nil
        });
    end, 
    [v10.name] = function()
        return v17;
    end
});
local v40 = v3.combineReducers({
    NetworkStatus = l_roduxNetworking_0.installReducer()
});
return function(v41, v42)
    local v43 = v39(v41, v42);
    return v2.Dictionary.join(v43, v40(v43, v42));
end;

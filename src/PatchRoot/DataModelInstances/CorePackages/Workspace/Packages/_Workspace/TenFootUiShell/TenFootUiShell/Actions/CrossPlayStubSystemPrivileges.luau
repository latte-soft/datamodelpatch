local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local l_CrossPlayCapabilities_0 = require(l_Parent_0.UniversalAppPolicy).Enum.CrossPlayCapabilities;
local v4 = require(l_script_FirstAncestor_0.Hooks.CrossPlay.Constants);
local v5 = require(script.Parent.CrossPlaySetPrivileges);
local l_PrivilegeCheckResults_0 = v4.PrivilegeCheckResults;
return function(v7)
    return v5((v2.Dictionary.join(v7 or {}, {
        [l_CrossPlayCapabilities_0.CrossPlatform] = {
            CanJoinGame = true, 
            PrivilegeCheckResult = l_PrivilegeCheckResults_0.NO_ISSUE, 
            Success = true
        }
    })));
end;

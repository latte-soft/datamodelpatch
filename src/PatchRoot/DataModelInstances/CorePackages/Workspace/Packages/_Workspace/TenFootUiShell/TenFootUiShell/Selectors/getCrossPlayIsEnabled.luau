local _ = require(script:FindFirstAncestor("TenFootUiShell").Reducers.CrossPlaySettings);
return function(v1)
    local l_CrossPlaySettings_0 = v1.CrossPlaySettings;
    return l_CrossPlaySettings_0.Status.isEnabled and l_CrossPlaySettings_0.Status.isSystemPrivilegeEnabled or false;
end;

local l_CrossPlayCapabilities_0 = require(script:FindFirstAncestor("TenFootUiShell").Parent.UniversalAppPolicy).Enum.CrossPlayCapabilities;
return {
    PrivilegeCodes = {
        [l_CrossPlayCapabilities_0.CrossPlatform] = 185, 
        [l_CrossPlayCapabilities_0.Multiplayer] = 254, 
        [l_CrossPlayCapabilities_0.SharedContent] = 247
    }, 
    PrivilegeCheckResults = {
        NO_ISSUE = "NoIssue", 
        BANNED = "Banned", 
        PURCHASE_REQUIRED = "PurchaseRequired", 
        ERROR = "Error"
    }
};

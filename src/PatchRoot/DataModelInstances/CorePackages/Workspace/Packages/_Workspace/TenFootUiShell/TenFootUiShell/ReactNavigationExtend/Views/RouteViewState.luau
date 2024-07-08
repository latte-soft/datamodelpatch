local l_Parent_0 = script:FindFirstAncestor("TenFootUiShell").Parent;
local _ = require(l_Parent_0.TenFootUiCommon);
local _ = require(l_Parent_0.Navigation);
return {
    ViewState = {
        Opening = "Opening", 
        Opened = "Opened", 
        Closing = "Closing"
    }
};

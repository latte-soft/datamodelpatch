local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Components.ModalBasedSelector);
local v3 = require(l_script_FirstAncestor_0.Components.MenuItems.ReportMenuItem);
return function(v4)
    return v1.createElement(v3, {
        label = v4.label, 
        layoutOrder = v4.layoutOrder, 
        rightComponent = v1.createElement(v2, v4), 
        menuContainerWidth = v4.menuContainerWidth
    });
end;

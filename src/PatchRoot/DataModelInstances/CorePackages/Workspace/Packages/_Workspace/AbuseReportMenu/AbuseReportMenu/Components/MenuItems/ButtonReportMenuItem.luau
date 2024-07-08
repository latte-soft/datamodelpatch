local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Components.MenuItems.ReportMenuItem);
return function(v3)
    return v1.createElement(v2, {
        label = v3.label, 
        layoutOrder = v3.layoutOrder, 
        rightComponent = v3.button, 
        menuContainerWidth = v3.menuContainerWidth
    });
end;

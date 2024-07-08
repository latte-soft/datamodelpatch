local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Components.ReportTextEntry);
local v3 = require(l_script_FirstAncestor_0.Components.MenuItems.ReportMenuItem);
local v4 = require(l_script_FirstAncestor_0.Flags.GetFFlagAbuseReportFullWidthCommentBox);
local v5 = require(l_script_FirstAncestor_0.Components.Constants);
return function(v6)
    return v1.createElement(v3, {
        label = "Abuse Description", 
        isRightComponentFullWidth = v4(), 
        layoutOrder = v6.layoutOrder, 
        rightComponent = v1.createElement(v2, {
            layoutOrder = v6.layoutOrder, 
            text = v6.comment, 
            onUpdate = v6.onUpdate
        }), 
        heightOverride = if not v4() then nil else v5.FreeCommentsMenuItemHeight, 
        menuContainerWidth = v6.menuContainerWidth
    });
end;

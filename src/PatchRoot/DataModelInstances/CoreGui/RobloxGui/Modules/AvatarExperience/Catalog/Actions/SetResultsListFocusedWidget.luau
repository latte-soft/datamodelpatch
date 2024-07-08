local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return require(l_CorePackages_0.Rodux).makeActionCreator(script.Name, function(v2, v3, v4, v5)
    v1.isTypeOrNil(v3, "string", "focusedWidgetId expects widget.id");
    v1.isTypeOrNil(v4, "string", "focusedWidgetTitle expects widget.template.title");
    v1.isTypeOrNil(v5, "string", "focusedWidgetDescription expects widget.template.description");
    return {
        searchUuid = v2, 
        id = v3, 
        title = v4, 
        description = v5
    };
end);

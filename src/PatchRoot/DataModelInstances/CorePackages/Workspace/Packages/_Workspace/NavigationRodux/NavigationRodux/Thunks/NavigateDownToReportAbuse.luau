local l_script_FirstAncestor_0 = script:FindFirstAncestor("NavigationRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local v3 = require(l_script_FirstAncestor_0.Thunks.NavigateDown);
local v4 = require(l_Parent_0.RobloxAppEnums);
local v5 = require(l_Parent_0.UrlBuilder);
local l_AppPage_0 = v4.AppPage;
local l_UrlBuilder_0 = v5.UrlBuilder;
return function(v8, v9, v10)
    v2.isInTypes(v8, {
        "string", 
        "number"
    }, "userId");
    v2.isInTypes(v9, {
        "string", 
        "number"
    }, "conversationId");
    v2.isTypeOrNil(v10, "function", "onClose");
    return v3({
        name = l_AppPage_0.ReportAbuse, 
        detail = l_UrlBuilder_0.user.report({
            userId = v8, 
            conversationId = v9
        }), 
        extraProps = {
            onClose = v10
        }
    });
end;

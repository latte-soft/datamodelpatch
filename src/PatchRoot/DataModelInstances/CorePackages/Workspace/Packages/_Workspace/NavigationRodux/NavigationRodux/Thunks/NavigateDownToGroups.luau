local l_script_FirstAncestor_0 = script:FindFirstAncestor("NavigationRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Thunks.NavigateDown);
local v3 = require(l_Parent_0.RobloxAppEnums);
local v4 = require(l_Parent_0.UrlBuilder);
local v5 = require(l_Parent_0.t);
local l_AppPage_0 = v3.AppPage;
local l_UrlBuilder_0 = v4.UrlBuilder;
return function(v8)
    assert(v5.callback(v8) or v5.none(v8), "");
    return v2({
        name = l_AppPage_0.GenericWebPage, 
        detail = l_UrlBuilder_0.static.groups(), 
        extraProps = {
            titleKey = "CommonUI.Features.Label.Groups", 
            onClose = v8
        }
    });
end;

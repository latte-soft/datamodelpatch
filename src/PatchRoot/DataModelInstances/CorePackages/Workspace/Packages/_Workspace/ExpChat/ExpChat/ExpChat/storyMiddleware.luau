local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.UIBlox);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_status_0, l_result_0 = pcall(function()
    v3.init((require(l_script_FirstAncestor_0:FindFirstChild("UIBloxConfig"))));
end);
if not l_status_0 then
    warn("Error initializing UIBlox", l_result_0);
end;
local l_AppStyleProvider_0 = v3.App.Style.AppStyleProvider;
local l_Constants_0 = v3.App.Style.Constants;
local l_Light_0 = l_Constants_0.ThemeName.Light;
local l_Dark_0 = l_Constants_0.ThemeName.Dark;
local l_Gotham_0 = l_Constants_0.FontName.Gotham;
local v12 = {
    Light = {
        themeName = l_Light_0, 
        fontName = l_Gotham_0
    }, 
    Dark = {
        themeName = l_Dark_0, 
        fontName = l_Gotham_0
    }
};
local v13 = {};
return function(v14)
    if not v13[v14] then
        v13[v14] = function(v15)
            return v2.createElement(l_AppStyleProvider_0, {
                style = v12[v15.theme or "Dark"]
            }, {
                Child = v2.createElement(v14, l_Dictionary_0.join(v15, v15.definition and v15.definition.props))
            });
        end;
    end;
    return v13[v14];
end;

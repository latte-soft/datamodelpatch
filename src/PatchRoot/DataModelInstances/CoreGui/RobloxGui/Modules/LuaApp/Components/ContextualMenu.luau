local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_LuaApp_0 = l_Modules_0.LuaApp;
local v4 = require(l_Modules_0.Common.Roact);
local v5 = require(l_Modules_0.Common.RoactRodux);
local v6 = require(l_LuaApp_0.Constants);
local v7 = require(l_LuaApp_0.Components.ContextualListMenu);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v9 = require(l_Modules_0.LuaApp.Components.ListPicker);
local v10 = v4.PureComponent:extend("ContextualMenu");
local l_DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH_0 = v6.DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH;
v10.render = function(v12)
    local l_callbackCancel_0 = v12.props.callbackCancel;
    local l_callbackSelect_0 = v12.props.callbackSelect;
    local v15 = v12.props.menuItems or {};
    local l_screenShape_0 = v12.props.screenShape;
    local l_formFactor_0 = v12.props.formFactor;
    local v18 = l_formFactor_0 == l_FormFactor_0.WIDE;
    for v19, v20 in ipairs(v15) do
        v15[v19].onSelect = function()
            l_callbackSelect_0(v20, v19);
        end;
        v15[v19].text = v20.displayName;
    end;
    return v4.createElement(v7, {
        callbackCancel = l_callbackCancel_0, 
        screenShape = l_screenShape_0
    }, {
        ListPicker = v4.createElement(v9, {
            layoutOrder = 2, 
            items = v15, 
            formFactor = l_formFactor_0, 
            width = not not v18 and l_DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH_0 or l_screenShape_0.parentWidth
        })
    });
end;
return (v5.connect(function(v21, _)
    return {
        formFactor = v21.FormFactor
    };
end)(v10));

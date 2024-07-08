local l_Parent_0 = script:FindFirstAncestor("Localization").Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(script.Parent.RobloxLocaleIdKey);
local v5 = require(script.Parent.LocalizationRoactContext);
local v6 = require(script.Parent.localizeStrings);
local v7 = v2.Component:extend("LocalizationConsumer");
v7.init = function(v8)
    local l_localization_0 = v8.props.localization;
    if l_localization_0 == nil then
        error("LocalizationConsumer must be below a LocalizationProvider.");
    end;
    v8.state = {
        locale = l_LocalizationService_0.RobloxLocaleId
    };
    v8.updateLocalization = function(v10)
        v10 = l_localization_0:GetLocale();
        if v10 ~= v8.state.locale then
            v8:setState({
                locale = v10
            });
        end;
    end;
    v8.connections = {
        l_localization_0.changed:connect(v8.updateLocalization)
    };
end;
v7.willUnmount = function(v11)
    for _, v13 in pairs(v11.connections) do
        v13:disconnect();
    end;
end;
v7.render = function(v14)
    local l_localization_1 = v14.props.localization;
    local l_render_0 = v14.props.render;
    local l_stringsToBeLocalized_0 = v14.props.stringsToBeLocalized;
    v3.isType(l_render_0, "function", "LocalizationConsumer.props.render");
    v3.isType(l_stringsToBeLocalized_0, "table", "LocalizationConsumer.props.stringsToBeLocalized");
    local v18 = v6(l_localization_1, l_stringsToBeLocalized_0);
    v18[v4] = v14.state.locale;
    return l_render_0(v18);
end;
return function(v19)
    return v2.createElement(v5.Consumer, {
        render = function(v20)
            return v2.createElement(v7, {
                localization = v20, 
                render = v19.render, 
                stringsToBeLocalized = v19.stringsToBeLocalized
            });
        end
    });
end;

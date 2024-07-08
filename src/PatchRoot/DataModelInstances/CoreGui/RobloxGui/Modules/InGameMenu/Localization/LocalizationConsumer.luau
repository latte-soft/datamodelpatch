local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.InGameMenuDependencies);
local l_t_0 = v3.t;
local l_Roact_0 = v3.Roact;
local v6 = require(script.Parent.Parent.Utility.ExternalEventConnection);
if not require(l_RobloxGui_0.Modules.Flags.GetFFlagSwitchInExpTranslationsPackage)() then
    local v7 = require(script.Parent.LocalizationRoactContext);
    local v8 = l_Roact_0.Component:extend("LocalizationConsumer");
    v8.init = function(v9)
        if v9.props.localization == nil then
            error("LocalizationConsumer must be below a LocalizationProvider.");
        end;
        v9.state = {
            locale = l_LocalizationService_0.RobloxLocaleId
        };
        v9.updateLocalization = function(v10)
            if v10 ~= v9.state.locale then
                v9:setState({
                    locale = v10
                });
            end;
        end;
    end;
    v8.render = function(v11)
        local l_localization_0 = v11.props.localization;
        local l_render_0 = v11.props.render;
        local l_stringsToBeLocalized_0 = v11.props.stringsToBeLocalized;
        assert(l_t_0.callback(l_render_0));
        assert(l_t_0.table(l_stringsToBeLocalized_0));
        local v15 = {};
        for v16, v17 in pairs(l_stringsToBeLocalized_0) do
            if typeof(v17) == "table" then
                if typeof(v17[1]) == "string" then
                    local l_status_0, l_result_0 = pcall(function()
                        return l_localization_0:Format(v17[1], v17);
                    end);
                    assert(l_status_0, string.format("LocalizationConsumer finding value for translation key[%s]: %s", v16, v17[1]));
                    v15[v16] = not not l_status_0 and l_result_0 or "";
                else
                    error(string.format("%s[1] in stringsToBeLocalized must be a string, got %s instead", v16, (typeof(v17[1]))));
                end;
            elseif typeof(v17) == "string" then
                local l_status_1, l_result_1 = pcall(function()
                    return l_localization_0:Format(v17);
                end);
                assert(l_status_1, string.format("LocalizationConsumer finding value for translation key[%s]: %s", v16, v17));
                v15[v16] = not not l_status_1 and l_result_1 or "";
            else
                error(string.format("%s in stringsToBeLocalized must be a string or table, got %s instead", v16, (typeof(v17))));
            end;
        end;
        return l_Roact_0.createElement(v6, {
            event = l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"), 
            callback = v11.updateLocalization
        }, {
            Component = l_render_0(v15)
        });
    end;
    return function(v22)
        return l_Roact_0.createElement(v7.Consumer, {
            render = function(v23)
                return l_Roact_0.createElement(v8, {
                    localization = v23, 
                    render = v22.render, 
                    stringsToBeLocalized = v22.stringsToBeLocalized
                });
            end
        });
    end;
else
    return require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationConsumer;
end;

local l_Parent_0 = script.Parent.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local _ = game:GetService("CorePackages");
local l_CorePackages_1 = game:GetService("CorePackages");
local v4 = require(l_CorePackages_1.PurchasePromptDeps);
local l_Roact_0 = v4.Roact;
local l_Rodux_0 = v4.Rodux;
local l_RoactRodux_0 = v4.RoactRodux;
local l_LocaleProvider_0 = require(l_CorePackages_1.IAPExperience).Locale.LocaleProvider;
local v9 = require(l_Parent_0.Components.Connection.LayoutValuesProvider);
local v10 = require(l_Parent_0.Components.Connection.LocalizationContextProvider);
local v11 = require(l_Parent_0.Localization.getLocalizationContext);
local v12 = require(l_Parent_0.Reducers.Reducer);
local v13 = require(l_Parent_0.Services.LayoutValues);
local v14 = require(l_CorePackages_1.Workspace.Packages.UnitTestHelpers);
local v15 = l_Roact_0.Component:extend("UnitTestContainer");
v15.init = function(v16)
    v16.layoutValues = v13.new(false).layout;
    v16.store = v16.props.overrideStore or l_Rodux_0.Store.new(v12, {});
    v16.localizationContext = v11(v16.props.overrideLocale or l_LocalizationService_0.RobloxLocaleId);
end;
v15.render = function(v17)
    local v18 = false;
    if v17.props[l_Roact_0.Children] ~= nil then
        v18 = #v17.props[l_Roact_0.Children] > 0;
    end;
    assert(v18, "UnitTestContainer: no children provided, nothing will be tested");
    return l_Roact_0.createElement(l_RoactRodux_0.StoreProvider, {
        store = v17.store
    }, {
        LocaleProvider = l_Roact_0.createElement(l_LocaleProvider_0, {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, {
            StyleProvider = v14.createStyleProvider({
                LocalizationContextProvider = l_Roact_0.createElement(v10, {
                    localizationContext = v17.localizationContext, 
                    render = function()
                        return l_Roact_0.createElement(v9, {
                            isTenFootInterface = false, 
                            render = function()
                                return l_Roact_0.createElement("ScreenGui", {
                                    AutoLocalize = false, 
                                    IgnoreGuiInset = true
                                }, v17.props[l_Roact_0.Children]);
                            end
                        });
                    end
                })
            })
        })
    });
end;
return v15;

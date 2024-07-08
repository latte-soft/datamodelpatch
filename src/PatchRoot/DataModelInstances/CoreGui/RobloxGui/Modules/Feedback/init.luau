local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Rodux);
local v5 = require(l_CorePackages_0.RoactRodux);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local v8 = require(script.GlobalConfig);
local v9 = require(script.Reducers);
local v10 = require(script.Components.FeedbackApp);
return {
    initialize = function()
        if v8.propValidation then
            v3.setGlobalConfig({
                propValidation = true
            });
        end;
        if v8.elementTracing then
            v3.setGlobalConfig({
                elementTracing = true
            });
        end;
        local v11 = {
            v4.thunkMiddleware
        };
        if v8.logStore then
            table.insert(v11, v4.loggerMiddleware);
        end;
        v3.mount(v3.createElement(v5.StoreProvider, {
            store = v4.Store.new(v9, nil, v11)
        }, {
            LocalizationProvider = v3.createElement(l_LocalizationProvider_0, {
                localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
            }, {
                Feedback = v3.createElement(v10)
            })
        }), l_CoreGui_0, "Feedback");
    end
};

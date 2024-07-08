local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GetFFlagIrisUseLocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIrisUseLocalizationProvider;
local v5 = require(script.Parent.Common.renderWithCoreScriptsStyleProvider);
local v6 = require(l_CorePackages_0.Packages.React);
local v7 = require(l_CorePackages_0.Packages.Rodux);
local v8 = require(l_CorePackages_0.Roact);
local v9 = require(l_CorePackages_0.RoactRodux);
local v10 = require(l_CorePackages_0.Workspace.Packages.CallProtocol);
local v11 = nil;
local v12 = nil;
if l_GetFFlagIrisUseLocalizationProvider_0() then
    v11 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
    v12 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
end;
local l_ApolloProvider_0 = require(l_CorePackages_0.Packages.ApolloClient).ApolloProvider;
local v14 = require(l_RobloxGui_0.Modules.ApolloClient);
local v15 = require(script.initCall);
local v16 = require(script.Reducer);
local v17 = require(script.Components.ContactListApp);
local v18 = require(script.Context);
local v19 = require(script.Analytics);
local v20 = {};
v20.__index = v20;
v20.new = function()
    local v21 = setmetatable({}, v20);
    local v22 = {
        fireAnalyticsEvent = v19.Analytics().fireAnalyticsEvent
    };
    v15(v10.CallProtocol.default);
    local function v24(v23)
        if not l_GetFFlagIrisUseLocalizationProvider_0() then
            return v23;
        else
            return v6.createElement(v12, {
                localization = v11.new(l_LocalizationService_0.RobloxLocaleId)
            }, {
                v23
            });
        end;
    end;
    v21.store = v7.Store.new(v16, nil, {
        v7.thunkMiddleware
    });
    v21.root = v6.createElement("ScreenGui", {
        AutoLocalize = false, 
        DisplayOrder = -1, 
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        Content = v6.createElement(v9.StoreProvider, {
            store = v21.store
        }, {
            ThemeProvider = v5({
                ApolloProvider = v6.createElement(l_ApolloProvider_0, {
                    client = v14
                }, {
                    ContextProvider = v8.createElement(v18.Provider, {
                        value = v22
                    }, {
                        ContactListApp = v24(v6.createElement(v17))
                    })
                })
            })
        })
    });
    v21.element = v8.mount(v21.root, l_CoreGui_0, "ContactList");
    return v21;
end;
return v20.new();

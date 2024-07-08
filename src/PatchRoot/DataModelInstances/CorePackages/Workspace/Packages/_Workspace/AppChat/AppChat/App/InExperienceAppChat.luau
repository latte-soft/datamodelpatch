local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_ApolloProvider_0 = require(l_Parent_0.ApolloClient).ApolloProvider;
local _ = require(l_CorePackages_0.Packages.ApolloClient);
local v8 = require(l_Parent_0.React);
local v9 = require(l_Parent_0.RoactRodux);
local v10 = require(l_Parent_0.Rodux);
local v11 = require(l_Parent_0.UIBlox);
local l_Constants_0 = v11.App.Style.Constants;
local l_AppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).AppFeaturePolicies;
local l_ChatPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SocialPolicies).ChatPolicies;
local l_RoactAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).RoactAppPolicy;
local v16 = require(l_script_FirstAncestor_0.Actions.SetAppLoaded);
local v17 = require(script.Parent.AppChatReducer);
local v18 = require(l_script_FirstAncestor_0.App.InExperienceAppChatContainer);
InExperienceAppChat = function(v19)
    local v20 = v10.Store.new(v17, nil, {
        v10.thunkMiddleware
    });
    local v21 = v8.createElement(v9.StoreProvider, {
        store = v20
    }, {
        v8.createElement(l_RoactAppPolicy_0.Provider, {
            policy = {
                l_AppFeaturePolicies_0, 
                l_ChatPolicies_0
            }
        }, v8.createElement(l_ApolloProvider_0, {
            client = v19.apolloClient
        }, {
            v8.createElement(l_LocalizationProvider_0, {
                localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
            }, {
                v8.createElement(v11.App.Style.AppStyleProvider, {
                    style = {
                        themeName = l_Constants_0.ThemeName.Dark, 
                        fontName = l_Constants_0.FontName.Gotham
                    }
                }, {
                    InExperienceAppChatContainer = v8.createElement(v18, {})
                })
            })
        }))
    });
    v20:dispatch(v16(true));
    return v21;
end;
return InExperienceAppChat;

local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_IXPService_0 = game:GetService("IXPService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.React);
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local v7 = require(l_script_FirstAncestor_0.Http.openWebview);
local v8 = require(l_Parent_0.RoactRodux);
local l_FetchingStatus_0 = require(l_Parent_0.Http).Reducers.FetchingStatus;
local l_RoactAnalytics_0 = require(l_Parent_0.RoactServiceTags).RoactAnalytics;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_Analytics_0 = require(l_Parent_0.Analytics).Analytics;
local l_requestInternalWrapper_0 = require(l_Parent_0.Http).NetworkLayers.requestInternalWrapper;
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local v15 = require(l_script_FirstAncestor_0.Components.VoicePhoneVerificationUpsellOverlayWrapper);
local l_ProviderContainer_0 = require(l_Parent_0.RoactUtils).Components.ProviderContainer;
local v17 = require(l_Parent_0.RoactAppExperiment);
local l_RoactAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).RoactAppPolicy;
local l_AppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).AppFeaturePolicies;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v22 = require(l_Parent_0.Rodux);
local l_CountryCodeList_0 = require(l_Parent_0.AuthCommon).Reducers.CountryCodeList;
local v24 = require(l_Parent_0.Cryo);
local l_ChallengeRequestWrapper_0 = require(l_Parent_0.GenericChallenges).Middleware.ChallengeRequestWrapper;
return function(v26)
    local v29 = v22.Store.new(v22.combineReducers({
        CountryCodeList = l_CountryCodeList_0, 
        FetchingStatus = l_FetchingStatus_0, 
        ScreenSize = function(_, _)
            return Vector2.new(400, 400);
        end
    }), nil, {
        v22.thunkMiddleware
    });
    local v30 = {};
    table.insert(v30, {
        class = l_StyleProviderWithDefaultTheme_0, 
        props = {
            withDarkTheme = true
        }
    });
    table.insert(v30, {
        class = v8.StoreProvider, 
        props = {
            store = v29
        }
    });
    table.insert(v30, {
        class = l_LocalizationProvider_0, 
        props = {
            localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
        }
    });
    table.insert(v30, {
        class = v17.Provider, 
        props = {
            value = l_IXPService_0
        }
    });
    table.insert(v30, {
        class = l_RoactAppPolicy_0.Provider, 
        props = {
            policy = {
                l_AppFeaturePolicies_0
            }
        }
    });
    table.insert(v30, {
        class = l_RoactServices_0.ServiceProvider, 
        props = {
            services = {
                [l_RoactAnalytics_0] = l_Analytics_0.new(), 
                [l_RoactNetworking_0] = l_ChallengeRequestWrapper_0(l_requestInternalWrapper_0(l_HttpService_0))
            }
        }
    });
    return v5.createElement(l_ProviderContainer_0, {
        providers = v30
    }, {
        PhoneUpsell = v5.createElement(v15, (v24.Dictionary.join(v26, {
            showWebpage = v7
        })))
    });
end;

local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialContextToasts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v6 = require(l_script_FirstAncestor_0.SocialContextToastDispatcher);
local v7 = require(l_script_FirstAncestor_0.ToastRoot);
local v8 = require(l_script_FirstAncestor_0.Enums.ToastTypes);
local v9 = require(l_script_FirstAncestor_0.ConfirmationModalRoot);
local v10 = require(l_Parent_0.ReactRoblox);
local v11 = require(l_Parent_0.React);
local v12 = require(l_Parent_0.Rodux);
local v13 = require(l_Parent_0.RoactRodux);
local v14 = require(l_Parent_0.Cryo);
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local l_GetFFlagSocialContextToastEventStream_0 = require(l_Parent_0.SharedFlags).GetFFlagSocialContextToastEventStream;
local function _(v17)
    return v11.createElement(l_StyleProviderWithDefaultTheme_0, {}, v17);
end;
return function(v19, v20, v21)
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "SocialContextToast";
    l_Folder_0.Parent = l_CoreGui_0;
    local v27 = v11.createElement(v13.StoreProvider, {
        store = v12.Store.new(v12.createReducer({}, {
            SetToastContent = function(v23, v24)
                return (v14.Dictionary.join(v23, {
                    ToastContent = v24.toastContent
                }));
            end, 
            SetConfirmationModal = function(v25, v26)
                return (v14.Dictionary.join(v25, {
                    ConfirmationModal = {
                        isOpen = v26.isConfirmationModalOpen, 
                        closeCallback = v26.closeCallback
                    }
                }));
            end
        }), {
            ToastContent = {
                toastType = v8.None
            }
        }, {
            v12.thunkMiddleware
        })
    }, {
        StyleProvider = v11.createElement(l_StyleProviderWithDefaultTheme_0, {}, {
            LocalizationProvider = v11.createElement(l_LocalizationProvider_0, {
                localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
            }, {
                SocialContextToastGUI = v11.createElement("ScreenGui", {
                    DisplayOrder = 7, 
                    ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
                }, {
                    ToastDispatcher = v11.createElement(v6, {
                        services = v19, 
                        gameId = v20, 
                        placeId = v21
                    }), 
                    ToastRoot = v11.createElement(v7, {
                        analyticsProps = if not l_GetFFlagSocialContextToastEventStream_0() then nil else {
                            eventIngest = v19.eventIngest, 
                            gameId = v20, 
                            placeId = v21
                        }
                    }), 
                    ConfirmationModalRoot = v11.createElement(v9)
                })
            })
        })
    });
    v10.createRoot(l_Folder_0):render(v27);
    return v27;
end;

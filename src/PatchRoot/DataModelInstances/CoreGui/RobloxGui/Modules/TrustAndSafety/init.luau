local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Rodux);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local _ = require(l_CorePackages_0.UIBlox);
local v8 = require(script.Dependencies);
local l_Localization_0 = v8.Localization;
local v10 = require(v8.LocalizationProvider);
local v11 = require(v8.playerInterface);
local v12 = require(script.Resources.Constants);
local v13 = require(script.GlobalConfig);
local v14 = require(script.Reducers);
local v15 = require(script.Components.TrustAndSafetyApp);
local v16 = require(script.TrustAndSafetyAppPolicy);
local _ = require(script.Actions.OpenReportDialog);
local _ = require(script.Actions.OpenReportMenu);
local v19 = require(script.Actions.BeginReportFlow);
local v20 = require(script.Actions.SetVoiceReportingFlow);
local v21 = require(script.Thunks.IdentifyAvatars);
local v22 = require(script.Utility.SessionUtility);
local v23 = require(script.Utility.ScreenshotHookManager);
local v24 = require(script.Thunks.FetchPlaceInfo);
local v25 = require(script.Flags.GetFFlagEnableNewVoiceReportFlows);
local v26 = require(script.Flags.GetFFlagReportAnythingScreenshot);
local v38 = {
    getInstance = function(v27)
        if not v27._initialized then
            v27:initialize();
            v27._initialized = true;
        end;
        return v27;
    end, 
    initialize = function(v28)
        if v13.propValidation then
            v3.setGlobalConfig({
                propValidation = true
            });
        end;
        if v13.elementTracing then
            v3.setGlobalConfig({
                elementTracing = true
            });
        end;
        v28.store = v28:createStore();
        v28.store:dispatch(v24(game.GameId));
        v28.localization = v28:createLocalization();
        v28.root = v3.createElement(v5.StoreProvider, {
            store = v28.store
        }, {
            PolicyProvider = v3.createElement(v16.Provider, {
                policy = {
                    v16.Mapper
                }
            }, {
                LocalizationProvider = v3.createElement(v10, {
                    localization = v28.localization
                }, {
                    TrustAndSafety = v3.createElement(v15)
                })
            })
        });
        v28.element = v3.mount(v28.root, l_CoreGui_0, "TrustAndSafety");
    end, 
    createStore = function(_)
        local l_v14_0 = v14;
        local v31 = {
            v4.thunkMiddleware
        };
        if v13.logStore then
            table.insert(v31, v4.loggerMiddleware);
        end;
        return v4.Store.new(l_v14_0, nil, v31);
    end, 
    createLocalization = function(_)
        local v33 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
        l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
            v33:SetLocale(l_LocalizationService_0.RobloxLocaleId);
        end);
        return v33;
    end, 
    openReportDialog = function(v34, v35, v36)
        v34.store:dispatch(v20(v25()));
        if v26() then
            v34.store:dispatch(v21());
        end;
        v34.store:dispatch(v19(v35, v36));
    end, 
    openReportMenu = function(v37)
        v37.store:dispatch(v20(v25()));
        if v26() then
            v37.store:dispatch(v21());
        end;
        v37.store:dispatch(v19());
    end
};
return {
    openReportDialogForPlayer = function(v39, v40)
        assert(v11(v39) and v6.instanceIsA("Player")(v39));
        v22.startAbuseReportSession(v40);
        v38:getInstance():openReportDialog(v12.ReportType.Player, v39);
    end, 
    openReportDialogForPlace = function(v41)
        v22.startAbuseReportSession(v41);
        v38:getInstance():openReportDialog(v12.ReportType.Place);
    end, 
    openReportMenu = function(v42)
        v22.startAbuseReportSession(v42);
        v38:getInstance():openReportMenu();
    end, 
    setPreReportScreenshotHook = function(v43)
        v23.setPreScreenshotHook(v43);
    end, 
    setPostReportScreenshotHook = function(v44)
        v23.setPostScreenshotHook(v44);
    end
};

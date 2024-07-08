local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_CaptureService_0 = game:GetService("CaptureService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_StarterGui_0 = game:GetService("StarterGui");
local v9 = require(l_Parent_1.AppCommonLib);
local v10 = require(l_Parent_1.Dash);
local l_Localization_0 = require(l_Parent_1.RobloxAppLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_1.Localization).LocalizationProvider;
local v13 = require(l_Parent_1.React);
local v14 = require(l_Parent_1.Roact);
local v15 = require(l_Parent_1.RoactRodux);
local v16 = require(l_Parent_1.Rodux);
local v17 = require(l_Parent_1.Style);
local l_Signal_0 = v9.Signal;
local l_StyleProviderWithDefaultTheme_0 = v17.StyleProviderWithDefaultTheme;
local v20 = game:DefineFastFlag("CapturesFixCoreGuiTypeHandling", false);
local v21 = require(l_Parent_0.Flags.FFlagCapturesFixPromptShareDuplicateToast);
local v22 = require(l_Parent_0.Flags.FFlagCapturesManagerGuacPolicy);
local v23 = require(l_Parent_0.Flags.FFlagCapturesRemoveOldMenuTheme);
local v24 = require(l_Parent_0.Flags.FFlagCaptureStorageBulkManagementEnabled);
local l_GetFFlagEnableScreenshotUtility_0 = require(l_Parent_1.SharedFlags).GetFFlagEnableScreenshotUtility;
local v26 = require(l_Parent_0.Analytics.AnalyticsService);
local v27 = require(l_Parent_0.Components.CaptureManagerScreen);
local v28 = require(l_Parent_0.Components.CaptureOverlay);
local v29 = require(l_Parent_0.Actions.CapturesCoreGuiDisabled);
local v30 = require(l_Parent_0.Actions.CapturesCoreGuiEnabled);
local v31 = require(l_Parent_0.Components.CaptureServicePrompts);
local v32 = require(l_Parent_0.Components.CarouselScreen);
local v33 = require(l_Parent_0.Constants);
local v34 = require(l_Parent_0.Utils.createShutterSound);
local v35 = require(l_Parent_0.Analytics.EventNames);
local v36 = require(l_Parent_0.Utils.getLocalUserId);
local v37 = require(l_Parent_0.Utils.getUserIdsFromString);
local v38 = require(l_Parent_0.installReducer);
local v39 = require(l_Parent_0.Actions.MenuClosed);
local v40 = require(l_Parent_0.Actions.MenuOpened);
local v41 = require(l_Parent_0.App.Networking);
local v42 = require(l_Parent_0.Utils.onViewportSizeChanged);
local v43 = require(l_Parent_0.Thunks.RetrieveCaptures);
local v44 = require(l_Parent_0.App.ScreenshotsPolicy);
local v45 = require(l_Parent_0.installReducer.ScreenSize);
local v46 = require(l_Parent_0.Actions.ScreenSizeChanged);
local v47 = require(l_Parent_0.installReducer.ServerType);
local v48 = require(l_Parent_0.Actions.ServerTypeDetected);
local v49 = require(l_Parent_0.Analytics.setupFireEvent);
local v50 = require(l_Parent_0.Actions.ShotsActivated);
local v51 = require(l_Parent_0.Context.ShotsContext);
local v52 = require(l_Parent_0.Components.ShotsCoreUI);
local v53 = require(l_Parent_0.Actions.ShotsDeactivated);
local v54 = require(l_Parent_0.Components.ShotsPage);
local v55 = require(l_Parent_0.Enums.ShotsToastType);
local v56 = require(l_Parent_0.Thunks.TakeCapture);
local v57 = require(l_Parent_0.Actions.ToastTriggered);
local v58 = require(l_Parent_0.Enums.TriggerSourceType);
local _ = require(l_Parent_0.Types);
return {
    createApp = function(v60)
        local v61 = {};
        local v62 = v10.join({
            AnalyticsService = v26, 
            AppStorageService = l_AppStorageService_0, 
            CaptureService = l_CaptureService_0, 
            LocalizationService = l_LocalizationService_0, 
            NotificationService = l_NotificationService_0, 
            Players = l_Players_0, 
            RobloxReplicatedStorage = l_RobloxReplicatedStorage_0, 
            StarterGui = l_StarterGui_0
        }, v60);
        local v63 = v49({
            analytics = v62.AnalyticsService, 
            infoForAllEvents = {
                isUnder13 = if not v62.Players.LocalPlayer then nil else v62.Players.LocalPlayer:GetUnder13(), 
                pid = tostring(game.PlaceId), 
                source = v33.AnalyticsSource, 
                uid = v36(v62.Players)
            }
        });
        v61._store = v16.Store.new(v16.combineReducers({
            [v33.RoduxKey] = v38(), 
            Games = v41.RoduxGames.installReducer(), 
            NetworkStatus = v41.RoduxNetworking.installReducer(), 
            ScreenSize = v45, 
            ServerType = v47, 
            ShareLinks = v41.RoduxShareLinks.installReducer()
        }), {}, {
            v16.thunkMiddleware
        });
        v61._store:dispatch(v43());
        local function v65()
            if v61._store:getState()[v33.RoduxKey].IsOverlayFlashActive then
                local v64 = tick();
                while v61._store:getState()[v33.RoduxKey].IsOverlayFlashActive and tick() - v64 <= 1 do
                    task.wait();
                end;
                return ;
            else
                return ;
            end;
        end;
        local v66 = if not game:GetEngineFeature("InternalCaptureSavedEnabled") then v62.CaptureService.CaptureSaved else v62.CaptureService.CaptureSavedInternal;
        if not v21 then
            v66:Connect(function(v67)
                v61._store:dispatch(v43());
                v65();
                local v68 = v44.PolicyImplementation.read();
                if not (not not v68 and v44.Mapper(v68).enableShareCaptureCTA()) then
                    v61._store:dispatch(v57(v55.ViewCapture));
                else
                    v61._store:dispatch(v57(v55.ShotsCaptureTaken, {
                        captureInfo = v67
                    }));
                end;
                v63(v35.CapturesShareToastViewed);
            end);
        else
            v66:Connect(function(v69, v70)
                v61._store:dispatch(v43());
                v65();
                local v71 = v44.PolicyImplementation.read();
                local v72 = not not v71 and v44.Mapper(v71).enableShareCaptureCTA();
                if v70 == v58.PromptedShare then
                    return ;
                else
                    if not v72 then
                        v61._store:dispatch(v57(v55.ViewCapture));
                    else
                        v61._store:dispatch(v57(v55.ShotsCaptureTaken, {
                            captureInfo = v69
                        }));
                    end;
                    v63(v35.CapturesShareToastViewed);
                    return ;
                end;
            end);
        end;
        v62.AppStorageService:WhenLoaded(function()
            local l_status_0, l_result_0 = pcall(function()
                return v62.AppStorageService:GetItem(v33.ScreenshotsActiveLocalStorageKey);
            end);
            if l_status_0 and l_result_0 ~= "" then
                if not v37(l_result_0)[v36(v62.Players) or ""] then
                    v61._store:dispatch(v53());
                else
                    v61._store:dispatch(v50());
                    return ;
                end;
            end;
        end);
        task.spawn(function()
            local l_status_1, l_result_1 = pcall(function()
                return v62.RobloxReplicatedStorage:WaitForChild("GetServerType", math.huge):InvokeServer();
            end);
            if l_status_1 then
                v61._store:dispatch(v48(l_result_1));
            end;
        end);
        v61.closeMenu = function()
            v61._store:dispatch(v39());
        end;
        v61.openMenu = function()
            v61._store:dispatch(v40());
        end;
        v61.takeCapture = function()
            if l_GetFFlagEnableScreenshotUtility_0() then
                v61._store:dispatch(v56());
            end;
        end;
        v61.createShutterSound = not l_GetFFlagEnableScreenshotUtility_0() and function()
        end or v34;
        if not v20 then
            if not v62.StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Captures) then
                v61._store:dispatch(v29());
            else
                v61._store:dispatch(v30());
            end;
        end;
        v62.StarterGui.CoreGuiChangedSignal:Connect(function(v77, v78)
            local v79;
            if not v20 then
                v79 = v77 == Enum.CoreGuiType.Captures;
            else
                v79 = true;
                if v77 ~= Enum.CoreGuiType.All then
                    v79 = v77 == Enum.CoreGuiType.Captures;
                end;
            end;
            if v79 then
                if not v78 then
                    v61._store:dispatch(v29());
                    return ;
                else
                    v61._store:dispatch(v30());
                    return ;
                end;
            else
                return ;
            end;
        end);
        if v20 then
            if not v62.StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Captures) then
                v61._store:dispatch(v29());
            else
                v61._store:dispatch(v30());
            end;
        end;
        v61.onIsActiveChanged = l_Signal_0.new();
        v61.getIsActive = function()
            return v61._store:getState()[v33.RoduxKey].IsActive or false;
        end;
        v61._store.changed:connect(function(v80, v81)
            local l_IsActive_0 = v81[v33.RoduxKey].IsActive;
            local l_IsActive_1 = v80[v33.RoduxKey].IsActive;
            if l_IsActive_1 ~= l_IsActive_0 then
                pcall(function()
                    local v84 = v37((v62.AppStorageService:GetItem(v33.ScreenshotsActiveLocalStorageKey)));
                    local v85 = v36(v62.Players) or "";
                    if not l_IsActive_1 then
                        v84[v85] = nil;
                    else
                        v84[v85] = true;
                    end;
                    v62.AppStorageService:SetItem(v33.ScreenshotsActiveLocalStorageKey, (table.concat(v10.keys(v84), ",")));
                    v62.AppStorageService:Flush();
                end);
                v61.onIsActiveChanged:fire(l_IsActive_1);
            end;
        end);
        v42(function(v86)
            v61._store:dispatch(v46(v86));
        end);
        local function v90(v87, v88, v89)
            return v14.mount(v13.createElement(v15.StoreProvider, {
                store = v61._store
            }, {
                PolicyProvider = v14.createElement(v44.Provider, {
                    policy = {
                        v44.Mapper
                    }
                }, {
                    StyleProvider = v13.createElement(l_StyleProviderWithDefaultTheme_0, {
                        withDarkTheme = true
                    }, {
                        LocalizationProvider = v14.createElement(l_LocalizationProvider_0, {
                            localization = l_Localization_0.new(v62.LocalizationService.RobloxLocaleId)
                        }, {
                            ContextProvider = v14.createElement(v51.Provider, {
                                value = v88
                            }, {
                                Portal = v14.createElement(v14.Portal, {
                                    target = v87
                                }, v89)
                            })
                        })
                    })
                })
            }));
        end;
        local v91 = v44.PolicyImplementation.read();
        local v92 = not not v91 and v44.Mapper(v91).eligibleForCapturesFeature();
        local v93 = not not v91 and v44.Mapper(v91).enableCapturesBulkManagement();
        local v94 = {
            fireAnalyticsEvent = v63
        };
        v61.mountCaptureManager = function(v95, v96)
            if v24 then
                if not v22 or v93 then
                    if v92 then
                        v61._captureManagerHandle = v90(v95, {
                            fireAnalyticsEvent = v63, 
                            themeOverrides = if v23 then nil else v96
                        }, {
                            CaptureManager = v13.createElement(v27)
                        });
                        return ;
                    else
                        return ;
                    end;
                else
                    return ;
                end;
            else
                return ;
            end;
        end;
        v61.mountCaptureOverlay = function(v97)
            if v92 then
                v61._captureOverlayHandle = v90(v97, v94, {
                    CaptureOverlay = v13.createElement(v28)
                });
                return ;
            else
                return ;
            end;
        end;
        v61.mountCarousel = function(v98)
            if v92 then
                v61._carouselHandle = v90(v98, v94, {
                    CarouselScreen = v13.createElement(v32)
                });
                return ;
            else
                return ;
            end;
        end;
        v61.mountCoreUI = function(v99, v100)
            if v92 then
                local l_v94_0 = v94;
                if l_GetFFlagEnableScreenshotUtility_0() then
                    l_v94_0 = {
                        fireAnalyticsEvent = v63, 
                        chromeEnabled = v100
                    };
                end;
                v61._coreUiHandle = v90(v99, l_v94_0, {
                    CaptureServicePrompts = v13.createElement(v31), 
                    ShotsCoreUI = v13.createElement(v52)
                });
                return ;
            else
                return ;
            end;
        end;
        v61.mountMenuPage = function(v102, v103, v104, v105)
            if v92 then
                v61._menuPageHandle = v90(v102, {
                    fireAnalyticsEvent = v63, 
                    themeOverrides = if v23 then nil else v104, 
                    chromeEnabled = if not l_GetFFlagEnableScreenshotUtility_0() then nil else v105
                }, {
                    ShotsPage = v13.createElement(v54, {
                        closeSettingsMenu = v103
                    })
                });
                return ;
            else
                return ;
            end;
        end;
        return v61;
    end
};

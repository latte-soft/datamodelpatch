local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(script.Parent.User);
local v6 = require(l_Modules_0.LuaApp.Thunks.GetLocalUser);
local l_SetLaunchContext_0 = require(l_CorePackages_0.Workspace.Packages.AppStartup).Actions.SetLaunchContext;
local v8 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v9 = require(l_Modules_0.LuaApp.Thunks.NavigateSideways);
local v10 = require(l_Modules_0.LuaApp.Thunks.FetchLocale);
local v11 = require(l_Modules_0.LuaApp.Thunks.PreloadApplicationData);
local v12 = require(script.Parent.AppStorageUtilities);
local v13 = require(l_Modules_0.LuaApp.AppPage);
local v14 = require(l_Modules_0.LuaApp.FlagSettings);
local v15 = require(l_Modules_0.LuaApp.Enum.LaunchContext);
local v16 = require(script.Parent.WebLogin);
local v17 = require(l_Modules_0.LuaApp.Enum.WebLaunchOption);
local v18 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local v20 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v21 = require(l_Modules_0.LuaApp.Thunks.Authentication.HandleAccountInfo);
local v22 = require(l_Modules_0.LuaApp.Thunks.Authentication.ResetOnNoAccountInfoFound);
local v23 = require(l_Modules_0.LuaApp.Constants);
local l_ReceivedUserCountryCode_0 = require(l_CorePackages_0.Workspace.Packages.CountryCode).ReceivedUserCountryCode;
local v25 = require(l_Modules_0.LuaApp.Flags.GetFFlagRefactorAuthPageForTenFoot);
local l_GetFFlagEnableMaquettesHomePageAgeBlock_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableMaquettesHomePageAgeBlock;
local l_FFlagUnifyNavigationGraph_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifyNavigationGraph;
local v28 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local v29 = require(l_Modules_0.LuaApp.Flags.GetFFlagPasskeySignupEnabled);
local v30 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment);
local function v48(v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42)
    v35:setToLocalPlayer();
    local v43 = not game:GetEngineFeature("SignupActionRequiredKeyAvailable") and "" or v12.getSignupActionRequired();
    local v44 = v12.getAuthenticatedTheme();
    local v45 = false;
    if v43 == "auth" then
        v45 = v29() or v30();
    end;
    if not (not (v44 ~= "") or v45) then
        l_MemStorageService_0:Fire(v18.ThemeUpdate, v44);
    end;
    v20.initializeUserLayers(v35.userId);
    spawn(function()
        v37:dispatch(v6());
        v37:dispatch(l_ReceivedUserCountryCode_0(v35.countryCode));
        if (not v25() or not l_GuiService_0:IsTenFootInterface()) or l_FFlagUnifyNavigationGraph_0 then
            if not v40 or not v35.isUnder13 then
                if v43 == "auth" then
                    if not v29() and not v30() then
                        v12.setSignupActionRequired("");
                        v12.flush();
                        v37:dispatch(v8({
                            {
                                name = v36
                            }
                        }));
                    else
                        v37:dispatch(v8({
                            {
                                name = v13.AddAuthMethodPage
                            }
                        }));
                    end;
                else
                    v37:dispatch(v8({
                        {
                            name = v36
                        }
                    }));
                end;
            else
                v37:dispatch(v8({
                    {
                        name = v13.U13Block
                    }
                }));
            end;
        else
            v37:dispatch(v9({
                name = v36
            }));
        end;
        local function v46()
            return v37:dispatch(v11(v31, v32, v33, v34, v39, v41, v42));
        end;
        local _ = v37:dispatch(v11(v31, v32, v33, v34, v39, v41, v42));
        v21(v31, v35, v38, true, v37, v36, v46, v39, v40, true);
    end);
end;
local function v62(v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61)
    if not v14.LuaAppLoginUIEnabled() or not v53 then
        if not v14.LuaAppLoginUIEnabled() then
            v21(v49, v54, v55, false, v56, v57, function()
                return v56:dispatch(v11(v49, v50, v51, v52, v58, v60, v61));
            end, v58, v59, false);
            return ;
        else
            v22(false, v56, v49, v55);
            return ;
        end;
    else
        v21(v49, v54, v55, false, v56, v57, function()
            return v56:dispatch(v11(v49, v50, v51, v52, v58, v60, v61));
        end, v58, v59, false);
        return ;
    end;
end;
return function(v63, v64, v65, v66, v67, v68, v69, v70)
    return function(v71)
        local v72 = v10(v63);
        local v73 = v5.fromLocalStorage();
        local v74 = not l_GetFFlagEnableMaquettesHomePageAgeBlock_0() and v66.getEnforceAgeRestrictedLogin();
        local l_Home_0 = v13.Home;
        v71:dispatch(l_SetLaunchContext_0(v67));
        if v16.getWebLogin() ~= v17.NotFromWeb then
            l_Logger_0:info(string.format("[%f] LaunchApp::handleNoCachedUser(), WebLogin", tick()));
            v5.clearLocalStorage();
            v12.flush();
            v73 = v5.fromLocalStorage();
            local v76 = true;
            if v16.getWebLogin() ~= v17.FromWebBanner then
                v76 = true;
                if v16.getWebLogin() ~= v17.FromWebPlayGame then
                    v76 = v16.getWebLogin() == v17.FromCommandLine;
                end;
            end;
            v62(v63, v64, v65, v66, v76, v73, v72, v71, l_Home_0, v68, v74, v69, v70);
            return ;
        elseif v73.userId ~= -1 then
            l_Logger_0:info(string.format("[%f] LaunchApp::initializeForCachedUser()", tick()));
            v48(v63, v64, v65, v66, v73, l_Home_0, v71, v72, v68, v74, v69, v70);
            return ;
        else
            l_Logger_0:info(string.format("[%f] LaunchApp::handleNoCachedUser()", tick()));
            local v77 = v67 ~= v15.Startup;
            local _ = nil;
            if v28 and v12.getAccountSwitchStatus() == v23.Auth.AccountSwitcherSwitchedStatus then
                v77 = true;
                v12.setAccountSwitchStatus("");
                v12.setAccountSwitchTargetUsername("");
            end;
            v62(v63, v64, v65, v66, v77, v73, v72, v71, l_Home_0, v68, v74, v69, v70);
            return ;
        end;
    end;
end;

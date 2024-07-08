local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Constants);
local v3 = require(l_Modules_0.LuaApp.Promise);
local v4 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v5 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamesData);
local v6 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchSortTokens);
local v7 = require(l_Modules_0.LuaApp.Thunks.Omni.ApiFetchOmniRecommendations);
local v8 = require(l_Modules_0.LuaApp.Actions.SetHomePageDataStatus);
local v9 = require(l_Modules_0.LuaApp.Actions.SetFetchHomePageDataStatusAll);
local v10 = require(l_Modules_0.LuaApp.Thunks.LegacyUpdateUsers);
local v11 = require(l_Modules_0.LuaApp.Thunks.FetchAdditionalFriendsInfo);
local v12 = require(l_Modules_0.LuaApp.Thunks.FetchHomePageContactMethodModuleVariation);
local l_FetchFriendsCarousel_0 = require(l_Modules_0.LuaApp.Components.FriendsCarousel.api).FetchFriendsCarousel;
local v14 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger:new(script.Name);
local l_callOnce_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).callOnce;
local l_AvatarThumbnailRequests_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.AvatarThumbnailRequests;
local v17 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v18 = require(l_Modules_0.LuaApp.Flags.GetIxpPerfRegressionTestSeconds);
local l_PreloadUsersThumbnail_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Thunks.PreloadUsersThumbnail;
local v20 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableHomePageUpsellCard);
local v21 = game:DefineFastFlag("LuaAppFetchHomeDataHandleFailure", false);
local l_FVariable_0 = settings():GetFVariable("LuaAppsDiagPageLoadTimeHome");
local function v50(v23, v24, v25, v26, v27, v28, v29, v30, v31)
    if v27:getState().Startup.HomePageDataStatus == v4.Fetching then
        return v3.resolve("home page data is already fetching");
    else
        if v29 then
            v29:logEvent("fetch_homepage_data_begin");
        end;
        local v32 = tick();
        v27:dispatch(v8(v4.Fetching));
        v27:dispatch(v9(v4.Fetching));
        if v20() then
            v27:dispatch(v12(v23));
        end;
        local v34 = not not v28 and function()
            local v33 = nil;
            if v30 then
                v33 = v30:popPendingPrefetchGuid();
            end;
            return v27:dispatch(v7(v23, v24, v2.OmniRecommendationsPageType.PAGE_TYPE_HOME, nil, v33, v31));
        end or function()
            return v27:dispatch(v6(v23, v2.GameSortGroups.HomeGames, nil));
        end;
        local function _()
            return v27:dispatch(l_FetchFriendsCarousel_0()):andThen(function(v35)
                v27:dispatch(v10(v35));
                v27:dispatch(v11(v23, v35));
                return v35;
            end);
        end;
        local function _()
            local v37, v38 = v18();
            if v37 then
                l_callOnce_0(v17.PerfRegressionTestTTI, function()
                    if v38 ~= 0 then
                        task.wait(v38);
                    end;
                end);
                return ;
            else
                return ;
            end;
        end;
        v27:dispatch(l_FetchFriendsCarousel_0()):andThen(function(v40)
            v27:dispatch(v10(v40));
            v27:dispatch(v11(v23, v40));
            return v40;
        end):catch(function(v41)
            v14:error((("Error fetching friends sort: %*"):format(v41)));
        end);
        v27:dispatch(l_PreloadUsersThumbnail_0({
            v26
        }, l_AvatarThumbnailRequests_0.HOME_HEADER_USER));
        v27:dispatch(l_PreloadUsersThumbnail_0({
            v26
        }, l_AvatarThumbnailRequests_0.CUSTOMIZE_BUTTON));
        if not v28 then
            return v34():andThen(function(_)
                v27:dispatch(v8(v4.Done));
                return v3.all({
                    v27:dispatch(v5(v23, v2.GameSortGroups.HomeGames))
                });
            end, if not v21 then nil else function(v43)
                v27:dispatch(v8(v4.Failed));
                return v3.reject(v43);
            end):andThen(function(_)
                v27:dispatch(v9(not not (v27:getState().Startup.HomePageDataStatus == v4.Failed) and v4.Failed or v4.Done));
                v25.Diag:reportStats(l_FVariable_0, (tick() - v32) * 1000);
                if v29 then
                    v29:logEvent("fetch_homepage_data_end");
                end;
            end, function(_)
                v27:dispatch(v9(v4.Failed));
                if v29 then
                    v29:logEvent("fetch_homepage_data_error");
                end;
            end);
        else
            return v34():andThen(function(_)
                local v47, v48 = v18();
                if v47 then
                    l_callOnce_0(v17.PerfRegressionTestTTI, function()
                        if v48 ~= 0 then
                            task.wait(v48);
                        end;
                    end);
                end;
                v27:dispatch(v8(v4.Done));
                v27:dispatch(v9(v4.Done));
                v25.Diag:reportStats(l_FVariable_0, (tick() - v32) * 1000);
                if v29 then
                    v29:logEvent("fetch_homepage_data_end");
                end;
            end, function(_)
                if v21 then
                    v27:dispatch(v8(v4.Failed));
                end;
                v27:dispatch(v9(v4.Failed));
                if v29 then
                    v29:logEvent("fetch_homepage_data_error");
                end;
            end);
        end;
    end;
end;
return function(v51, v52, v53, v54, v55, v56, v57, v58)
    return function(v59)
        return v50(v51, v52, v53, v54, v59, v55, v56, v57, v58);
    end;
end;

local l_HttpService_0 = game:GetService("HttpService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.Shell.Utility);
local v4 = require(l_Modules_0.LuaApp.Http.Url);
local v5 = {};
local v6 = string.gsub(string.gsub(game:GetService("ContentProvider").BaseUrl:lower(), "/m.", "/www."), "http://", "https://");
local v7 = string.gsub(v6, "https://www.", "https://assetgame.");
local _ = string.gsub(v6, "https://www.", "https://accountsettings.");
v5.BaseUrl = v6;
v5.AssetGameBaseUrl = v7;
local v9 = require(l_Modules_0.Shell.Flags.GetFStringAppLocationForAppPresence);
local function v13(v10)
    if not (v10 ~= nil) or #v10 == 0 then
        return nil;
    else
        local l_status_0, l_result_0 = pcall(function()
            return l_HttpService_0:JSONDecode(v10);
        end);
        if l_status_0 then
            return l_result_0;
        else
            v3.DebugLog("decodeJSON() failed because", l_result_0, "Input:", v10);
            return nil;
        end;
    end;
end;
local function v18(v14, v15)
    local l_status_1, l_result_1 = pcall(function()
        return game:HttpGetAsync(v14);
    end);
    if l_status_1 then
        if not v15 then
            return (v13(l_result_1));
        else
            return l_result_1;
        end;
    else
        v3.DebugLog(v14, "rbxGetAsync() failed because", l_result_1);
        return nil;
    end;
end;
local function _(v19, v20, v21)
    local l_status_2, l_result_2 = pcall(function()
        return game:HttpPostAsync(v19, v20, v21);
    end);
    if l_status_2 then
        return (v13(l_result_2));
    else
        v3.DebugLog(v19, "rbxPostAsync() failed because", l_result_2);
        return nil;
    end;
end;
local function _(v25)
    local l_status_3, l_result_3 = pcall(function()
        return l_HttpRbxApiService_0:GetAsync(v25);
    end);
    if l_status_3 then
        return (v13(l_result_3));
    else
        v3.DebugLog(v25, "rbxApiGetAsync() failed because", l_result_3);
        return nil;
    end;
end;
local function _(v29, v30, v31, v32)
    local l_status_4, l_result_4 = pcall(function()
        return l_HttpRbxApiService_0:PostAsync(v29, v30, v31, v32);
    end);
    if l_status_4 then
        return (v13(l_result_4));
    else
        v3.DebugLog(v29 .. v30, "rbxApiPostAsync() failed because", l_result_4);
        return nil;
    end;
end;
local function _(v36, v37, v38, v39)
    local l_status_5, l_result_5 = pcall(function()
        return l_HttpRbxApiService_0:PostAsyncFullUrl(v36, v37, v38, v39);
    end);
    if l_status_5 then
        return (v13(l_result_5));
    else
        v3.DebugLog(v36 .. v37, "rbxApiPostAsyncFullUrl() failed because", l_result_5);
        return nil;
    end;
end;
local function _(v43)
    local v44 = nil;
    local v45 = v3.Signal();
    l_HttpService_0:RequestInternal(v43):Start(function(v46, v47)
        if v46 then
            if v47.StatusCode == 401 then
                v3.DebugLog(v43.Url, "rbxRequestInternal() failed: 401 Unauthorized");
            elseif not (v47.StatusCode >= 200) or v47.StatusCode >= 400 then
                v3.DebugLog(v43.Url, "rbxRequestInternal() failed:", v47.StatusCode);
            else
                v44 = v13(v47.Body);
            end;
        else
            v3.DebugLog(v43.Url, "rbxRequestInternal() failed: connection error");
        end;
        v45:fire();
    end);
    v45:wait();
    return v44;
end;
local function v50(v49)
    return string.gsub(v6, "https://www.", "https://" .. v49 .. ".");
end;
local function _(v51)
    local v52 = true;
    if v51 ~= nil then
        v52 = #v51 == 0;
    end;
    return v52;
end;
v5.GetGameSortsAsync2 = function()
    return (v18((string.format("%sv1/games/sorts?model.gameSortsContext=GamesAllSorts", v50("games")))));
end;
v5.GetCuratedSortAsync = function(v54, v55)
    return (v18((string.format("%sgames/set?GameSetTargetId=%d&MaxRows=%d", v6, v54, v55))));
end;
v5.GetCuratedSortByUrlAsync = function(v56)
    return (v18(v56));
end;
v5.GetUserPlacesAsync = function(v57, v58, v59)
    return (v18((string.format("%sgames/list-users-games-json?userid=%d&startIndex=%d&pageSize=%d", v6, v59, v57, v58))));
end;
v5.SearchGamesAsync = function(v60, v61, v62)
    return (v18((string.format("%sgames/list-json?keyword=%s&StartRows=%d&MaxRows=%d&filterByDeviceType=true", v6, l_HttpService_0:UrlEncode(v62), v60, v61))));
end;
v5.SearchGamesAsync2 = function(v63, v64, v65)
    return (v18((string.format("%sv1/games/list?model.keyword=%s&model.startRows=%d&model.maxRows=%d", string.gsub(v6, "https://www.", "https://" .. "games" .. "."), l_HttpService_0:UrlEncode(v65), v63, v64))));
end;
v5.GetSortAsync2 = function(v66, v67, v68, v69)
    local v70 = string.format("%sv1/games/list?model.sortToken=%s&model.startRows=%d&model.maxRows=%d", string.gsub(v6, "https://www.", "https://" .. "games" .. "."), l_HttpService_0:UrlEncode(v68), v66, v67);
    if v69 then
        v70 = string.format("%s&model.timeFilter=%s", v70, v69);
    end;
    return (v18(v70));
end;
v5.GetGameDetailsAsync = function(v71)
    return (v18(v6 .. "places/api-get-details?assetId=" .. tostring(v71)));
end;
v5.GetGamesAsync = function(v72)
    return (v18(string.gsub(v6, "https://www.", "https://" .. "games" .. ".") .. "v1/games?universeIds=" .. table.concat(v72, ",")));
end;
v5.PostExperienceGuidelines = function(v73)
    local v74 = {
        Url = string.format("%sexperience-guidelines-api/experience-guidelines/get-age-recommendation", v50("apis")), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            universeId = v73
        }), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    local v75 = nil;
    local v76 = v3.Signal();
    l_HttpService_0:RequestInternal(v74):Start(function(v77, v78)
        if v77 then
            if v78.StatusCode == 401 then
                v3.DebugLog(v74.Url, "rbxRequestInternal() failed: 401 Unauthorized");
            elseif not (v78.StatusCode >= 200) or v78.StatusCode >= 400 then
                v3.DebugLog(v74.Url, "rbxRequestInternal() failed:", v78.StatusCode);
            else
                v75 = v13(v78.Body);
            end;
        else
            v3.DebugLog(v74.Url, "rbxRequestInternal() failed: connection error");
        end;
        v76:fire();
    end);
    v76:wait();
    return v75;
end;
v5.GetGameIconIdAsync = function(v79)
    return (v18(v6 .. "places/icons/json?placeId=" .. tostring(v79)));
end;
v5.GetGameVotesAsync = function(v80)
    return (v18(v6 .. "PlaceItem/GameDetailsVotingPanelJson?placeId=" .. tostring(v80)));
end;
v5.GetRecommendedGamesAsync = function(v81)
    return (v18(v6 .. "Games/GetRecommendedGamesJson?currentPlaceId=" .. tostring(v81)));
end;
v5.GetGameThumbnailsAsync = function(v82)
    return (v18(v6 .. "thumbnail/place-thumbnails?placeId=" .. tostring(v82)));
end;
v5.GetBadgesForUniverseAsync = function(v83, v84)
    local v85 = string.format("%sv1/universes/%d/badges?sortOrder=Asc&limit=100", string.gsub(v6, "https://www.", "https://" .. "badges" .. "."), v83);
    if v84 then
        v85 = string.format(v85 .. "&cursor=%s", v84);
    end;
    return (v18(v85));
end;
v5.GetUserAwardedBadgesAsync = function(v86, v87)
    return (v18((string.format("%sv1/users/%d/badges/awarded-dates?badgeIds=%s", string.gsub(v6, "https://www.", "https://" .. "badges" .. "."), v86, (table.concat(v87, ","))))));
end;
v5.PostFavoriteToggleAsync = function(v88)
    local v89 = v6 .. "favorite/toggle?assetID=" .. tostring(v88);
    local l_pcall_0 = pcall;
    local v91 = "favoriteToggle";
    local v92 = nil;
    local v93;
    l_pcall_0, v93 = l_pcall_0(function()
        return game:HttpPostAsync(v89, v91, v92);
    end);
    if l_pcall_0 then
        return (v13(v93));
    else
        v3.DebugLog(v89, "rbxPostAsync() failed because", v93);
        return nil;
    end;
end;
v5.PostGameVoteAsync = function(v94, v95)
    local v96 = v6 .. "voting/vote?assetId=" .. tostring(v94) .. "&vote=" .. tostring(v95);
    local l_pcall_1 = pcall;
    local v98 = "vote";
    local v99 = nil;
    local v100;
    l_pcall_1, v100 = l_pcall_1(function()
        return game:HttpPostAsync(v96, v98, v99);
    end);
    if l_pcall_1 then
        return (v13(v100));
    else
        v3.DebugLog(v96, "rbxPostAsync() failed because", v100);
        return nil;
    end;
end;
v5.RegisterAppPresence = function()
    local v101 = string.format("%s/v1/presence/register-app-presence", v50("presence"));
    local v102 = l_HttpService_0:JSONEncode({
        location = v9()
    });
    local l_pcall_2 = pcall;
    local v104 = nil;
    local v105;
    l_pcall_2, v105 = l_pcall_2(function()
        return game:HttpPostAsync(v101, v102, v104);
    end);
    if l_pcall_2 then
        return (v13(v105));
    else
        v3.DebugLog(v101, "rbxPostAsync() failed because", v105);
        return nil;
    end;
end;
v5.GetCrossplayEnabledStatusAsync = function()
    local v106 = {
        Url = string.format("%suser-settings-api/v1/user-settings?requestedUserSettings=xboxCrossPlayStatusIsEnabled", v50("apis")), 
        Method = "GET"
    };
    local v107 = nil;
    local v108 = v3.Signal();
    l_HttpService_0:RequestInternal(v106):Start(function(v109, v110)
        if v109 then
            if v110.StatusCode == 401 then
                v3.DebugLog(v106.Url, "rbxRequestInternal() failed: 401 Unauthorized");
            elseif not (v110.StatusCode >= 200) or v110.StatusCode >= 400 then
                v3.DebugLog(v106.Url, "rbxRequestInternal() failed:", v110.StatusCode);
            else
                v107 = v13(v110.Body);
            end;
        else
            v3.DebugLog(v106.Url, "rbxRequestInternal() failed: connection error");
        end;
        v108:fire();
    end);
    v108:wait();
    return v107;
end;
v5.PostCrossplayStatusAsync = function(v111)
    local v112 = {
        Url = string.format("%suser-settings-api/v1/user-settings", v50("apis")), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            xboxCrossPlayStatusIsEnabled = v111
        }), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    local v113 = nil;
    local v114 = v3.Signal();
    l_HttpService_0:RequestInternal(v112):Start(function(v115, v116)
        if v115 then
            if v116.StatusCode == 401 then
                v3.DebugLog(v112.Url, "rbxRequestInternal() failed: 401 Unauthorized");
            elseif not (v116.StatusCode >= 200) or v116.StatusCode >= 400 then
                v3.DebugLog(v112.Url, "rbxRequestInternal() failed:", v116.StatusCode);
            else
                v113 = v13(v116.Body);
            end;
        else
            v3.DebugLog(v112.Url, "rbxRequestInternal() failed: connection error");
        end;
        v114:fire();
    end);
    v114:wait();
    return v113;
end;
v5.GetRecommendedUsersndsAsync = function()
    return (v18((string.format("%s/v1/recommended-users", v50("friends")))));
end;
v5.GetUsersPresenceAsync = function(v117)
    local v118 = l_HttpService_0:JSONEncode({
        userIds = v117
    });
    local v119 = string.format("%s/v1/presence/users", v50("presence"));
    local l_v118_0 = v118;
    local l_pcall_3 = pcall;
    local v122 = nil;
    local v123;
    l_pcall_3, v123 = l_pcall_3(function()
        return game:HttpPostAsync(v119, l_v118_0, v122);
    end);
    if l_pcall_3 then
        return (v13(v123));
    else
        v3.DebugLog(v119, "rbxPostAsync() failed because", v123);
        return nil;
    end;
end;
v5.GetPlatformUserBalanceAsync = function()
    return (v18((string.format("%sv1/user/currency", v50("economy")))));
end;
v5.GetTotalUserBalanceAsync = function()
    return (v18((string.format("%sv1/user/currency", v50("economy")))));
end;
v5.GetUserOwnedPackagesAsync = function(v124, v125)
    return (v18(v6 .. "users/inventory/list-json?userId=" .. tostring(v124) .. "&assetTypeId=" .. tostring(32) .. "&pageNumber=" .. tostring(v125 or 1)));
end;
v5.GetCurrentlyWearingAsync = function(v126)
    return (v18((string.format("%s/v1/users/%d/currently-wearing", string.gsub(v6, "https://www.", "https://" .. "avatar" .. "."), v126))));
end;
v5.SetWearingAssetsAsync = function(v127)
    local v128 = {
        Url = string.format("%s/v1/avatar/set-wearing-assets", v50("avatar")), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            assetIds = v127
        }), 
        Headers = {
            ["Content-Type"] = "application/json"
        }
    };
    local v129 = nil;
    local v130 = v3.Signal();
    l_HttpService_0:RequestInternal(v128):Start(function(v131, v132)
        if v131 then
            if v132.StatusCode == 401 then
                v3.DebugLog(v128.Url, "rbxRequestInternal() failed: 401 Unauthorized");
            elseif not (v132.StatusCode >= 200) or v132.StatusCode >= 400 then
                v3.DebugLog(v128.Url, "rbxRequestInternal() failed:", v132.StatusCode);
            else
                v129 = v13(v132.Body);
            end;
        else
            v3.DebugLog(v128.Url, "rbxRequestInternal() failed: connection error");
        end;
        v130:fire();
    end);
    v130:wait();
    return v129;
end;
v5.PurchaseProductAsync = function(v133, v134, v135, v136)
    local v137 = string.format("%s/v1/purchases/products/%d", string.gsub(v6, "https://www.", "https://" .. "economy" .. "."), v133);
    local v138 = l_HttpService_0:JSONEncode({
        expectedCurrency = v136, 
        expectedPrice = v134, 
        expectedSellerId = v135
    });
    local l_pcall_4 = pcall;
    local v140 = nil;
    local v141;
    l_pcall_4, v141 = l_pcall_4(function()
        return game:HttpPostAsync(v137, v138, v140);
    end);
    if l_pcall_4 then
        return (v13(v141));
    else
        v3.DebugLog(v137, "rbxPostAsync() failed because", v141);
        return nil;
    end;
end;
v5.MultiGetBundleDetailsAsync = function(v142)
    return (v18((string.format("%sv1/bundles/details?bundleIds=%s", string.gsub(v6, "https://www.", "https://" .. "catalog" .. "."), (table.concat(v142, ","))))));
end;
v5.GetUserOwnedBundlesAsync = function(v143, v144)
    local v145 = string.format("%sv1/users/%s/bundles?sortOrder=Asc&limit=100", string.gsub(v6, "https://www.", "https://" .. "catalog" .. "."), (tostring(v143)));
    if v144 then
        v145 = string.format(v145 .. "&cursor=%s", v144);
    end;
    return (v18(v145));
end;
v5.GetAssetThumbnailBatchAsync = function(v146, v147, v148)
    return (v18((string.format(string.gsub(v6, "https://www.", "https://" .. "games" .. ".") .. "v1/games/game-thumbnails?%s&height=" .. tostring(v148) .. "&width=" .. tostring(v147), "imageTokens=" .. table.concat(v146, "&imageTokens=")))));
end;
v5.ReportAbuseAsyncV2 = function(v149, v150, v151, v152, v153, v154, v155, v156, v157)
    local v158 = l_HttpService_0:JSONEncode({
        tags = {
            ENTRY_POINT = {
                valueList = {
                    {
                        data = v154
                    }
                }
            }, 
            SUBMITTER_USER_ID = {
                valueList = {
                    {
                        data = v149
                    }
                }
            }, 
            REPORT_TARGET_USER_ID = {
                valueList = {
                    {
                        data = v151
                    }
                }
            }, 
            REPORTED_ABUSE_CATEGORY = {
                valueList = {
                    {
                        data = v156
                    }
                }
            }, 
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = v155
                    }
                }
            }, 
            REPORTER_COMMENT = {
                valueList = {
                    {
                        data = v157
                    }
                }
            }, 
            REPORT_TARGET_ASSET_ID = {
                valueList = {
                    {
                        data = v150
                    }
                }
            }, 
            REPORT_TARGET_ASSET_NAME = {
                valueList = {
                    {
                        data = v152
                    }
                }
            }, 
            REPORT_TARGET_ASSET_DESCRIPTION = {
                valueList = {
                    {
                        data = v153
                    }
                }
            }
        }
    });
    local v159 = v4.APIS_URL .. "abuse-reporting/v2/abuse-report";
    if not v158 then
        return nil;
    else
        local l_Default_0 = Enum.ThrottlingPriority.Default;
        local l_ApplicationJson_0 = Enum.HttpContentType.ApplicationJson;
        local l_status_6, l_result_6 = pcall(function()
            return l_HttpRbxApiService_0:PostAsyncFullUrl(v159, v158, l_Default_0, l_ApplicationJson_0);
        end);
        if l_status_6 then
            return (v13(l_result_6));
        else
            v3.DebugLog(v159 .. v158, "rbxApiPostAsyncFullUrl() failed because", l_result_6);
            return nil;
        end;
    end;
end;
v5.GetConsecutiveDaysLoggedInAsync = function()
    local v164 = {
        Url = string.format("%sv1/xbox/get-login-consecutive-days", v50("auth")), 
        Method = "GET"
    };
    local v165 = nil;
    local v166 = v3.Signal();
    l_HttpService_0:RequestInternal(v164):Start(function(v167, v168)
        if v167 then
            if v168.StatusCode == 401 then
                v3.DebugLog(v164.Url, "rbxRequestInternal() failed: 401 Unauthorized");
            elseif not (v168.StatusCode >= 200) or v168.StatusCode >= 400 then
                v3.DebugLog(v164.Url, "rbxRequestInternal() failed:", v168.StatusCode);
            else
                v165 = v13(v168.Body);
            end;
        else
            v3.DebugLog(v164.Url, "rbxRequestInternal() failed: connection error");
        end;
        v166:fire();
    end);
    v166:wait();
    return v165;
end;
v5.IsValidUsername = function(v169, v170)
    local v171 = true;
    if v169 ~= nil then
        v171 = #v169 == 0;
    end;
    if not v171 then
        v171 = true;
        if v170 ~= nil then
            v171 = #v170 == 0;
        end;
        if not v171 then
            local v172 = {
                Url = string.format("%sv2/usernames/validate?request.username=%s&request.birthday=%s", string.gsub(v6, "https://www.", "https://" .. "auth" .. "."), l_HttpService_0:UrlEncode(v169), v170), 
                Method = "GET"
            };
            local v173 = nil;
            local v174 = v3.Signal();
            l_HttpService_0:RequestInternal(v172):Start(function(v175, v176)
                if v175 then
                    if v176.StatusCode == 401 then
                        v3.DebugLog(v172.Url, "rbxRequestInternal() failed: 401 Unauthorized");
                    elseif not (v176.StatusCode >= 200) or v176.StatusCode >= 400 then
                        v3.DebugLog(v172.Url, "rbxRequestInternal() failed:", v176.StatusCode);
                    else
                        v173 = v13(v176.Body);
                    end;
                else
                    v3.DebugLog(v172.Url, "rbxRequestInternal() failed: connection error");
                end;
                v174:fire();
            end);
            v174:wait();
            return v173;
        end;
    end;
end;
v5.IsValidPassword = function(v177, v178)
    local v179 = true;
    if v177 ~= nil then
        v179 = #v177 == 0;
    end;
    if not v179 then
        v179 = true;
        if v178 ~= nil then
            v179 = #v178 == 0;
        end;
        if not v179 then
            local v180 = {
                Url = string.format("%sv2/passwords/validate?request.username=%s&request.password=%s", string.gsub(v6, "https://www.", "https://" .. "auth" .. "."), l_HttpService_0:UrlEncode(v177), l_HttpService_0:UrlEncode(v178)), 
                Method = "GET"
            };
            local v181 = nil;
            local v182 = v3.Signal();
            l_HttpService_0:RequestInternal(v180):Start(function(v183, v184)
                if v183 then
                    if v184.StatusCode == 401 then
                        v3.DebugLog(v180.Url, "rbxRequestInternal() failed: 401 Unauthorized");
                    elseif not (v184.StatusCode >= 200) or v184.StatusCode >= 400 then
                        v3.DebugLog(v180.Url, "rbxRequestInternal() failed:", v184.StatusCode);
                    else
                        v181 = v13(v184.Body);
                    end;
                else
                    v3.DebugLog(v180.Url, "rbxRequestInternal() failed: connection error");
                end;
                v182:fire();
            end);
            v182:wait();
            return v181;
        end;
    end;
end;
v5.PostSponsoredGameClickAsync = function(v185)
    local v186 = string.format("%sv1/sponsored-games/click", v50("ads"));
    local v187, v188 = string.format("\"%s\"", v185);
    local l_status_7, l_result_7 = pcall(function()
        return game:HttpPostAsync(v186, v187, v188);
    end);
    if l_status_7 then
        return (v13(l_result_7));
    else
        v3.DebugLog(v186, "rbxPostAsync() failed because", l_result_7);
        return nil;
    end;
end;
v5.GetUserVoteCountFromVotingApiAsync = function()
    local v191 = {
        Url = string.format("%svoting-api/user/get-vote-count?targetType=Place", v50("apis")), 
        Method = "GET"
    };
    local v192 = nil;
    local v193 = v3.Signal();
    l_HttpService_0:RequestInternal(v191):Start(function(v194, v195)
        if v194 then
            if v195.StatusCode == 401 then
                v3.DebugLog(v191.Url, "rbxRequestInternal() failed: 401 Unauthorized");
            elseif not (v195.StatusCode >= 200) or v195.StatusCode >= 400 then
                v3.DebugLog(v191.Url, "rbxRequestInternal() failed:", v195.StatusCode);
            else
                v192 = v13(v195.Body);
            end;
        else
            v3.DebugLog(v191.Url, "rbxRequestInternal() failed: connection error");
        end;
        v193:fire();
    end);
    v193:wait();
    return v192;
end;
v5.CreateCrossDeviceLoginCode = function()
    local v196 = string.format("%sauth-token-service/v1/login/create", v50("apis"));
    local l_pcall_5 = pcall;
    local v198 = "";
    local v199 = nil;
    local v200;
    l_pcall_5, v200 = l_pcall_5(function()
        return game:HttpPostAsync(v196, v198, v199);
    end);
    if l_pcall_5 then
        return (v13(v200));
    else
        v3.DebugLog(v196, "rbxPostAsync() failed because", v200);
        return nil;
    end;
end;
v5.CheckCrossDeviceLoginStatus = function(v201, v202)
    local v203 = {
        Url = string.format("%sauth-token-service/v1/login/status", v50("apis")), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            code = v201, 
            privateKey = v202
        }), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    local v204 = nil;
    local v205 = v3.Signal();
    l_HttpService_0:RequestInternal(v203):Start(function(v206, v207)
        if v206 then
            if v207.StatusCode == 401 then
                v3.DebugLog(v203.Url, "rbxRequestInternal() failed: 401 Unauthorized");
            elseif not (v207.StatusCode >= 200) or v207.StatusCode >= 400 then
                v3.DebugLog(v203.Url, "rbxRequestInternal() failed:", v207.StatusCode);
            else
                v204 = v13(v207.Body);
            end;
        else
            v3.DebugLog(v203.Url, "rbxRequestInternal() failed: connection error");
        end;
        v205:fire();
    end);
    v205:wait();
    return v204;
end;
v5.CancelCrossDeviceLogin = function(v208)
    local v209 = {
        Url = string.format("%sauth-token-service/v1/login/cancel", v50("apis")), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            code = v208
        }), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    local v210 = nil;
    local v211 = v3.Signal();
    l_HttpService_0:RequestInternal(v209):Start(function(v212, v213)
        if v212 then
            if v213.StatusCode == 401 then
                v3.DebugLog(v209.Url, "rbxRequestInternal() failed: 401 Unauthorized");
            elseif not (v213.StatusCode >= 200) or v213.StatusCode >= 400 then
                v3.DebugLog(v209.Url, "rbxRequestInternal() failed:", v213.StatusCode);
            else
                v210 = v13(v213.Body);
            end;
        else
            v3.DebugLog(v209.Url, "rbxRequestInternal() failed: connection error");
        end;
        v211:fire();
    end);
    v211:wait();
    return v210;
end;
return v5;

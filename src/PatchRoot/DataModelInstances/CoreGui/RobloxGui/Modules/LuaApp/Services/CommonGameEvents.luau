local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Players_0 = game:GetService("Players");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v4 = require(l_Modules_0.LuaApp.Analytics.Events.buttonClick);
local v5 = require(l_Modules_0.LuaApp.Analytics.Events.Games.gamePlayIntent);
local v6 = require(l_Modules_0.LuaApp.Analytics.Events.joinGameInPlacesList);
local v7 = require(l_Modules_0.LuaApp.Analytics.Events.peopleListInteractionV2);
local v8 = require(l_Modules_0.LuaApp.Analytics.Events.peopleListViewGameDetail);
local v9 = require(l_Modules_0.LuaApp.Analytics.Events.openModalFromGameTile);
local v10 = require(l_Modules_0.LuaApp.Analytics.Events.touchSwipe);
local v11 = require(l_Modules_0.LuaApp.Analytics.Events.Games.gameDetailReferral);
local v12 = require(l_Modules_0.LuaApp.AppPage);
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local l_SetGamePlaySession_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SetGamePlaySession;
local v15 = require(l_Modules_0.LuaApp.Constants);
local l_FFlagLuaAppFixNavigationUidLogging_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppFixNavigationUidLogging;
return {
    get = function(v17, v18, v19)
        local v20 = {
            [v12.Home] = "home", 
            [v12.Games] = "games", 
            [v12.SearchPage] = "gameSearch", 
            [v12.GameDetail] = "gameDetails", 
            [v12.Chat] = "chat"
        };
        local function _(v21)
            local v22 = v20[v21];
            if not v22 then
                return v21;
            else
                return v22;
            end;
        end;
        local function _()
            l_SetGamePlaySession_0(v17, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
        end;
        local function _()
            l_SetGamePlaySession_0(v17, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
        end;
        local v32 = {
            reportSeeAllWithId = function(v26, v27, v28)
                v19:setRBXEventStream("SeeAll", "gamesPageInteraction", {
                    aType = "touch", 
                    aValue = tostring(v26), 
                    gameSetTargetId = v27, 
                    pos = tonumber(v28)
                });
            end, 
            reportFilterChangeWithId = function(v29, v30, v31)
                v19:setRBXEventStream("SFMenu", "gamesPageInteraction", {
                    aType = "touch", 
                    aValue = tostring(v29), 
                    gameSetTargetId = v30, 
                    pos = tonumber(v31)
                });
            end
        };
        local function v44(v33, v34, v35, v36, v37, v38, v39, v40, v41, v42)
            local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
            l_SetGamePlaySession_0(v17, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
            v11(v19, v33, {
                pg = v33, 
                tis = v39, 
                sortPos = v37, 
                pid = v34, 
                ad = not v40 and "no" or "yes", 
                universeId = v41, 
                navigationUniverseId = if not l_FFlagLuaAppFixNavigationUidLogging_0 then nil else v42, 
                pos = v38, 
                gameSetTypeId = v35, 
                gameSetTargetId = v36, 
                locale = l_RobloxLocaleId_0
            });
        end;
        v32.reportOpenGameDetailWithId = function(v45, v46, v47, v48, v49, v50, v51, v52, v53, v54)
            v44(v20[v53] or v53, v45, v46, v47, v48, v49, v50, v51, v52, if not l_FFlagLuaAppFixNavigationUidLogging_0 then nil else v54);
        end;
        v32.reportOpenGameDetailFromSearch = function(v55, v56, v57, v58, v59, v60, v61, v62)
            v11(v19, v20[v60] or v60, {
                pg = v20[v60] or v60, 
                tis = v57, 
                pid = v55, 
                ad = not v58 and "no" or "yes", 
                universeId = v59, 
                pos = v56, 
                sortPos = v61, 
                gameSetTypeId = v62
            });
        end;
        v32.reportOpenGameDetailFromPeopleList = function(v63, v64, v65, v66, v67, v68, v69)
            local l_Home_0 = v12.Home;
            local v71 = v20[l_Home_0] or l_Home_0;
            l_SetGamePlaySession_0(v17, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
            v11(v19, v69, {
                pg = v71, 
                friendId = v63, 
                position = v64, 
                absolutePosition = v65, 
                pid = v66, 
                universeId = v67, 
                fromWhere = v68
            });
        end;
        v32.reportOpenGameDetailFromChat = function(v72, v73, v74, v75)
            local l_Chat_0 = v12.Chat;
            local v77 = v20[l_Chat_0] or l_Chat_0;
            l_SetGamePlaySession_0(v17, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
            v11(v19, v75, {
                pg = v77, 
                pid = v72, 
                universeId = v74, 
                conversationId = v73
            });
        end;
        v32.reportPeopleListInteraction = function(v78, v79, v80, v81, v82, v83)
            v7(v18.EventStream, v78, v79, v80, v82, v81, v83);
        end;
        v32.reportViewProfileFromPeopleList = function(v84, v85, v86, v87, v88)
            v8(v18.EventStream, v84, v85, v86, v87, v88);
        end;
        v32.reportPeopleListJoinGame = function(v89, v90, v91, v92, v93, v94, v95, v96, v97)
            l_SetGamePlaySession_0(v17, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
            v19:setRBXEventStream("contactFriendFinder", "joinGameInPeopleList", {
                uid = tostring(l_Players_0.LocalPlayer.UserId), 
                friendId = v89, 
                position = v90, 
                absolutePosition = v91, 
                rootPlaceId = v93, 
                gameInstanceId = v94, 
                inGameFriendCount = v95, 
                joinAttemptId = v96, 
                source = v97
            });
            v5(v19, v15.AnalyticsContext.PeopleListInHomePage, {
                placeId = v92, 
                rootPlaceId = v93, 
                joinAttemptId = v96
            });
        end;
        v32.reportJoinGameInPlacesList = function(v98, v99, v100, v101, v102)
            v6(v18.EventStream, v98, v99, v100, v101, v102);
            v5(v19, v15.AnalyticsContext.GamePlayIntentInPlacesList, {
                placeId = v99, 
                rootPlaceId = v100, 
                joinAttemptId = v102
            });
        end;
        v32.reportOpenModalFromGameTileForPlacesList = function(v103)
            v9(v18.EventStream, v103);
        end;
        v32.reportButtonClicked = function(v104, v105)
            v4(v18.EventStream, v104, v105);
        end;
        v32.reportTouchSearchInsteadForPlayerNamed = function(v106, v107)
            v4(v18.EventStream, v20[v107] or v107, "searchInsteadForPlayerNamed", v106);
        end;
        v32.reportTouchSwipe = function(v108, v109, v110, v111)
            v10(v18.EventStream, v108, v109, v110, v111);
        end;
        return v32;
    end
};

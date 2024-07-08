local l_Modules_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules");
local l_Shell_0 = l_Modules_0:FindFirstChild("Shell");
local l_Http_0 = require(l_Shell_0:FindFirstChild("Http"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local l_CachedData_0 = require(l_Shell_0:FindFirstChild("CachedData"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_AppState_0 = require(l_Shell_0:FindFirstChild("AppState"));
local v8 = require(l_Modules_0.Shell.Models.GameDetail);
local v9 = require(l_Modules_0.Shell.Models.RecommendedGame);
local v10 = require(l_Modules_0.Shell.Models.VoteData);
local v11 = nil;
pcall(function()
    v11 = game:GetService("ThirdPartyUserService");
end);
local v12 = nil;
pcall(function()
    v12 = game:GetService("PlatformService");
end);
local v13 = {
    FlushGameData = nil
};
local v14 = {};
v13.GetGameCreatorAsync = function(v15, v16)
    if not v16 then
        return ;
    else
        if not v14[v16] then
            v14[v16] = v15:GetGameDataAsync(v16):GetCreatorName();
        end;
        return v14[v16];
    end;
end;
v13.GetGameDataAsync = function(_, v18)
    local v19 = {};
    local v20 = l_Http_0.GetGameDetailsAsync(v18);
    if not v20 then
        l_Utility_0.DebugLog("GameData:GetGameDataAsync() failed to get web response for placeId " .. tostring(v18));
        v20 = {};
    end;
    v19.Data = v20;
    v19.GetCreatorName = function(v21)
        return v21.Data.Builder or "";
    end;
    v19.GetDescription = function(v22)
        return v22.Data.Description or "";
    end;
    v19.GetIsFavoritedByUser = function(v23)
        return v23.Data.IsFavoritedByUser or false;
    end;
    v19.GetLastUpdated = function(v24)
        return v24.Data.Updated or "";
    end;
    v19.GetCreationDate = function(v25)
        return v25.Data.Created or "";
    end;
    v19.GetMaxPlayers = function(v26)
        return v26.Data.MaxPlayers or 0;
    end;
    v19.GetIsExperimental = function(v27)
        return v27.Data.IsExperimental or false;
    end;
    v19.GetCreatorUserId = function(v28)
        return v28.Data.BuilderId;
    end;
    v19.GetVoteDataAsync = function(_)
        local v30 = l_Http_0.GetGameVotesAsync(v18);
        if not v30 then
            l_Utility_0.DebugLog("GameData:GetVoteDataAsync() failed to get web response for placeId " .. tostring(v18));
        end;
        local v31 = {};
        local v32 = not not v30 and v30.VotingModel or nil;
        if v32 then
            v31.UpVotes = v32.UpVotes or 0;
            v31.DownVotes = v32.DownVotes or 0;
            v31.UserVote = v32.UserVote;
            v31.CanVote = v32.CanVote or false;
            v31.CantVoteReason = v32.ReasonForNotVoteable or "PlayGame";
        end;
        return v31;
    end;
    v19.GetGameIconIdAsync = function(_)
        local v34 = nil;
        local v35 = l_Http_0.GetGameIconIdAsync(v18);
        if v35 then
            v34 = v35.ImageId or v18;
        end;
        return v34;
    end;
    v19.GetRecommendedGamesAsync = function(_)
        local v37 = l_Http_0.GetRecommendedGamesAsync(v18);
        if v37 then
            local v38 = {};
            for v39 = 1, #v37 do
                local v40 = v37[v39];
                if v40 then
                    table.insert(v38, {
                        Name = v40.GameName, 
                        PlaceId = v40.PlaceId, 
                        IconId = v40.ImageId
                    });
                end;
            end;
            return v38;
        else
            l_Utility_0.DebugLog("GameData:GetRecommendedGamesAsync() failed to get web response for placeId " .. tostring(v18));
            return {};
        end;
    end;
    v19.GetThumbnailIdsAsync = function(_)
        local v42 = l_Http_0.GetGameThumbnailsAsync(v18);
        if v42 then
            local v43 = {};
            local l_thumbnails_0 = v42.thumbnails;
            if l_thumbnails_0 then
                for v45 = 1, #l_thumbnails_0 do
                    local v46 = l_thumbnails_0[v45];
                    if v46 and v46.AssetTypeId == 1 then
                        local l_AssetId_0 = v46.AssetId;
                        if l_AssetId_0 then
                            table.insert(v43, l_AssetId_0);
                        end;
                    end;
                end;
            end;
            return v43;
        else
            l_Utility_0.DebugLog("GameData:GetThumbnailIdsAsync() failed to get web response for placeId " .. tostring(v18));
            return {};
        end;
    end;
    v19.GetBadgeDataAsync = function(_)
        return {};
    end;
    v19.PostFavoriteAsync = function(v49)
        local v50 = l_Http_0.PostFavoriteToggleAsync(v18);
        local v51 = v50 and v50.success == true;
        l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.FavoriteToggle, v51);
        if v51 then
            v49.Data.IsFavoritedByUser = not v49:GetIsFavoritedByUser();
            return v51;
        else
            local v52 = "Failed";
            if not (not v50 or not v50.message) then
                v52 = "FloodCheck";
            end;
            return v51, v52;
        end;
    end;
    v19.PostVoteAsync = function(_, v54)
        local v55 = l_Http_0.PostGameVoteAsync(v18, v54);
        if v55 then
            local v56 = v55.Success == true;
            if v56 then
                return v56;
            else
                return v56, v55.ModalType;
            end;
        else
            return nil;
        end;
    end;
    return v19;
end;
local v57 = 0;
local v58 = 0;
local v59 = {};
if v11 then
    v11.ActiveUserSignedOut:connect(function()
        v13:FlushGameData();
        v57 = v57 + 1;
    end);
end;
v13.UpdateGameData = function(_, v61)
    local l_placeId_0 = v61.placeId;
    local l_universeId_0 = v61.universeId;
    local l_name_0 = v61.name;
    local l_creatorName_0 = v61.creatorName;
    local l_creatorId_0 = v61.creatorId;
    local l_iconId_0 = v61.iconId;
    local l_imageToken_0 = v61.imageToken;
    local l_playerCount_0 = v61.playerCount;
    local v70 = {
        UpVotes = v61.totalUpVotes, 
        DownVotes = v61.totalDownVotes
    };
    if v59[l_placeId_0] then
        local v71 = v59[l_placeId_0];
        v71.UpdateDebounce = true;
        v71.AccessCount = not not v71.AccessCount and v71.AccessCount + 1 or 1;
        v71.PlaceId = l_placeId_0;
        v71.Name = l_name_0;
        v71.CreatorName = l_creatorName_0;
        if not v71.IconId then
            v71.IconId = l_iconId_0;
        end;
        if not v71.ImageToken then
            v71.ImageToken = l_imageToken_0;
        end;
        v71.VoteData = v70;
        v71.CreatorUserId = l_creatorId_0;
        v71.UpdateDebounce = false;
        return ;
    else
        v59[l_placeId_0] = {};
        local v72 = v59[l_placeId_0];
        v72.UpdateDebounce = true;
        v72.RelatedGuiObjects = {};
        v72.AccessCount = 1;
        local function v73()
            return l_GlobalSettings_0.GameDetailsRefreshInterval;
        end;
        local v88 = l_CachedData_0(v72, nil, v73, function(v74)
            local l_v57_0 = v57;
            local v76 = false;
            local v77 = l_Http_0.GetGameDetailsAsync(v74.PlaceId);
            if v77 then
                local v78 = v8.fromJsonData(v77);
                if l_v57_0 == v57 then
                    v74.CreatorName = (v74.CreatorName or v78.creatorName) or "";
                    v74.Name = v74.Name or v78.name;
                    v74.Description = v78.description or "";
                    v74.IsFavorited = v78.isFavoritedByUser or false;
                    v74.LastUpdated = v78.updated or "";
                    v74.CreationDate = v78.created or "";
                    v74.MaxPlayers = v78.maxPlayers or 0;
                    v74.IsExperimental = v78.isExperimental or false;
                    v74.CreatorUserId = v78.creatorUserId;
                    v74.UniverseId = v78.universeId or 0;
                    local v79 = l_Http_0.PostExperienceGuidelines(v74.UniverseId);
                    if v79 then
                        local l_ageRecommendationDetails_0 = v79.ageRecommendationDetails;
                        local l_ageRecommendation_0 = (l_ageRecommendationDetails_0 and l_ageRecommendationDetails_0.summary).ageRecommendation;
                        local v82 = not not l_ageRecommendation_0 and l_ageRecommendation_0.displayName or "";
                        local v83 = not not l_ageRecommendation_0 and l_ageRecommendation_0.minimumAge or nil;
                        local l_descriptorUsages_0 = l_ageRecommendationDetails_0.descriptorUsages;
                        local v85 = {};
                        if l_descriptorUsages_0 then
                            for _, v87 in ipairs(l_descriptorUsages_0) do
                                if v87.descriptor then
                                    table.insert(v85, v87.descriptor.displayName or "");
                                end;
                            end;
                        end;
                        v74.ageDisplayName = v82;
                        v74.minimumAge = v83;
                        v74.descriptorDisplayNames = v85;
                    end;
                    v76 = true;
                end;
                return v76;
            else
                l_Utility_0.DebugLog("RefreshGameDetailsAsync() failed to get web response for placeId " .. tostring(v74.PlaceId));
                return v76;
            end;
        end);
        local v96 = l_CachedData_0(v72, nil, v73, function(v89)
            local l_v57_1 = v57;
            local v91 = false;
            local v92 = l_Http_0.GetGameVotesAsync(v89.PlaceId);
            if v92 then
                if l_v57_1 == v57 then
                    local v93 = {};
                    local v94 = not not v92 and v92.VotingModel or nil;
                    if v94 then
                        local v95 = v10.fromJsonData(v94);
                        v93.UpVotes = v95.upVotes or 0;
                        v93.DownVotes = v95.downVotes or 0;
                        v93.UserVote = v95.userVote;
                        v93.CanVote = v95.canVote or false;
                        v93.CantVoteReason = v95.reasonForNotVoteable or "PlayGame";
                        v89.VoteData = v93;
                        v91 = true;
                    end;
                end;
                return v91;
            else
                l_Utility_0.DebugLog("RefreshVoteDataAsync() failed to get web response for placeId " .. tostring(v89.PlaceId));
                return v91;
            end;
        end);
        local v109 = l_CachedData_0(v72, nil, v73, function(v97)
            local l_v57_2 = v57;
            local v99 = false;
            local v100 = l_Http_0.GetRecommendedGamesAsync(v97.PlaceId);
            if v100 then
                if l_v57_2 == v57 then
                    if v97.RecommendedGames then
                        for v101 = 1, #v97.RecommendedGames do
                            local v102 = v97.RecommendedGames[v101];
                            if v102 then
                                local l_v13_GameData_0 = v13:GetGameData(v102);
                                if l_v13_GameData_0 then
                                    l_v13_GameData_0.AccessCount = l_v13_GameData_0.AccessCount - 1;
                                end;
                            end;
                            v97.RecommendedGames[v101] = nil;
                        end;
                    end;
                    local v104 = {};
                    for v105 = 1, #v100 do
                        local v106 = v100[v105];
                        if v106 then
                            local v107 = nil;
                            local v108 = v9.fromJsonData(v106);
                            v107 = v108.placeId;
                            v13:UpdateGameData(v108);
                            table.insert(v104, v107);
                        end;
                    end;
                    v97.RecommendedGames = v104;
                    v99 = true;
                end;
                return v99;
            else
                l_Utility_0.DebugLog("RefreshRecommendedGamesAsync() failed to get web response for placeId " .. tostring(v97.PlaceId));
                return v99;
            end;
        end);
        local v119 = l_CachedData_0(v72, nil, v73, function(v110)
            local l_v57_3 = v57;
            local v112 = false;
            local v113 = l_Http_0.GetGameThumbnailsAsync(v110.PlaceId);
            if v113 then
                if l_v57_3 == v57 then
                    local v114 = {};
                    local l_thumbnails_1 = v113.thumbnails;
                    if l_thumbnails_1 then
                        for v116 = 1, #l_thumbnails_1 do
                            local v117 = l_thumbnails_1[v116];
                            if v117 and v117.AssetTypeId == 1 then
                                local l_AssetId_1 = v117.AssetId;
                                if l_AssetId_1 then
                                    table.insert(v114, l_AssetId_1);
                                end;
                            end;
                        end;
                    end;
                    v110.ThumbnailIds = v114;
                    v112 = true;
                end;
                return v112;
            else
                l_Utility_0.DebugLog("RefreshThumbnailIdsAsync() failed to get web response for placeId " .. tostring(v110.PlaceId));
                return v112;
            end;
        end);
        local v138 = l_CachedData_0(v72, nil, v73, function(v120)
            local l_v57_4 = v57;
            local v122 = {};
            local v123 = {};
            local v124 = nil;
            while true do
                local v125 = l_Http_0.GetBadgesForUniverseAsync(v120.UniverseId, v124);
                if not v125 or not v125.data then
                    v124 = nil;
                else
                    local v126 = {};
                    for _, v128 in ipairs(v125.data) do
                        if v128.enabled then
                            table.insert(v122, v128);
                            table.insert(v126, v128.id);
                        end;
                    end;
                    if #v126 > 0 then
                        local v129 = l_Http_0.GetUserAwardedBadgesAsync(l_AppState_0.store:getState().RobloxUser.rbxuid, v126);
                        if not (not v129 or not v129.data) then
                            for _, v131 in ipairs(v129.data) do
                                v123[v131.badgeId] = true;
                            end;
                        end;
                    end;
                    v124 = v125.nextPageCursor;
                end;
                if not (v124 ~= nil) then
                    break;
                end;
            end;
            if l_v57_4 ~= v57 then
                return false;
            else
                local v132 = {};
                for v133, v134 in ipairs(v122) do
                    local v135 = {
                        Name = v134.name, 
                        Description = v134.description, 
                        AssetId = v134.iconImageId, 
                        Order = v133
                    };
                    if v123[v134.id] then
                        v135.IsOwned = true;
                    end;
                    table.insert(v132, v135);
                end;
                table.sort(v132, function(v136, v137)
                    if v136.IsOwned == true and v137.IsOwned == true then
                        return v136.Order < v137.Order;
                    elseif not v136.IsOwned then
                        if not v137.IsOwned then
                            return v136.Order < v137.Order;
                        else
                            return false;
                        end;
                    else
                        return true;
                    end;
                end);
                v120.BadgeData = v132;
                return true;
            end;
        end);
        v72.GetGameDetailsAsync = function(v139)
            v88:Refresh();
            local v140 = v139 or {};
            v139.OnGetGameDetailsEnd:fire(v140);
            return v140;
        end;
        v72.GetVoteDataAsync = function(v141)
            v96:Refresh();
            local v142 = v141.VoteData or {};
            v141.OnGetVoteDataEnd:fire(v142);
            return v142;
        end;
        v72.GetRecommendedGamesAsync = function(v143)
            v109:Refresh();
            local v144 = v143.RecommendedGames or {};
            v143.OnGetRecommendedGamesEnd:fire(v144);
            return v144;
        end;
        v72.GetThumbnailIdsAsync = function(v145)
            v119:Refresh();
            local v146 = v145.ThumbnailIds or {};
            v145.OnGetThumbnailIdsEnd:fire(v146);
            return v146;
        end;
        v72.GetBadgeDataAsync = function(v147)
            v138:Refresh();
            local v148 = v147.BadgeData or {};
            v147.OnGetBadgeDataEnd:fire(v148);
            return v148;
        end;
        local v149 = false;
        v72.GetGameIconIdAsync = function(v150)
            while v149 do
                wait();
            end;
            v149 = true;
            local l_v57_5 = v57;
            local v152 = nil;
            local v153 = l_Http_0.GetGameIconIdAsync(l_placeId_0);
            if v153 then
                v152 = v153.ImageId or l_placeId_0;
            end;
            if l_v57_5 == v57 then
                v150.IconId = v152;
            end;
            v149 = false;
            return v152;
        end;
        v72.SetCanVote = function(v154, v155)
            local l_VoteData_0 = v154.VoteData;
            l_VoteData_0.CanVote = v155;
            l_VoteData_0.CantVoteReason = not v155 and "PlayGame" or "";
        end;
        v72.PostFavoriteAsync = function(v157)
            local v158 = l_Http_0.PostFavoriteToggleAsync(l_placeId_0);
            local v159 = v158 and v158.success == true;
            local v160 = nil;
            if v159 then
                v157.IsFavorited = not v157.IsFavorited;
            else
                v160 = "Failed";
                if not (not v158 or not v158.message) then
                    v160 = "FloodCheck";
                end;
            end;
            l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.FavoriteToggle, v159, v157.PlaceId);
            if v159 then
                return v159;
            else
                return v159, v160;
            end;
        end;
        v72.PostVoteAsync = function(v161, v162)
            local v163 = l_Http_0.PostGameVoteAsync(l_placeId_0, v162);
            if v163 then
                local v164 = v163.Success == true;
                if v164 then
                    local l_VoteData_1 = v161.VoteData;
                    local l_UserVote_0 = l_VoteData_1.UserVote;
                    if v162 == true then
                        l_VoteData_1.UpVotes = (l_VoteData_1.UpVotes or 0) + 1;
                        if l_UserVote_0 == false then
                            l_VoteData_1.DownVotes = (l_VoteData_1.DownVotes or 0) - 1;
                        end;
                    elseif v162 == false then
                        l_VoteData_1.DownVotes = (l_VoteData_1.DownVotes or 0) + 1;
                        if l_UserVote_0 == true then
                            l_VoteData_1.UpVotes = (l_VoteData_1.UpVotes or 0) - 1;
                        end;
                    elseif v162 == nil then
                        if l_UserVote_0 == true then
                            l_VoteData_1.UpVotes = (l_VoteData_1.UpVotes or 0) - 1;
                        elseif l_UserVote_0 == false then
                            l_VoteData_1.DownVotes = (l_VoteData_1.DownVotes or 0) - 1;
                        end;
                    end;
                    l_VoteData_1.UserVote = v162;
                    return v164;
                else
                    return v164, v163.ModalType;
                end;
            else
                return nil;
            end;
        end;
        v72.OnGetGameDetailsEnd = l_Utility_0.Signal();
        v72.OnGetVoteDataEnd = l_Utility_0.Signal();
        v72.OnGetRecommendedGamesEnd = l_Utility_0.Signal();
        v72.OnGetThumbnailIdsEnd = l_Utility_0.Signal();
        v72.OnGetBadgeDataEnd = l_Utility_0.Signal();
        if not v61 then
            v72.PlaceId = l_placeId_0;
            v72:GetGameDetailsAsync();
            v72:GetGameIconIdAsync();
        else
            v72.PlaceId = l_placeId_0;
            v72.UniverseId = l_universeId_0;
            v72.Name = l_name_0;
            v72.CreatorName = l_creatorName_0;
            v72.IconId = l_iconId_0;
            v72.ImageToken = l_imageToken_0;
            v72.VoteData = v70;
            v72.CreatorUserId = l_creatorId_0;
            v72.PlayerCount = l_playerCount_0;
        end;
        v72.UpdateDebounce = false;
        v58 = v58 + 1;
        if v58 > 5000 then
            local v167 = {};
            for v168 in pairs(v59) do
                v59[v168].Key = v168;
                v59[v168].TotalAccessCount = 0;
                if v59[v168].RelatedGuiObjects then
                    local v169 = {};
                    for v170 = 1, #v59[v168].RelatedGuiObjects do
                        local v171 = v59[v168].RelatedGuiObjects[v170];
                        if not ((not v171 or not v171:IsA("GuiObject")) or not v171.Parent) then
                            v59[v168].TotalAccessCount = v59[v168].TotalAccessCount + 1;
                            table.insert(v169, v171);
                        end;
                    end;
                    v59[v168].TotalAccessCount = v59[v168].TotalAccessCount + v59[v168].AccessCount;
                    v59[v168].RelatedGuiObjects = v169;
                end;
                table.insert(v167, v59[v168]);
            end;
            v58 = #v167;
            if v58 > 5000 then
                table.sort(v167, function(v172, v173)
                    return v173.TotalAccessCount < v172.TotalAccessCount;
                end);
                while v167[#v167] and v167[#v167].TotalAccessCount <= 0 do
                    local l_Key_0 = v167[#v167].Key;
                    if v59[l_Key_0].RecommendedGames then
                        local l_RecommendedGames_0 = v59[l_Key_0].RecommendedGames;
                        for v176 = 1, #l_RecommendedGames_0 do
                            local v177 = l_RecommendedGames_0[v176];
                            if v177 then
                                local l_v13_GameData_1 = v13:GetGameData(v177);
                                if l_v13_GameData_1 then
                                    l_v13_GameData_1.AccessCount = l_v13_GameData_1.AccessCount - 1;
                                end;
                            end;
                            l_RecommendedGames_0[v176] = nil;
                        end;
                    end;
                    v59[l_Key_0] = nil;
                    v167[#v167] = nil;
                end;
                v58 = #v167;
            end;
        end;
        return ;
    end;
end;
v13.GetGameData = function(_, v180, v181)
    if not v180 then
        return ;
    else
        if v181 then
            if not v59[v180] then
                v13:UpdateGameData({
                    placeId = v180
                });
            else
                while not (not v59[v180] or not v59[v180].UpdateDebounce) do
                    wait();
                end;
            end;
        end;
        return v59[v180];
    end;
end;
v13.AddRelatedGuiObject = function(_, v183, v184)
    if not (((not v183 or not v184) or not v184:IsA("GuiObject")) or not v184.Parent) then
        local l_v13_GameData_2 = v13:GetGameData(v183);
        if l_v13_GameData_2 then
            table.insert(l_v13_GameData_2.RelatedGuiObjects, v184);
        end;
    end;
end;
v13.ChangeGameDataAccessCount = function(_, v187, v188)
    if v187 then
        local l_v13_GameData_3 = v13:GetGameData(v187);
        if l_v13_GameData_3 then
            l_v13_GameData_3.AccessCount = l_v13_GameData_3.AccessCount + v188;
        end;
    end;
end;
v13.FlushGameData = function(_)
    for v191, _ in pairs(v59) do
        v59[v191] = nil;
    end;
    v59 = {};
    v58 = 0;
end;
return v13;

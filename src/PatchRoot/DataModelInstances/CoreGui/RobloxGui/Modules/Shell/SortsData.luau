local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = nil;
pcall(function()
    v1 = game:GetService("ThirdPartyUserService");
end);
local v2 = require(l_Modules_0.Shell.Utility);
local v3 = require(l_Modules_0.Shell.Analytics);
local v4 = require(l_Modules_0.Shell.GameData);
local v5 = require(l_Modules_0.Shell.LocalizedStrings);
local v6 = require(l_Modules_0.Shell.Http);
local v7 = require(l_Modules_0.Shell.EventHub);
local v8 = require(l_Modules_0.Shell.AppState);
local v9 = require(l_Modules_0.Shell.SafeAsync);
local v10 = require(l_Modules_0.Shell.Models.Game);
local v11 = require(l_Modules_0.Shell.Models.GameLegacy);
local v12 = require(l_Modules_0.Shell.ReloaderManager);
local v13 = {
    UpdateSorts = nil, 
    DefaultSortId = {
        MyGames = -3, 
        MyRecent = -2, 
        MyFavorite = -1, 
        Popular = 1, 
        Featured = 3, 
        TopGrossing = 8, 
        TopRated = 11, 
        PopularInCountry = 20, 
        Sponsored = 27, 
        Curated = 100
    }
};
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = false;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
do
    local l_v14_0, l_v15_0, l_v16_0, l_v17_0, l_v18_0, l_v19_0, l_v20_0, l_v21_0, l_v22_0, l_v23_0 = v14, v15, v16, v17, v18, v19, v20, v21, v22, v23;
    local function v36()
        if l_v14_0 then
            for v34 = 1, #l_v14_0.Data do
                l_v14_0.Data[v34]:Destroy();
                l_v14_0.Data[v34] = nil;
            end;
        end;
        if l_v16_0 then
            for v35 = 1, #l_v16_0.Data do
                l_v16_0.Data[v35]:Destroy();
                l_v16_0.Data[v35] = nil;
            end;
        end;
        if l_v20_0 then
            l_v20_0:Destroy();
        end;
        if l_v21_0 then
            l_v21_0:Destroy();
        end;
        if l_v22_0 then
            l_v22_0:Destroy();
        end;
        if l_v23_0 then
            l_v23_0:Destroy();
        end;
        l_v14_0 = nil;
        l_v15_0 = nil;
        l_v16_0 = nil;
        l_v17_0 = nil;
        l_v18_0 = nil;
        l_v19_0 = false;
        l_v20_0 = nil;
        l_v21_0 = nil;
        l_v22_0 = nil;
        l_v23_0 = nil;
    end;
    local v37 = 0;
    local v39 = v9({
        asyncFunc = function()
            return (v13:UpdateSorts());
        end, 
        callback = function(v38)
            wait(v38);
        end, 
        userRelated = true
    });
    v7:addEventListener(v7.Notifications.AuthenticationSuccess, "SortsData", function()
        v36();
        local l_v37_0 = v37;
        spawn(function()
            if l_v37_0 == v37 then
                v12:removeReloader("SortsData");
                l_v18_0 = v12:addReloaderFunc("SortsData", function()
                    v39();
                end, 0, true);
                v12:callReloaderFunc("SortsData", l_v18_0);
            end;
        end);
    end);
    if v1 then
        v1.ActiveUserSignedOut:connect(function()
            v36();
            v37 = v37 + 1;
            v12:removeReloader("SortsData");
        end);
    end;
    local function v47()
        return {
            GetSortAsync = function(_, _, _)
                v2.DebugLog("Sort GetSortAsync() must be implemented by sub class");
            end, 
            GetCuratedSortAsync = function(_, _, _)
                v2.DebugLog("Sort GetCuratedSortAsync() must be implemented by sub class");
            end
        };
    end;
    local function v211(v48, v49, v50, v51, v52, v53, v54, v55)
        local v56 = {};
        local v57 = {};
        local v58 = 200;
        local v59 = 0;
        local v60 = false;
        local v61 = 100;
        local v62 = nil;
        v56.Name = v54 or v49;
        v56.httpFunc = v50;
        v56.GameSetTargetId = v52 or 0;
        v56.Paging = {};
        if v51 then
            v56.userId = v51;
        end;
        v56.useTokens = v53;
        if not v56.useTokens then
            v56.Id = v48;
        else
            v56.sortToken = v48;
            v56.Id = v13.DefaultSortId[v49];
        end;
        v56.timeFilter = v55;
        local function v69(v63)
            local v64 = nil;
            local v65 = nil;
            local v66 = nil;
            for v67, v68 in pairs(v57) do
                if not v64 or v67 < v64 then
                    v64 = v67;
                end;
                if not v65 or v65 < v67 then
                    v65 = v67;
                end;
                if not ((not v63 or not tonumber(v68.PlaceId)) or not tonumber(v63)) and tonumber(v68.PlaceId) == tonumber(v63) then
                    v66 = v67;
                end;
            end;
            return v64, v65, v66;
        end;
        local function v77()
            local _, v71 = v69();
            if v62 then
                for v72 = v62 + 1, v71 do
                    if not (not v57[v72] or not v57[v72].PlaceId) then
                        v4:ChangeGameDataAccessCount(v57[v72].PlaceId, -1);
                        v57[v72] = nil;
                        v59 = v59 - 1;
                    end;
                end;
            end;
            if v58 < v59 then
                local v73 = {};
                for v74 in pairs(v57) do
                    v57[v74].Key = v74;
                    table.insert(v73, v57[v74]);
                end;
                v59 = #v73;
                if v58 < v59 then
                    table.sort(v73, function(v75, v76)
                        return v76.LastAccessTime < v75.LastAccessTime;
                    end);
                    while v58 < #v73 do
                        v4:ChangeGameDataAccessCount(v73[#v73].PlaceId, -1);
                        v57[v73[#v73].Key] = nil;
                        v73[#v73] = nil;
                    end;
                    v59 = #v73;
                end;
            end;
        end;
        if v56.Id == v13.DefaultSortId.TopRated and v56.GameSetTargetId == 0 then
            v56.timeFilter = v56.timeFilter or 2;
        elseif v56.Id == v13.DefaultSortId.MyFavorite and v56.GameSetTargetId == 0 then
            v56.eventString = v7.Notifications.FavoriteToggle;
            v56.objectIDString = tostring(v56.Id);
            v7:addEventListener(v56.eventString, v56.objectIDString, function(v78, v79)
                while v60 do
                    wait();
                end;
                v60 = true;
                if not (not v78 or not v79) then
                    local l_v4_GameData_0 = v4:GetGameData(v79);
                    if l_v4_GameData_0 then
                        local v81, v82, v83 = v69(v79);
                        if not v83 then
                            if l_v4_GameData_0.IsFavorited then
                                for v84 = v82, v81, -1 do
                                    v57[v84 + 1] = v57[v84];
                                end;
                                v57[1] = {};
                                v57[1].HasData = true;
                                v57[1].PlaceId = v79;
                                v57[1].LastAccessTime = tick();
                                v59 = v59 + 1;
                                v4:ChangeGameDataAccessCount(v79, 1);
                            end;
                        elseif not l_v4_GameData_0.IsFavorited then
                            for v85 = v83, v82 do
                                v57[v85] = v57[v85 + 1];
                            end;
                            v59 = v59 - 1;
                            v4:ChangeGameDataAccessCount(v79, -1);
                        end;
                        v77();
                    end;
                end;
                v60 = false;
            end);
        elseif v56.Id == v13.DefaultSortId.MyRecent and v56.GameSetTargetId == 0 then
            v62 = 50;
            v58 = 50;
            v61 = 50;
            v56.eventString = v7.Notifications.GameJoin;
            v56.objectIDString = tostring(v56.Id);
            v7:addEventListener(v56.eventString, v56.objectIDString, function(v86, v87)
                while v60 do
                    wait();
                end;
                v60 = true;
                if not (not v86 or not v87) and v87 ~= -1 then
                    local v88, v89, v90 = v69(v87);
                    if not v90 then
                        for v91 = v89, v88, -1 do
                            v57[v91 + 1] = v57[v91];
                        end;
                        v59 = v59 + 1;
                        v4:ChangeGameDataAccessCount(v87, 1);
                    else
                        for v92 = v90, v88 + 1, -1 do
                            v57[v92] = v57[v92 - 1];
                        end;
                    end;
                    v57[1] = {};
                    v57[1].HasData = true;
                    v57[1].PlaceId = v87;
                    v57[1].LastAccessTime = tick();
                    v77();
                end;
                v60 = false;
            end);
        end;
        local function _(v93)
            if v57[v93] then
                v4:ChangeGameDataAccessCount(v57[v93].PlaceId, -1);
                v57[v93] = nil;
                v59 = v59 - 1;
            end;
        end;
        v56.FlushPagingDataBack = function(v95, v96)
            while v96 <= #v95.Paging do
                table.remove(v95.Paging);
            end;
            for v97, v98 in pairs(v57) do
                if not (not (v98.PagingIndex and v96 <= v98.PagingIndex) or not v57[v97]) then
                    v4:ChangeGameDataAccessCount(v57[v97].PlaceId, -1);
                    v57[v97] = nil;
                    v59 = v59 - 1;
                end;
            end;
        end;
        v56.FlushPagingDataFront = function(v99, v100, v101)
            local v102 = v100 - 1;
            local v103 = v102 * v101;
            for v104 = 1, #v99.Paging - v102 do
                v99.Paging[v104] = v99.Paging[v104 + v102];
            end;
            for _ = 1, v102 do
                table.remove(v99.Paging);
            end;
            for v106 = 1, v99.Paging[1].cachedGamesData_StartIndex - 1 do
                if v57[v106] then
                    v4:ChangeGameDataAccessCount(v57[v106].PlaceId, -1);
                    v57[v106] = nil;
                    v59 = v59 - 1;
                end;
            end;
            local _, v108 = v69();
            for v109 = v103 + 1, v108 do
                v57[v109 - v103] = v57[v109];
                if not (not v57[v109] or not v57[v109].PagingIndex) then
                    v57[v109 - v103].PagingIndex = v57[v109].PagingIndex - v102;
                end;
            end;
            for v110 = (v108 - v103) + 1, v108 do
                v57[v110] = nil;
            end;
        end;
        v56.UpdateNextPaging = function(v111, v112, v113)
            local v114 = nil;
            if v112 == 1 then
                v114 = v6.GetCuratedSortAsync(v111.GameSetTargetId, v113);
            else
                local v115 = v111.Paging[v112 - 1] and v111.Paging[v112 - 1].NextUrl;
                v114 = v115 and v6.GetCuratedSortByUrlAsync(v115);
            end;
            local v116 = v114 and v114.data;
            local v117 = v114 and v114.paging;
            while not ((not (not v116 or #v116 <= 0) or not v117) or not v117.nextUrl) and v117.nextUrl ~= "" do
                v114 = v6.GetCuratedSortByUrlAsync(v117.nextUrl);
                v116 = v114 and v114.data;
                v117 = v114 and v114.paging;
            end;
            if not v116 or #v116 == 0 then
                v111:FlushPagingDataBack(v112);
                return nil;
            else
                if v112 <= #v111.Paging then
                    v111:FlushPagingDataBack(v112);
                end;
                local v118 = {
                    cachedGamesData_StartIndex = v112 == 1 and 1 or v111.Paging[v112 - 1].cachedGamesData_EndIndex + 1
                };
                v118.cachedGamesData_EndIndex = (v118.cachedGamesData_StartIndex + #v116) - 1;
                v118.PreviousUrl = v117 and v117.previousUrl;
                v118.NextUrl = v117 and v117.nextUrl;
                table.insert(v111.Paging, v118);
                return v116;
            end;
        end;
        v56.UpdatePreviousPaging = function(v119, v120, v121, v122)
            local v123 = v119.Paging[v120 + 1] and v119.Paging[v120 + 1].PreviousUrl;
            local v124 = v123 and v6.GetCuratedSortByUrlAsync(v123);
            local v125 = v124 and v124.data;
            local v126 = v124 and v124.paging;
            while not ((not (not v125 or #v125 <= 0) or not v126) or not v126.previousUrl) and v126.previousUrl ~= "" do
                v124 = v6.GetCuratedSortByUrlAsync(v126.previousUrl);
                v125 = v124 and v124.data;
                v126 = v124 and v124.paging;
            end;
            if not v125 or #v125 == 0 then
                if v119.Paging[v120] then
                    v119.Paging[v120] = {};
                end;
                return nil;
            else
                local v127 = false;
                if v120 == 0 then
                    v127 = true;
                    v120 = 1;
                    table.insert(v119.Paging, 1, {});
                    for v128, _ in pairs(v57) do
                        if v57[v128].PagingIndex then
                            v57[v128].PagingIndex = v57[v128].PagingIndex + 1;
                        end;
                    end;
                end;
                local v130 = v119.Paging[v120 + 1].cachedGamesData_StartIndex - 1;
                local v131 = (v130 - #v125) + 1;
                if v131 < 1 and v130 < v122 then
                    local v132, v133 = v69();
                    for v134 = v133, v132, -1 do
                        v57[v134 + v121] = v57[v134];
                    end;
                    for v135 = 1, v121 do
                        v57[v135] = nil;
                    end;
                    v131 = v131 + v121;
                    v130 = v130 + v121;
                    for v136 = 1, #v119.Paging do
                        if v119.Paging[v136] then
                            v119.Paging[v136].cachedGamesData_StartIndex = v119.Paging[v136].cachedGamesData_StartIndex + v121;
                            v119.Paging[v136].cachedGamesData_EndIndex = v119.Paging[v136].cachedGamesData_EndIndex + v121;
                        end;
                    end;
                end;
                v119.Paging[v120].cachedGamesData_StartIndex = v131;
                v119.Paging[v120].cachedGamesData_EndIndex = v130;
                v119.Paging[v120].PreviousUrl = v126 and v126.previousUrl;
                v119.Paging[v120].NextUrl = v126 and v126.nextUrl;
                local v137 = v119.Paging[v120].PreviousUrl and v119.Paging[v120].PreviousUrl ~= "";
                if (not v137 and #v125 <= v122) and v120 > 1 then
                    v127 = true;
                    v119:FlushPagingDataFront(v120, v121);
                end;
                return v125, v137, v127;
            end;
        end;
        v56.UpdateCachedGamesData = function(v138, v139, v140, v141)
            local v142 = v138.Paging[v140] and v138.Paging[v140].cachedGamesData_StartIndex;
            local v143 = v138.Paging[v140] and v138.Paging[v140].cachedGamesData_EndIndex;
            if v142 < 1 then
                v142 = 1;
            end;
            local v144 = not not v141 and v143 or v142;
            local v145 = not not v141 and v142 or v143;
            local v146 = not v141 and 1 or -1;
            for v147 = v144, v145, v146 do
                local v148 = (v147 - v142) + 1;
                local v149 = nil;
                v149 = if not v138.useTokens then v11.fromJsonData(v139[v148]) else v10.fromJsonData(v139[v148]);
                if v57[v147] then
                    v4:ChangeGameDataAccessCount(v57[v147].PlaceId, -1);
                    v57[v147] = nil;
                    v59 = v59 - 1;
                end;
                v4:UpdateGameData(v149);
                v57[v147] = {};
                v57[v147].PlaceId = v149.placeId;
                v57[v147].PagingIndex = v140;
                v57[v147].LastAccessTime = tick();
                v59 = v59 + 1;
            end;
            v77();
        end;
        v56.GetPagingData = function(v150, v151, v152, v153, v154)
            local v155 = v150.Paging[v151] and v150.Paging[v151].cachedGamesData_StartIndex;
            local v156 = v150.Paging[v151] and v150.Paging[v151].cachedGamesData_EndIndex;
            local v157 = true;
            local v158 = false;
            local v159 = false;
            if (not (not v155 or not v156) and v155 > 0) and v155 <= v156 then
                for v160 = v155, v156 do
                    if not v57[v160] then
                        v157 = false;
                        break;
                    end;
                end;
            else
                v157 = false;
            end;
            if not v157 then
                local v161 = nil;
                if v153 then
                    local v162, v163, v164 = v150:UpdatePreviousPaging(v151, v152, v154);
                    v161 = v162;
                    v158 = v163;
                    v159 = v164;
                    if v159 then
                        v151 = 1;
                    end;
                else
                    v161 = v150:UpdateNextPaging(v151, v152);
                end;
                if not v161 then
                    return 0;
                else
                    v150:UpdateCachedGamesData(v161, v151, v153);
                    return #v161, v158, v159;
                end;
            else
                return (v156 - v155) + 1, v150.Paging[v151].PreviousUrl and v150.Paging[v151].PreviousUrl ~= "", false;
            end;
        end;
        v56.GetCuratedSortAsync = function(v165, v166, v167, v168)
            while v60 do
                wait();
            end;
            v60 = true;
            local v169 = {};
            local v170 = true;
            local v171 = false;
            local v172 = (v166 - 1) * v167;
            if v166 > 0 then
                for v173 = v172 + 1, v172 + v167 do
                    if not v57[v173] then
                        v170 = false;
                        break;
                    end;
                end;
            else
                v170 = false;
            end;
            if v170 then
                v171 = v166 > 1;
            elseif v168 then
                local l_PagingIndex_0 = v57[(v172 + v167) + 1].PagingIndex;
                local l_v167_0 = v167;
                if v165.Paging[l_PagingIndex_0].cachedGamesData_StartIndex == (v172 + v167) + 1 then
                    l_PagingIndex_0 = l_PagingIndex_0 - 1;
                else
                    for v176 = (v172 + v167) + 1, v165.Paging[#v165.Paging].cachedGamesData_EndIndex do
                        if v57[v176].PagingIndex == l_PagingIndex_0 then
                            l_v167_0 = l_v167_0 + 1;
                        else
                            break;
                        end;
                    end;
                end;
                while l_v167_0 > 0 do
                    local l_v165_PagingData_0, v178, v179 = v165:GetPagingData(l_PagingIndex_0, v167, v168, l_v167_0);
                    l_v167_0 = l_v167_0 - l_v165_PagingData_0;
                    local v180 = true;
                    if l_v167_0 >= 0 then
                        v180 = v178;
                    end;
                    v171 = v180;
                    if v179 then
                        l_PagingIndex_0 = 1;
                        v172 = 0;
                        v166 = 1;
                    end;
                    l_PagingIndex_0 = l_PagingIndex_0 - 1;
                    if not (not (not (l_v165_PagingData_0 ~= 0) or not v178) and l_PagingIndex_0 >= 0) then
                        break;
                    end;
                end;
                if l_v167_0 > 0 then
                    for v181 = 1, l_v167_0 do
                        local v182 = v172 + v181;
                        if v57[v182] then
                            v4:ChangeGameDataAccessCount(v57[v182].PlaceId, -1);
                            v57[v182] = nil;
                            v59 = v59 - 1;
                        end;
                    end;
                end;
            else
                local v183 = 1;
                local l_v167_1 = v167;
                if v166 > 1 then
                    v183 = v57[v172].PagingIndex;
                    if v165.Paging[v183].cachedGamesData_EndIndex == v172 then
                        v183 = v183 + 1;
                    else
                        for v185 = v172, 1, -1 do
                            if v57[v185].PagingIndex == v183 then
                                l_v167_1 = l_v167_1 + 1;
                            else
                                break;
                            end;
                        end;
                    end;
                end;
                while l_v167_1 > 0 do
                    local l_v165_PagingData_1 = v165:GetPagingData(v183, v167);
                    l_v167_1 = l_v167_1 - l_v165_PagingData_1;
                    v183 = v183 + 1;
                    if not (l_v165_PagingData_1 ~= 0) then
                        break;
                    end;
                end;
                if l_v167_1 > 0 then
                    for v187 = (v167 - l_v167_1) + 1, v167 do
                        local v188 = v172 + v187;
                        if v57[v188] then
                            v4:ChangeGameDataAccessCount(v57[v188].PlaceId, -1);
                            v57[v188] = nil;
                            v59 = v59 - 1;
                        end;
                    end;
                end;
            end;
            local v189 = not not v168 and v172 + v167 or v172 + 1;
            local v190 = not not v168 and v172 + 1 or v172 + v167;
            local v191 = not v168 and 1 or -1;
            for v192 = v189, v190, v191 do
                if v57[v192] then
                    v57[v192].LastAccessTime = tick();
                    if v168 then
                        table.insert(v169, 1, v57[v192].PlaceId);
                    else
                        table.insert(v169, v57[v192].PlaceId);
                    end;
                else
                    break;
                end;
            end;
            v60 = false;
            return v169, v171;
        end;
        v56.GetSortAsync = function(v193, v194, v195)
            while v60 do
                wait();
            end;
            v60 = true;
            local v196 = {};
            local v197 = true;
            for v198 = v194 + 1, v194 + v195 do
                if not v57[v198] then
                    v197 = false;
                    break;
                end;
            end;
            if not v197 then
                local v199 = nil;
                v199 = if not v193.useTokens then v193.httpFunc(v194, v195, v193.userId or v193.Id, v193.timeFilter) else v193.httpFunc(v194, v195, v193.sortToken, v193.timeFilter);
                local v200 = nil;
                local v201 = {};
                if v199 then
                    v200 = not not v193.useTokens and v199.games or v199;
                    for v202 = 1, #v200 do
                        local v203 = nil;
                        v203 = if not v193.useTokens then v11.fromJsonData(v200[v202]) else v10.fromJsonData(v200[v202]);
                        local v204 = v194 + v202;
                        if v57[v204] then
                            v4:ChangeGameDataAccessCount(v57[v204].PlaceId, -1);
                            v57[v204] = nil;
                            v59 = v59 - 1;
                        end;
                        v4:UpdateGameData(v203);
                        v57[v194 + v202] = {};
                        v57[v194 + v202].HasData = true;
                        v57[v194 + v202].PlaceId = v203.placeId;
                        v57[v194 + v202].IsSponsored = v200[v202].isSponsored;
                        v57[v194 + v202].NativeAdData = v200[v202].nativeAdData;
                        v57[v194 + v202].LastAccessTime = tick();
                        v59 = v59 + 1;
                        if not (v56.Id ~= v13.DefaultSortId.MyRecent) or v56.Id == v13.DefaultSortId.Featured then
                            table.insert(v201, v203.placeId);
                        end;
                    end;
                    for v205 = #v200 + 1, v195 do
                        v57[v194 + v205] = {};
                        v57[v194 + v205].HasData = false;
                        v57[v194 + v205].LastAccessTime = tick();
                    end;
                    v77();
                end;
            end;
            for v206 = v194 + 1, v194 + v195 do
                if v57[v206] then
                    v57[v206].LastAccessTime = tick();
                    if v57[v206].HasData then
                        table.insert(v196, {
                            placeId = v57[v206].PlaceId, 
                            isSponsored = v57[v206].IsSponsored, 
                            nativeAdData = v57[v206].NativeAdData
                        });
                    else
                        break;
                    end;
                end;
            end;
            v60 = false;
            return v196;
        end;
        v56.InitSortAsync = function(v207)
            v207:GetSortAsync(0, v61);
        end;
        v56.FlushGamesData = function(v208)
            for v209 in pairs(v57) do
                v4:ChangeGameDataAccessCount(v57[v209].PlaceId, -1);
                v57[v209] = nil;
            end;
            v57 = {};
            v208.Paging = {};
            v59 = 0;
        end;
        v56.Destroy = function(v210)
            v210:FlushGamesData();
            if not (not v210.eventString or not v210.objectIDString) then
                v7:removeEventListener(v210.eventString, v210.objectIDString);
            end;
        end;
        return v56;
    end;
    local function _(v212, v213, v214, v215, v216)
        return (v211(v212, v213, v214, v215, v216, false));
    end;
    local function _(v218, v219, v220, v221, v222, v223, v224)
        return (v211(v218, v219, v220, v221, v222, true, v223, v224));
    end;
    local function _(v226, v227)
        local v228 = nil;
        if not ((((not l_v16_0 or not l_v16_0.Data) or not l_v17_0) or not l_v17_0[v226]) or not l_v17_0[v226][v227 or 0]) then
            v228 = l_v16_0.Data[l_v17_0[v226][v227 or 0]];
        end;
        return v228 or v47();
    end;
    local _ = function(v230, v231)
        for _, v233 in ipairs(v231) do
            if v233.name == v230 then
                return v233.token;
            end;
        end;
        return nil;
    end;
    local function v250(v235)
        local v236 = {};
        local v237 = tick();
        local v238 = nil;
        local v239 = v6.GetGameSortsAsync2();
        if v239 then
            local l_timeFilters_0 = v239.timeFilters;
            for v241 = 1, #v239.sorts do
                if (v239.sorts[v241].GameSetTargetId or 0) == 0 then
                    local l_token_0 = v239.sorts[v241].token;
                    local l_name_0 = v239.sorts[v241].name;
                    local l_displayName_0 = v239.sorts[v241].displayName;
                    local v245 = v13.DefaultSortId[l_name_0];
                    local l_tokenExpiryInSeconds_0 = v239.sorts[v241].tokenExpiryInSeconds;
                    if v238 == nil then
                        v238 = l_tokenExpiryInSeconds_0;
                        if v238 == nil then
                            v238 = 0;
                        end;
                    else
                        v238 = math.min(v238, l_tokenExpiryInSeconds_0);
                    end;
                    if v245 then
                        local v247 = nil;
                        if l_name_0 == "TopRated" then
                            for _, v249 in ipairs(l_timeFilters_0) do
                                if v249.name == "PastWeek" then
                                    v247 = v249.token;
                                    goto label0 --[[  true, false  ]];
                                end;
                            end;
                            v247 = nil;
                        end;
                        ::label0::;
                        table.insert(v236, (v211(l_token_0, l_name_0, v6.GetSortAsync2, nil, nil, true, l_displayName_0, v247)));
                    end;
                end;
            end;
        end;
        l_v23_0 = l_v23_0 or v211(v13.DefaultSortId.MyGames, v5:LocalizedString("PlayMyPlaceMoreGamesTitle"), v6.GetUserPlacesAsync, v235, nil, false);
        table.insert(v236, l_v23_0);
        return v236, v238 - (tick() - v237);
    end;
    local v251 = false;
    v13.UpdateSorts = function(_)
        if v251 then
            while v251 do
                wait();
            end;
        end;
        v251 = true;
        local l_rbxuid_0 = v8.store:getState().RobloxUser.rbxuid;
        local l_v37_1 = v37;
        local v255, v256 = v250(l_rbxuid_0);
        if not (not (l_v37_1 == v37) or l_v14_0 and l_v19_0) and #v255 > 0 then
            l_v15_0 = {};
            for v257 = 1, #v255 do
                spawn(function()
                    if v255[v257] then
                        v255[v257]:FlushGamesData();
                        v255[v257]:InitSortAsync();
                    end;
                end);
                if l_v15_0[v255[v257].Id] == nil then
                    l_v15_0[v255[v257].Id] = {};
                end;
                l_v15_0[v255[v257].Id][v255[v257].GameSetTargetId or 0] = v257;
            end;
            l_v14_0 = {
                Data = v255, 
                Version = tick()
            };
        end;
        v251 = false;
        return v256;
    end;
    v13.CallUpdate = function(_, v259)
        if not v259 then
            v12:callReloaderFunc("SortsData", l_v18_0, true);
            return ;
        else
            v12:callReloaderFunc("SortsData", l_v18_0);
            return ;
        end;
    end;
    v13.SuspendUpdate = function(_)
        l_v19_0 = true;
        v12:suspendReloaderFunc("SortsData", l_v18_0);
    end;
    v13.ResumeUpdate = function(_)
        l_v19_0 = false;
        v12:resumeReloaderFunc("SortsData", l_v18_0);
    end;
    local function v264()
        local l_v37_2 = v37;
        if not l_v14_0 then
            while v251 do
                wait();
            end;
            if not l_v14_0 then
                v12:callReloaderFunc("SortsData", l_v18_0);
            end;
        end;
        if l_v37_2 == v37 then
            if not (not l_v16_0 or not l_v14_0) and l_v16_0.Version ~= l_v14_0.Version then
                for v263 = 1, #l_v16_0.Data - 3 do
                    l_v16_0.Data[v263]:Destroy();
                    l_v16_0.Data[v263] = nil;
                end;
            end;
            l_v17_0 = l_v15_0;
            l_v16_0 = l_v14_0;
        end;
    end;
    v13.GetSort = function(_, v266, v267)
        v264();
        local v268 = nil;
        if not ((((not l_v16_0 or not l_v16_0.Data) or not l_v17_0) or not l_v17_0[v266]) or not l_v17_0[v266][v267 or 0]) then
            v268 = l_v16_0.Data[l_v17_0[v266][v267 or 0]];
        end;
        return v268 or v47();
    end;
    v13.GetUserFavorites = function(_)
        v264();
        local l_MyFavorite_0 = v13.DefaultSortId.MyFavorite;
        local v271 = nil;
        if not ((((not l_v16_0 or not l_v16_0.Data) or not l_v17_0) or not l_v17_0[l_MyFavorite_0]) or not l_v17_0[l_MyFavorite_0][0]) then
            v271 = l_v16_0.Data[l_v17_0[l_MyFavorite_0][0]];
        end;
        return v271 or v47();
    end;
    v13.GetUserRecent = function(_)
        v264();
        local l_MyRecent_0 = v13.DefaultSortId.MyRecent;
        local v274 = nil;
        if not ((((not l_v16_0 or not l_v16_0.Data) or not l_v17_0) or not l_v17_0[l_MyRecent_0]) or not l_v17_0[l_MyRecent_0][0]) then
            v274 = l_v16_0.Data[l_v17_0[l_MyRecent_0][0]];
        end;
        return v274 or v47();
    end;
    v13.GetUserPlaces = function(_)
        v264();
        local l_MyGames_0 = v13.DefaultSortId.MyGames;
        local v277 = nil;
        if not ((((not l_v16_0 or not l_v16_0.Data) or not l_v17_0) or not l_v17_0[l_MyGames_0]) or not l_v17_0[l_MyGames_0][0]) then
            v277 = l_v16_0.Data[l_v17_0[l_MyGames_0][0]];
        end;
        return v277 or v47();
    end;
    v13.GetGameSearchSort = function(_, v279)
        if not l_v20_0 then
            l_v20_0 = v211("GameSearch", "GameSearch", v6.SearchGamesAsync, nil, nil, false);
        end;
        v3.SetRBXEventStream("GameSearch", {
            SearchWord = v279
        });
        l_v20_0:FlushGamesData();
        l_v20_0.Id = v279;
        return l_v20_0;
    end;
    v13.GetSorts = function(_)
        v264();
        return l_v16_0;
    end;
    v13.HasSorts = function(_)
        return l_v16_0 ~= nil;
    end;
end;
return v13;

local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.Common.Immutable);
local l_Players_0 = game:GetService("Players");
local function _(v2)
    return function(v3, v4, v5, v6)
        assert(type(v4) == "string", "Expected eventContext to be a string");
        assert(type(v5) == "string", "Expected placeId to be a string");
        assert(type(v6) == "table", "Expected state to be a table");
        v3:setRBXEventStream(v4, v2, (v0.JoinDictionaries({
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v5
        }, v6)));
    end;
end;
local function _(v8)
    local function v13(v9, v10, v11, v12)
        assert(type(v10) == "string", "Expected eventContext to be a string");
        assert(type(v11) == "string", "Expected placeId to be a string");
        assert(type(v12) == "table", "Expected state to be a table");
        v9:setRBXEventStream(v10, v8, (v0.JoinDictionaries({
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v11
        }, v12)));
    end;
    return function(v14, v15, v16, v17, v18)
        assert(type(v17) == "boolean", "Expected state to be a boolean");
        if v18 ~= nil then
            assert(type(v18) == "table", "Expected extraData to be a table");
        end;
        return v13(v14, v15, v16, (v0.JoinDictionaries(v18 or {}, {
            state = not v17 and "off" or "on"
        })));
    end;
end;
local function _(v20)
    local function v25(v21, v22, v23, v24)
        assert(type(v22) == "string", "Expected eventContext to be a string");
        assert(type(v23) == "string", "Expected placeId to be a string");
        assert(type(v24) == "table", "Expected state to be a table");
        v21:setRBXEventStream(v22, v20, (v0.JoinDictionaries({
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v23
        }, v24)));
    end;
    return function(v26, v27, v28, v29)
        return v25(v26, v27, v28, v29 or {});
    end;
end;
local v31 = {};
local v32 = "copyExperienceLink";
local l_v32_0 = v32 --[[ copy: 9 -> 10 ]];
local function v38(v34, v35, v36, v37)
    assert(type(v35) == "string", "Expected eventContext to be a string");
    assert(type(v36) == "string", "Expected placeId to be a string");
    assert(type(v37) == "table", "Expected state to be a table");
    v34:setRBXEventStream(v35, l_v32_0, (v0.JoinDictionaries({
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v36
    }, v37)));
end;
local l_v38_0 = v38 --[[ copy: 8 -> 11 ]];
v31.CopyExperienceLink = function(v40, v41, v42, v43)
    return l_v38_0(v40, v41, v42, v43 or {});
end;
v32 = "favorite";
local l_v32_1 = v32 --[[ copy: 9 -> 12 ]];
v38 = function(v45, v46, v47, v48)
    assert(type(v46) == "string", "Expected eventContext to be a string");
    assert(type(v47) == "string", "Expected placeId to be a string");
    assert(type(v48) == "table", "Expected state to be a table");
    v45:setRBXEventStream(v46, l_v32_1, (v0.JoinDictionaries({
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v47
    }, v48)));
end;
local l_v38_1 = v38 --[[ copy: 8 -> 13 ]];
v31.Favorite = function(v50, v51, v52, v53, v54)
    assert(type(v53) == "boolean", "Expected state to be a boolean");
    if v54 ~= nil then
        assert(type(v54) == "table", "Expected extraData to be a table");
    end;
    return l_v38_1(v50, v51, v52, (v0.JoinDictionaries(v54 or {}, {
        state = not v53 and "off" or "on"
    })));
end;
v32 = "follow";
local l_v32_2 = v32 --[[ copy: 9 -> 14 ]];
v38 = function(v56, v57, v58, v59)
    assert(type(v57) == "string", "Expected eventContext to be a string");
    assert(type(v58) == "string", "Expected placeId to be a string");
    assert(type(v59) == "table", "Expected state to be a table");
    v56:setRBXEventStream(v57, l_v32_2, (v0.JoinDictionaries({
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v58
    }, v59)));
end;
local l_v38_2 = v38 --[[ copy: 8 -> 15 ]];
v31.Follow = function(v61, v62, v63, v64, v65)
    assert(type(v64) == "boolean", "Expected state to be a boolean");
    if v65 ~= nil then
        assert(type(v65) == "table", "Expected extraData to be a table");
    end;
    return l_v38_2(v61, v62, v63, (v0.JoinDictionaries(v65 or {}, {
        state = not v64 and "off" or "on"
    })));
end;
v32 = "navigateToInviteFriends";
local l_v32_3 = v32 --[[ copy: 9 -> 16 ]];
v38 = function(v67, v68, v69, v70)
    assert(type(v68) == "string", "Expected eventContext to be a string");
    assert(type(v69) == "string", "Expected placeId to be a string");
    assert(type(v70) == "table", "Expected state to be a table");
    v67:setRBXEventStream(v68, l_v32_3, (v0.JoinDictionaries({
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v69
    }, v70)));
end;
local l_v38_3 = v38 --[[ copy: 8 -> 17 ]];
v31.ShareGameToChat = function(v72, v73, v74, v75)
    return l_v38_3(v72, v73, v74, v75 or {});
end;
v31.GameDetailsSubpage = function(v76, v77, v78, v79)
    local v80 = "gameDetailsSubpage";
    (function(v81, v82, v83, v84)
        assert(type(v82) == "string", "Expected eventContext to be a string");
        assert(type(v83) == "string", "Expected placeId to be a string");
        assert(type(v84) == "table", "Expected state to be a table");
        v81:setRBXEventStream(v82, v80, (v0.JoinDictionaries({
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v83
        }, v84)));
    end)(v76, v77, v78, {
        subpage = v79
    });
end;
v31.Vote = function(v85, v86, v87, v88, v89)
    local v90 = "vote";
    (function(v91, v92, v93, v94)
        assert(type(v92) == "string", "Expected eventContext to be a string");
        assert(type(v93) == "string", "Expected placeId to be a string");
        assert(type(v94) == "table", "Expected state to be a table");
        v91:setRBXEventStream(v92, v90, (v0.JoinDictionaries({
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v93
        }, v94)));
    end)(v85, v86, v87, {
        vote = v88, 
        prevVote = v89
    });
end;
v32 = "openMore";
local l_v32_4 = v32 --[[ copy: 9 -> 18 ]];
v38 = function(v96, v97, v98, v99)
    assert(type(v97) == "string", "Expected eventContext to be a string");
    assert(type(v98) == "string", "Expected placeId to be a string");
    assert(type(v99) == "table", "Expected state to be a table");
    v96:setRBXEventStream(v97, l_v32_4, (v0.JoinDictionaries({
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v98
    }, v99)));
end;
local l_v38_4 = v38 --[[ copy: 8 -> 19 ]];
v31.OpenMore = function(v101, v102, v103, v104)
    return l_v38_4(v101, v102, v103, v104 or {});
end;
v32 = "openGameDetailsPT";
local l_v32_5 = v32 --[[ copy: 9 -> 20 ]];
v38 = function(v106, v107, v108, v109)
    assert(type(v107) == "string", "Expected eventContext to be a string");
    assert(type(v108) == "string", "Expected placeId to be a string");
    assert(type(v109) == "table", "Expected state to be a table");
    v106:setRBXEventStream(v107, l_v32_5, (v0.JoinDictionaries({
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v108
    }, v109)));
end;
local l_v38_5 = v38 --[[ copy: 8 -> 21 ]];
v31.OpenPlayTogether = function(v111, v112, v113, v114)
    return l_v38_5(v111, v112, v113, v114 or {});
end;
v32 = "createPrivateGame";
local l_v32_6 = v32 --[[ copy: 9 -> 22 ]];
v38 = function(v116, v117, v118, v119)
    assert(type(v117) == "string", "Expected eventContext to be a string");
    assert(type(v118) == "string", "Expected placeId to be a string");
    assert(type(v119) == "table", "Expected state to be a table");
    v116:setRBXEventStream(v117, l_v32_6, (v0.JoinDictionaries({
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v118
    }, v119)));
end;
local l_v38_6 = v38 --[[ copy: 8 -> 23 ]];
v31.CreatePrivateGame = function(v121, v122, v123, v124)
    return l_v38_6(v121, v122, v123, v124 or {});
end;
v32 = "joinFriendsInGame";
local l_v32_7 = v32 --[[ copy: 9 -> 24 ]];
v38 = function(v126, v127, v128, v129)
    assert(type(v127) == "string", "Expected eventContext to be a string");
    assert(type(v128) == "string", "Expected placeId to be a string");
    assert(type(v129) == "table", "Expected state to be a table");
    v126:setRBXEventStream(v127, l_v32_7, (v0.JoinDictionaries({
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v128
    }, v129)));
end;
local l_v38_7 = v38 --[[ copy: 8 -> 25 ]];
v31.JoinFriendsInGame = function(v131, v132, v133, v134)
    return l_v38_7(v131, v132, v133, v134 or {});
end;
v32 = "shareExperienceLink";
v38 = function(v135, v136, v137, v138)
    assert(type(v136) == "string", "Expected eventContext to be a string");
    assert(type(v137) == "string", "Expected placeId to be a string");
    assert(type(v138) == "table", "Expected state to be a table");
    v135:setRBXEventStream(v136, v32, (v0.JoinDictionaries({
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v137
    }, v138)));
end;
v31.ShareExperienceLink = function(v139, v140, v141, v142)
    return v38(v139, v140, v141, v142 or {});
end;
return v31;

local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local v1 = require(l_script_FirstAncestor_0.devDependencies);
local l_jestExpect_0 = v1.jestExpect;
local v3 = v1.RhodiumHelpers();
local v4 = require(l_script_FirstAncestor_0.Common.TextKeys);
local function v9(v5)
    return function(v6, v7)
        local v8 = v3.findFirstElement(v6, v5);
        if not v7.assertElementExists then
            l_jestExpect_0(v8).toBeNil();
            return nil;
        else
            l_jestExpect_0(v8).never.toBeNil();
            return v8;
        end;
    end;
end;
local v10 = {
    Name = "emptyList"
};
local l_v10_0 = v10 --[[ copy: 7 -> 13 ]];
local function v15(v12, v13)
    local v14 = v3.findFirstElement(v12, l_v10_0);
    if not v13.assertElementExists then
        l_jestExpect_0(v14).toBeNil();
        return nil;
    else
        l_jestExpect_0(v14).never.toBeNil();
        return v14;
    end;
end;
local v16 = {
    Name = "glimmer1"
};
local l_v16_0 = v16 --[[ copy: 8 -> 14 ]];
v10 = function(v18, v19)
    local v20 = v3.findFirstElement(v18, l_v16_0);
    if not v19.assertElementExists then
        l_jestExpect_0(v20).toBeNil();
        return nil;
    else
        l_jestExpect_0(v20).never.toBeNil();
        return v20;
    end;
end;
local v21 = {
    Name = "errorModal"
};
local l_v21_0 = v21 --[[ copy: 9 -> 15 ]];
v16 = function(v23, v24)
    local v25 = v3.findFirstElement(v23, l_v21_0);
    if not v24.assertElementExists then
        l_jestExpect_0(v25).toBeNil();
        return nil;
    else
        l_jestExpect_0(v25).never.toBeNil();
        return v25;
    end;
end;
local v26 = {
    Text = v4.INVITE_BUTTON_TEXT
};
local l_v26_0 = v26 --[[ copy: 10 -> 16 ]];
v21 = function(v28, v29)
    local v30 = v3.findFirstElement(v28, l_v26_0);
    if not v29.assertElementExists then
        l_jestExpect_0(v30).toBeNil();
        return nil;
    else
        l_jestExpect_0(v30).never.toBeNil();
        return v30;
    end;
end;
local v31 = {
    Text = v4.CLOSE_MODAL
};
v26 = function(v32, v33)
    local v34 = v3.findFirstElement(v32, v31);
    if not v33.assertElementExists then
        l_jestExpect_0(v34).toBeNil();
        return nil;
    else
        l_jestExpect_0(v34).never.toBeNil();
        return v34;
    end;
end;
local v35 = {
    Text = v4.GO_TO_ADD_FRIENDS
};
return {
    findElement = v9, 
    checkEmptyList = v15, 
    checkLoadingList = v10, 
    checkFailedList = v16, 
    checkCloseButton = v26, 
    checkGoToAddFriends = function(v36, v37)
        local v38 = v3.findFirstElement(v36, v35);
        if not v37.assertElementExists then
            l_jestExpect_0(v38).toBeNil();
            return nil;
        else
            l_jestExpect_0(v38).never.toBeNil();
            return v38;
        end;
    end, 
    checkInviteButton = v21
};

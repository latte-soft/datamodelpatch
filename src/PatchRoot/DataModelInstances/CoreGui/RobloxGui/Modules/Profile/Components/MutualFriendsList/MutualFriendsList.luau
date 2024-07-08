local v0 = require(game:GetService("CorePackages").Packages.React);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Profile");
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_useLocalization_0 = v2.useLocalization;
local l_Array_0 = v2.LuauPolyfill.Array;
local v6 = require(l_script_FirstAncestor_0.ProfileContext);
local v7 = require(l_script_FirstAncestor_0.Common.TextKeys);
local _ = require(l_script_FirstAncestor_0.Common.ContextPropsTypes);
local v9 = require(l_script_FirstAncestor_0.Flags.getFIntProfileMutualFriendsListMaxNameLength);
local v10 = require(script.Parent.MutualFriendsListPresentational);
local v11 = require(script.Parent.LoadingShimmer);
local v12 = require(script.Parent.useUserNamesForDisplay);
local v13 = require(script.Parent.useProfileInsightsByUserIdQuery);
local function _(v14, v15)
    local v16 = v9();
    if v15.shouldTruncateLongNames and v16 <= #v14 then
        return (("%*%*"):format(string.sub(v14, 1, v16 - 1), "\226\128\166"));
    else
        return v14;
    end;
end;
local function _(v18, v19)
    return l_Array_0.join(l_Array_0.map(v18, function(v20)
        local l_v19_0 = v19;
        local v22 = v9();
        if l_v19_0.shouldTruncateLongNames and v22 <= #v20 then
            return (("%*%*"):format(string.sub(v20, 1, v22 - 1), "\226\128\166"));
        else
            return v20;
        end;
    end), ", ");
end;
local function _(v24, v25)
    if v24 == 1 then
        return v25.oneMutualFriendText;
    elseif v24 > 1 and v24 <= 3 then
        return v25.pluralMutualFriendsText;
    else
        local v26 = v24 - 3;
        return (("+ %* %*"):format(v26, if v26 == 1 then v25.oneOtherMutualFriendText else v25.pluralOtherMutualFriendsText));
    end;
end;
local function _(v28, v29, v30, v31)
    local v35 = l_Array_0.join(l_Array_0.map(v29, function(v32)
        local l_v30_0 = v30;
        local v34 = v9();
        if l_v30_0.shouldTruncateLongNames and v34 <= #v32 then
            return (("%*%*"):format(string.sub(v32, 1, v34 - 1), "\226\128\166"));
        else
            return v32;
        end;
    end), ", ");
    local v36;
    if v28 == 1 then
        v36 = v31.oneMutualFriendText;
    elseif v28 > 1 and v28 <= 3 then
        v36 = v31.pluralMutualFriendsText;
    else
        local v37 = v28 - 3;
        v36 = ("+ %* %*"):format(v37, if v37 == 1 then v31.oneOtherMutualFriendText else v31.pluralOtherMutualFriendsText);
    end;
    return (("%* %*"):format(v35, v36));
end;
return function(v39)
    local v40 = l_useLocalization_0({
        oneMutualFriendText = v7.OneMutualFriendText, 
        oneOtherMutualFriendText = v7.OneOtherMutualFriendText, 
        pluralMutualFriendsText = v7.PluralMutualFriendsText, 
        pluralOtherMutualFriendsText = v7.PluralOtherMutualFriendsText
    });
    local v41 = v0.useContext(v6.Context);
    local v42, v43 = v13({
        userId = v39.profileUserId
    });
    local v44 = v42.mutualFriends or {};
    local v45 = v12(v44, 3);
    local v46 = #v44;
    if not v43 and v46 == 0 then
        return nil;
    elseif not v43 and v45 then
        local v47 = false;
        if v46 > 1 then
            v47 = not v41.wideMode;
        end;
        local v48 = {
            shouldTruncateLongNames = v47
        };
        local v52 = l_Array_0.join(l_Array_0.map(v45, function(v49)
            local l_v48_0 = v48;
            local v51 = v9();
            if l_v48_0.shouldTruncateLongNames and v51 <= #v49 then
                return (("%*%*"):format(string.sub(v49, 1, v51 - 1), "\226\128\166"));
            else
                return v49;
            end;
        end), ", ");
        local v53;
        if v46 == 1 then
            v53 = v40.oneMutualFriendText;
        elseif v46 > 1 and v46 <= 3 then
            v53 = v40.pluralMutualFriendsText;
        else
            local v54 = v46 - 3;
            v53 = ("+ %* %*"):format(v54, if v54 == 1 then v40.oneOtherMutualFriendText else v40.pluralOtherMutualFriendsText);
        end;
        return l_Roact_0.createElement(v10, {
            layoutOrder = v39.layoutOrder, 
            text = ("%* %*"):format(v52, v53)
        });
    else
        return l_Roact_0.createElement(v11, {
            layoutOrder = v39.layoutOrder
        });
    end;
end;

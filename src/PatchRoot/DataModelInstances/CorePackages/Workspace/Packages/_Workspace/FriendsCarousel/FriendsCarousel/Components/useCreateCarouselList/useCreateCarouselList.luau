local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local l_FIntFriendsCarouselSocialBtnFriendsLimit_0 = require(l_Parent_0.SharedFlags).FIntFriendsCarouselSocialBtnFriendsLimit;
local function _(v6)
    return v3.List.map(v6 or {}, function(v7, v8)
        return (v3.Dictionary.join({
            isCustomBtn = true, 
            id = v7.id or ("%*%*"):format("CustomBtn", v8)
        }, v7));
    end);
end;
local function v13(v10)
    return v3.List.map(v10 or {}, function(v11, v12)
        return (v3.Dictionary.join({
            index = v12
        }, v11));
    end);
end;
return function(v14)
    return (v2.useMemo(function()
        return v13((v3.List.join({
            if not v14.includeAddFriendsBtn then nil else v3.Dictionary.join({
                isAddButton = true, 
                id = "AddFriendsBtn"
            }, v14.addFriendsBtn or {})
        }, v14.users or {}, if not not v14.friendCount and v14.friendCount <= l_FIntFriendsCarouselSocialBtnFriendsLimit_0 then v3.List.map(v14.socialOnboardingBtns or {}, function(v15, v16)
            return (v3.Dictionary.join({
                isCustomBtn = true, 
                id = v15.id or ("%*%*"):format("CustomBtn", v16)
            }, v15));
        end) else {} or {})));
    end, {
        v14.includeAddFriendsBtn, 
        v14.friendCount, 
        v14.users, 
        v14.socialOnboardingBtns, 
        v14.addFriendsBtn
    }));
end;

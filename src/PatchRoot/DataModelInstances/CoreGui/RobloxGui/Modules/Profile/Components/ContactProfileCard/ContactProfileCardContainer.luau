local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_React_0 = v1.React;
local l_Dash_0 = v1.Dash;
local l_useDispatch_0 = v1.useDispatch;
local v6 = require(l_Parent_0.Networking.GetContactAvatar);
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
local l_RetrievalStatus_0 = v1.UIBlox.App.Loading.Enum.RetrievalStatus;
local v9 = require(l_Parent_0.ProfileContext);
local l_useSelector_0 = v1.useSelector;
local v11 = require(script.Parent.ContactProfileCard);
return function(v12)
    local v13 = l_useDispatch_0();
    local v15 = l_useSelector_0(function(_)
        return l_RetrievalStatus_0.Done;
    end);
    local v16 = l_React_0.useContext(v9.Context);
    local l_profileUserId_0 = v16.profileUserId;
    local v19 = l_useSelector_0(function(v18)
        return l_getDeepValue_0(v18, string.format("Profile.Contacts.byContactId.%s.contactName", l_profileUserId_0)) or "LOADING";
    end);
    local v21 = l_getDeepValue_0(v16, "contactProps.avatarAssetHashId") or l_useSelector_0(function(v20)
        if not v20.Profile.Contacts.byContactId[l_profileUserId_0] then
            return "";
        else
            return v20.Profile.Contacts.byContactId[l_profileUserId_0].avatarAssetHashId;
        end;
    end);
    local function v22()
        v13(v6.API({
            height = 420, 
            width = 420, 
            assetHashIds = {
                v21
            }, 
            avatarType = "avatar"
        }));
    end;
    l_React_0.useEffect(function()
        if v21 ~= "" then
            v22();
        end;
    end);
    return l_Roact_0.createElement(v11, (l_Dash_0.join(v12, {
        profileUserId = v16.profileUserId, 
        peekViewProps = v16.peekViewProps, 
        wideMode = v16.wideMode, 
        profileType = v16.profileType, 
        profilePageDataStatus = v15, 
        contactName = v19, 
        avatarImageUrl = v12.avatarImageUrl, 
        avatarAssetHashId = v21
    })));
end;

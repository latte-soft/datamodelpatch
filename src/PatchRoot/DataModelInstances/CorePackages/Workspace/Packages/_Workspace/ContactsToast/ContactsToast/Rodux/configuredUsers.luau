local l_Parent_0 = script:FindFirstAncestor("ContactsToast").Parent;
local l_convertActions_0 = require(l_Parent_0.SocialReducerAdaptors).convertActions;
local l_usersActionAdaptor_0 = require(l_Parent_0.SocialReducerAdaptors).usersActionAdaptor;
local v3 = require(script.Parent.RoduxUsers);
local v4 = {
    byUserId = {}, 
    byUsername = {}
};
local v5 = v3.installReducer();
return function()
    return l_convertActions_0(v5, l_usersActionAdaptor_0(v3), v4);
end;

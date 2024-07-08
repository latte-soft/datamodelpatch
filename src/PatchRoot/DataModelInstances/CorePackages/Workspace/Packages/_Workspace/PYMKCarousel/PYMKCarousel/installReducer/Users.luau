local v0 = require(script:FindFirstAncestor("PYMKCarousel").dependencies);
local l_RoduxUsers_0 = v0.RoduxUsers;
local l_convertActions_0 = v0.convertActions;
local l_llama_0 = v0.llama;
local l_usersActionAdaptor_0 = v0.usersActionAdaptor;
local v5 = require(script.Parent.usersOmniActionAdaptor);
local v6 = {
    byUserId = {}, 
    byUsername = {}
};
local v7 = l_RoduxUsers_0.installReducer();
local function _(v8)
    return l_llama_0.Dictionary.join(l_usersActionAdaptor_0(l_RoduxUsers_0), v5(v8));
end;
return function(v10)
    return l_convertActions_0(v7, l_llama_0.Dictionary.join(l_usersActionAdaptor_0(l_RoduxUsers_0), v5(v10)), v6);
end;

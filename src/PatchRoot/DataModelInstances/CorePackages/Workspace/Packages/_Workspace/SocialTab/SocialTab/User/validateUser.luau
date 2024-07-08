local l_t_0 = require(script:FindFirstAncestor("SocialTab").dependencies).t;
return l_t_0.interface({
    id = l_t_0.string, 
    username = l_t_0.string, 
    displayName = l_t_0.string, 
    thumbnail = l_t_0.string, 
    isPremium = l_t_0.boolean, 
    userPresenceType = l_t_0.optional(l_t_0.userdata), 
    lastLocation = l_t_0.optional(l_t_0.string)
});

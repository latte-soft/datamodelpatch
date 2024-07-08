local l_MockUser_0 = require(script:FindFirstAncestor("AppChat").Parent.UserLib).Models.MockUser;
return function(v1)
    local v2 = l_MockUser_0.new();
    v2.name = v1.name;
    v2.displayName = v1.displayName;
    v2.id = v1.id;
    v2.isFriend = v1.isFriend or true;
    return v2;
end;

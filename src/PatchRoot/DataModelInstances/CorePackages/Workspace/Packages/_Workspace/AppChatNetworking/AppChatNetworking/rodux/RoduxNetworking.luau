local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
return require(l_script_FirstAncestor_0.Parent.RoduxNetworking).config({
    keyPath = "ChatAppReducer.networkStatus", 
    networkImpl = require(l_script_FirstAncestor_0.url.HttpRequest).default, 
    killRequestWithFilteredIds = true
});

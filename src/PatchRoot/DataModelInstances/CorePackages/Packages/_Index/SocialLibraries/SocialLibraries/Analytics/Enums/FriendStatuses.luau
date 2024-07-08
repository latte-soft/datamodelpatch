return require(script.Parent.Parent.Parent.dependencies).enumerate(script.Name, {
    NotFriends = "nonfriend", 
    Friends = "friend", 
    RequestSent = "requestSent", 
    RequestReceived = "requestReceived", 
    Ineligible = "ineligible", 
    Recommendation = "recommendation"
});

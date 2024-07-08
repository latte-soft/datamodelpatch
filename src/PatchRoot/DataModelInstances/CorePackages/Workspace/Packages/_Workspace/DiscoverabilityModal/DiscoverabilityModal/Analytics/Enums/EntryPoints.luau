local l_Contexts_0 = require(script.Parent.Parent.Parent.dependencies).SocialLuaAnalytics.Analytics.Enums.Contexts;
return {
    AddFriends = l_Contexts_0.AddFriends, 
    HomePage = ("%*FriendsSort"):format(l_Contexts_0.HomePage), 
    HomePageProfile = ("%*Profile"):format(l_Contexts_0.HomePage), 
    SocialTabProfile = ("%*Profile"):format(l_Contexts_0.SocialTab), 
    ContactsList = ("%*FindFriendsBanner"):format(l_Contexts_0.ContactImport)
};

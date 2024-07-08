local l_Parent_0 = script.Parent.Parent;
return {
    projects = {
        require(l_Parent_0.FriendsCarousel)["jest.config"], 
        require(l_Parent_0.FriendsMenu)["jest.config"], 
        require(l_Parent_0.PYMKCarousel)["jest.config"], 
        require(l_Parent_0.Squads)["jest.config"]
    }
};

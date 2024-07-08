local l_Parent_0 = script.Parent.Parent;
return {
    projects = {
        require(l_Parent_0.SocialModalsCommon)["jest.config"], 
        require(l_Parent_0.ContactImporter)["jest.config"], 
        require(l_Parent_0.DiscoverabilityModal)["jest.config"], 
        require(l_Parent_0.InviteLinkExpiredModal)["jest.config"], 
        require(l_Parent_0.MessageToast)["jest.config"], 
        require(l_Parent_0.ShareLinkInvalidModal)["jest.config"], 
        require(l_Parent_0.SetAlias)["jest.config"]
    }
};

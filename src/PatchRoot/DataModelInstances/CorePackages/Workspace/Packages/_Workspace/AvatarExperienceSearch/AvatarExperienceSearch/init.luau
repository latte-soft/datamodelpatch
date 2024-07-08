return {
    Features = {
        SearchLandingPage = require(script.Features.SearchLandingPage.SearchLandingPage), 
        useSearchLandingPageProps = require(script.Features.SearchLandingPage.useSearchLandingPageProps)
    }, 
    Utils = {
        RecentSearchTermsAppStorage = require(script.Utils.RecentSearchTermsAppStorage)
    }, 
    ["jest.config"] = script["jest.config"]
};

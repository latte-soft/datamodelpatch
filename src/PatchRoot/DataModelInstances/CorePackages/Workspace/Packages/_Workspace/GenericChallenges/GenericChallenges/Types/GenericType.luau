local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericChallenges");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.addRawValueMethodToEnum);
local v3 = require(l_Parent_0.enumerate);
local v4 = {
    Captcha = "captcha", 
    TwoStepVerification = "twostepverification", 
    SecurityQuestions = "securityquestions", 
    Reauthentication = "reauthentication", 
    ProofOfWork = "proofofwork", 
    ForceAuthenticator = "forceauthenticator", 
    ForceTwoStepVerification = "forcetwostepverification", 
    DeviceIntegrity = "deviceintegrity", 
    DeviceAccessToken = "deviceaccesstoken"
};
local v5 = v3(script.Name, v4);
v2(v5, v4);
return v5;

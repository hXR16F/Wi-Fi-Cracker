(
echo;^<?xml version="1.0"?^>
echo;^<WLANProfile xmlns="http://www.microsoft.com/networking/WLAN/profile/v1"^>
echo;    ^<name^>%~1^</name^>
echo;    ^<SSIDConfig^>
echo;        ^<SSID^>
echo;            ^<name^>%~1^</name^>
echo;        ^</SSID^>
echo;    ^</SSIDConfig^>
echo;    ^<connectionType^>ESS^</connectionType^>
echo;    ^<connectionMode^>auto^</connectionMode^>
echo;    ^<MSM^>
echo;        ^<security^>
echo;            ^<authEncryption^>
echo;                ^<authentication^>%~3^</authentication^>
echo;                ^<encryption^>AES^</encryption^>
echo;                ^<useOneX^>false^</useOneX^>
echo;            ^</authEncryption^>
echo;            ^<sharedKey^>
echo;                ^<keyType^>passPhrase^</keyType^>
echo;                ^<protected^>false^</protected^>
echo;                ^<keyMaterial^>%~2^</keyMaterial^>
echo;            ^</sharedKey^>
echo;        ^</security^>
echo;    ^</MSM^>
echo;    ^<MacRandomization xmlns="http://www.microsoft.com/networking/WLAN/profile/v3"^>
echo;        ^<enableRandomization^>false^</enableRandomization^>
echo;    ^</MacRandomization^>
echo;^</WLANProfile^>
) > "Wi-Fi_Crack_Profile.xml"
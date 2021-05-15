set ControlBarProBig=340_ControlBarProZH.big
set ControlBarProBak=340_ControlBarProZH.big.BAK
set ControlBarPro720Big=340_ControlBarPro720ZH.big
set ControlBarPro720Bak=340_ControlBarPro720ZH.big.BAK
set ControlBarPro900Big=340_ControlBarPro900ZH.big
set ControlBarPro900Bak=340_ControlBarPro900ZH.big.BAK
set ControlBarPro1080Big=340_ControlBarPro1080ZH.big
set ControlBarPro1080Bak=340_ControlBarPro1080ZH.big.BAK
set ControlBarPro1440Big=340_ControlBarPro1440ZH.big
set ControlBarPro1440Bak=340_ControlBarPro1440ZH.big.BAK
set ControlBarPro2160Big=340_ControlBarPro2160ZH.big
set ControlBarPro2160Bak=340_ControlBarPro2160ZH.big.BAK
set ControlBarProHideIpBig=340_ControlBarProHideIpZH.big
set ControlBarProHideIpBak=340_ControlBarProHideIpZH.big.BAK
set ControlBarProHideMailBig=340_ControlBarProHideMailZH.big
set ControlBarProHideMailBak=340_ControlBarProHideMailZH.big.BAK

if exist %ControlBarProBig%     ( ren %ControlBarProBig%     %ControlBarProBak%     ) else ( if exist %ControlBarProBak%     ( ren %ControlBarProBak%     %ControlBarProBig% ))
if exist %ControlBarPro720Big%  ( ren %ControlBarPro720Big%  %ControlBarPro720Bak%  ) else ( if exist %ControlBarPro720Bak%  ( ren %ControlBarPro720Bak%  %ControlBarPro720Big% ))
if exist %ControlBarPro900Big%  ( ren %ControlBarPro900Big%  %ControlBarPro900Bak%  ) else ( if exist %ControlBarPro900Bak%  ( ren %ControlBarPro900Bak%  %ControlBarPro900Big% ))
if exist %ControlBarPro1080Big% ( ren %ControlBarPro1080Big% %ControlBarPro1080Bak% ) else ( if exist %ControlBarPro1080Bak% ( ren %ControlBarPro1080Bak% %ControlBarPro1080Big% ))
if exist %ControlBarPro1440Big% ( ren %ControlBarPro1440Big% %ControlBarPro1440Bak% ) else ( if exist %ControlBarPro1440Bak% ( ren %ControlBarPro1440Bak% %ControlBarPro1440Big% ))
if exist %ControlBarPro2160Big% ( ren %ControlBarPro2160Big% %ControlBarPro2160Bak% ) else ( if exist %ControlBarPro2160Bak% ( ren %ControlBarPro2160Bak% %ControlBarPro2160Big% ))

if exist %ControlBarProHideIpBig%   ( ren %ControlBarProHideIpBig% %ControlBarProHideIpBak% )
if exist %ControlBarProHideMailBig% ( ren %ControlBarProHideMailBig% %ControlBarProHideMailBak% )

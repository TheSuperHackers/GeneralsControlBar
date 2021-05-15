set ControlBarProHideIpBig=340_ControlBarProHideIpZH.big
set ControlBarProHideIpBak=340_ControlBarProHideIpZH.big.BAK
set ControlBarProHideMailBig=340_ControlBarProHideMailZH.big
set ControlBarProHideMailBak=340_ControlBarProHideMailZH.big.BAK

if exist %ControlBarProHideIpBig% (
	ren %ControlBarProHideIpBig% %ControlBarProHideIpBak%
) else (
	if exist %ControlBarProHideIpBak% (
		ren %ControlBarProHideIpBak% %ControlBarProHideIpBig%
	)
)

if exist %ControlBarProHideMailBig% (
	ren %ControlBarProHideMailBig% %ControlBarProHideMailBak%
) else (
	if exist %ControlBarProHideMailBak% (
		ren %ControlBarProHideMailBak% %ControlBarProHideMailBig%
	)
)

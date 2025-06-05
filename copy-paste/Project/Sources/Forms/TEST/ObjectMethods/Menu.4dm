If (FORM Event:C1606.code=On Clicked:K2:4)
	
	$menu:=Create menu:C408
	
	APPEND MENU ITEM:C411($menu; "cut")
	SET MENU ITEM PARAMETER:C1004($menu; -1; "cut")
	GET HIGHLIGHT:C209(*; OBJECT Get name:C1087(Object with focus:K67:3); $start; $end)
	If (($end-$start)=0)
		DISABLE MENU ITEM:C150($menu; -1)
	End if 
	
	APPEND MENU ITEM:C411($menu; "copy")
	SET MENU ITEM PARAMETER:C1004($menu; -1; "copy")
	GET HIGHLIGHT:C209(*; OBJECT Get name:C1087(Object with focus:K67:3); $start; $end)
	If (($end-$start)=0)
		DISABLE MENU ITEM:C150($menu; -1)
	End if 
	
	APPEND MENU ITEM:C411($menu; "paste")
	SET MENU ITEM PARAMETER:C1004($menu; -1; "paste")
	If (Pasteboard data size:C400("public.utf8-plain-text")<0)
		DISABLE MENU ITEM:C150($menu; -1)
	End if 
	
	$command:=Dynamic pop up menu:C1006($menu)
	RELEASE MENU:C978($menu)
	
	Case of 
		: ($command="cut")
			INVOKE ACTION:C1439(ak cut:K76:53; ak current form:K76:70)
		: ($command="copy")
			INVOKE ACTION:C1439(ak copy:K76:54; ak current form:K76:70)
		: ($command="paste")
			INVOKE ACTION:C1439(ak paste:K76:55; ak current form:K76:70)
	End case 
	
End if 
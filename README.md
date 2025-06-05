![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)

# 4d-tips-copy-paste
Example of using the pasteboard with standard actions

<img src="https://github.com/user-attachments/assets/2107e131-86cd-4eaa-beb1-b9b3e4bcecf8" width=400 height=auto />

## The Buttons

it's important the copy/paste/cut buttons do not take away the focus. the buttons have their properties defined in css:

```css
button.edit {
	focusable: false;
}
button.copy {
	action: "copy";
}
button.paste {
	action: "paste";
}
button.cut {
	action: "cut";
}
```

> [!TIP]
> you can define them directly in the property list if you prefer.

### The Menu

the 4th button creates a popup menu that calls [`INVOKE ACTION`](https://doc.4d.com/4Dv20/4D/20.6/INVOKE-ACTION.301-7488119.en.html):

```4d
If (FORM Event.code=On Clicked)
	
	$menu:=Create menu
	
	APPEND MENU ITEM($menu; "cut")
	SET MENU ITEM PARAMETER($menu; -1; "cut")
	GET HIGHLIGHT(*; OBJECT Get name(Object with focus); $start; $end)
	If (($end-$start)=0)
		DISABLE MENU ITEM($menu; -1)
	End if 
	
	APPEND MENU ITEM($menu; "copy")
	SET MENU ITEM PARAMETER($menu; -1; "copy")
	GET HIGHLIGHT(*; OBJECT Get name(Object with focus); $start; $end)
	If (($end-$start)=0)
		DISABLE MENU ITEM($menu; -1)
	End if 
	
	APPEND MENU ITEM($menu; "paste")
	SET MENU ITEM PARAMETER($menu; -1; "paste")
	If (Pasteboard data size("public.utf8-plain-text")<0)
		DISABLE MENU ITEM($menu; -1)
	End if 
	
	$command:=Dynamic pop up menu($menu)
	RELEASE MENU($menu)
	
	Case of 
		: ($command="cut")
			INVOKE ACTION(ak cut; ak current form)
		: ($command="copy")
			INVOKE ACTION(ak copy; ak current form)
		: ($command="paste")
			INVOKE ACTION(ak paste; ak current form)
	End case 
	
End if 
```

> [!TIP]
> you can also define the menu action directly with [`SET MENU ITEM PROPERTY`](https://doc.4d.com/4Dv20/4D/20.6/SET-MENU-ITEM-PROPERTY.301-7487932.en.html)

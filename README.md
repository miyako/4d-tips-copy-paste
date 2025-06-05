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

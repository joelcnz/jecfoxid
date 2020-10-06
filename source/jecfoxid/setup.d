module jecfoxid.setup;

import jecfoxid.base;

bool extraSetup() @safe {
	Window win;
	gDisplay = new Display();
}

bool initKeys() {
	g_keystate = SDL_GetKeyboardState(null);
	foreach(tkey; cast(SDL_Scancode)0 .. SDL_NUM_SCANCODES)
		g_keys ~= new TKey(cast(SDL_Scancode)tkey);

	return g_keys.length == SDL_NUM_SCANCODES;
}

void guiSetup() {
	SDL_Color col = {0xFF, 0xFF, 0, 0xFF};

	auto test = new Wedget("projects", JRectangle(SDL_Rect(20,20,300,400), BoxStyle.solid, col));

	int take = 100;
	g_guiFile.setup([
		new Wedget("projects", JRectangle(SDL_Rect(20,20,300,400 - take), BoxStyle.solid, col)),
		new EditBox("save", JRectangle(SDL_Rect(20,425 - take,300,20), BoxStyle.solid, col), "Save name: "),
		new EditBox("load", JRectangle(SDL_Rect(20,450 - take,300,20), BoxStyle.solid, col), "Load name: "),
		new EditBox("rename", JRectangle(SDL_Rect(20,475 - take,300,20), BoxStyle.solid, col), "Rename: "),
		new EditBox("delete", JRectangle(SDL_Rect(20,500 - take,300,20), BoxStyle.solid, col), "Delete name: "),
		new Wedget("current", JRectangle(SDL_Rect(20,525 - take,300,20), BoxStyle.solid, col))
		]);
	g_guiFile.getWedgets[WedgetFile.projects].focusAble = false;
	g_guiFile.getWedgets[WedgetFile.current].focusAble = false;
	
	int xpos = 320;
	g_guiConfirm.setup([
		new Wedget("sure", JRectangle(SDL_Rect(xpos + 20,20,300,60), BoxStyle.solid, col)),
		new Button("no", JRectangle(SDL_Rect(xpos + 20,85,140,20), BoxStyle.solid, col), "No"),
		new Button("yes", JRectangle(SDL_Rect(xpos + 20 + 160,85,140,20), BoxStyle.solid, col), "Yes"),
	]);
	g_guiConfirm.getWedgets[StateConfirm.ask].focusAble = false;
}

//Frees media and shuts down SDL
void close()
{
	/+
	//Destroy window
	SDL_DestroyWindow( gWindow );

	//Destroy texture
	SDL_DestroyTexture(gTexture);

	if (gFont) TTF_CloseFont(gFont);

	gSndCtrl.onCleanup;

	//Quit SDL subsystems
	SDL_Quit();
	IMG_Quit();
	TTF_Quit();
	SDL_AudioQuit();
	+/
}
